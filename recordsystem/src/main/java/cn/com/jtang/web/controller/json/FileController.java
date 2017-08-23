package cn.com.jtang.web.controller.json;

import cn.com.jtang.service.FileService;
import cn.com.jtang.util.FileUtils;
import cn.com.jtang.util.OCRUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;





import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("jsonFileController")
@RequestMapping("/json/file")
public class FileController {
    @Resource
    private FileService fileService;
    @Value("${fileserverpath}")
    private String ROOT_PATH;

    /**
     * Method description rulefilepreview
     *
     * @param filepath
     * @return Map<String,Object>
     */
    @RequestMapping(
            value = "/filepreview",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map<String, Object> rulefilepreview(@RequestParam(
            value = "filepath",
            required = true
    ) String filepath, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();

        System.out.println("*****************rulefilepreview***************");
        System.out.println(ROOT_PATH+ filepath);
        /*try {
			filepath = URLDecoder.decode(filepath, "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}*/
        File file = new File(ROOT_PATH+ filepath);
        if(file.exists()){
            FileInputStream fileInputStream = null;
            try {
                fileInputStream = new FileInputStream(file);
                result.put("base64String",FileUtils.readImg(fileInputStream));
                fileInputStream.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }

        System.out.println("*****************endpreviuew***************");

        return result;
    }

    /**
     * Method description rulepicpreview
     *
     * @param request
     * @param filepath
     * @return Map<String,Object>
     */
    @RequestMapping(
            value = "/rulepicpreview",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map<String, Object> rulepicpreview(HttpServletRequest request, @RequestParam(
            value = "filepath",
            required = true
    ) String filepath) throws IOException {
        String nonspacepath = filepath.intern().trim();

        System.out.println("nonspacepath:" + nonspacepath + "------end");

        String filefullname = nonspacepath.substring(nonspacepath.lastIndexOf("/") + 1);
        Map<String, Object> result = new HashMap<String, Object>();
        String realpath = request.getServletContext().getRealPath("/");
        String imagerootpath = realpath + "/" + "resources" + "/" + "tempimage";
        File file = new File(imagerootpath);

        if (!file.exists()) {
            file.mkdir();
        }

        String imagepath = imagerootpath + "/" + filefullname;

        System.out.println("imagepath" + imagepath + "-----end");


        // FileCopyUtils.copy(transformRuleIO.readFile(nonspacepath),);
        //cn.com.jtang.util.FileUtils.write(transformRuleIO.readFile(nonspacepath), imagepath);
        cn.com.jtang.util.FileUtils.write(fileService.readFile(nonspacepath), imagepath);
        result.put("imagename", filefullname);


        return result;
    }


    /**
     * Method description isExist
     *
     * @param filepath
     * @return Map<String,Object>
     */
    @RequestMapping(
            value = "/isExist",
            method = RequestMethod.GET
    )
    @ResponseBody
    public Map<String, Object> isExist(@RequestParam(
            value = "filepath",
            required = true
    ) String filepath) throws IOException {
        Map<String, Object> result = new HashMap<String, Object>();

        //if (transformRuleIO.readFile(filepath) != null) {
        if (fileService.readFile(ROOT_PATH + filepath) != null) {
            result.put("isExist", true);
        } else {
            result.put("isExist", false);
        }

        return result;
    }



    @RequestMapping(
            value = "/orcresult",
            method = RequestMethod.GET
    )
    @ResponseBody
    public Map<String, Object> orcresult(@RequestParam(
            value = "divs",
            required = true
    ) String divs,@RequestParam(
            value = "image_src",
            required = true
    ) String filepath) throws IOException {
        Map<String, Object> result = new HashMap<String, Object>();
        filepath = URLDecoder.decode(filepath, "utf-8");
    	File f = new File(ROOT_PATH+filepath);
        BufferedImage image = ImageIO.read(f);
        
        String s = "";
        JSONArray maps = JSONArray.fromObject(divs);
        for(int i=0;i<maps.size();i++){
        	JSONObject map = maps.getJSONObject(i);
        	File tempf = new File(ROOT_PATH+"tesseract/");
        	if(!tempf.exists())
        		tempf.mkdirs();
        	String tempPath = "tesseract/"+System.currentTimeMillis()+i;
        	File f2 = new File(ROOT_PATH+tempPath+filepath.substring(filepath.lastIndexOf("/")+1));
        	ImageIO.write(image.getSubimage((int)map.get("x"), (int)map.get("y"),(int) map.get("w") ,(int) map.get("h")), "jpg", f2); 
        	System.out.println(map.toString());
        	try {
				s+=OCRUtil.recognizeText(f2)+"\r\n";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        result.put("result", s);
        return result;
    }

}


//~ Formatted by Jindent --- http://www.jindent.com
