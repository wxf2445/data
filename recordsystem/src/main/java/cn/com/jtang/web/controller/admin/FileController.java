package cn.com.jtang.web.controller.admin;

import cn.com.jtang.converter.OfficeConvertor;
import cn.com.jtang.service.FileService;
import cn.com.jtang.service.LogService;
import cn.com.jtang.util.ConvertAVI;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.util.WaterPrint;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.icepdf.core.pobjects.Document;
import org.icepdf.core.pobjects.Page;
import org.icepdf.core.util.GraphicsRenderingHints;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller
@RequestMapping("/file")
@SessionAttributes({
        "dataSearchForm", "userSearchForm", "stypeSearchForm", "ctypeSearchForm", "searchForm",
        "companySearchForm", "sensorSearchForm", "ctypes", "stypes", "currentdeviceTypeSensor", "warningviews",
        "keySearchForm", "logSearchForm", "navid"
})
public class FileController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Value("${fileserverpath}")
    private String FileServerPath;

    @Resource
    private FileService fileService;
    
    @Resource
    private LogService logService;


    public boolean downloadFile(String filepath, String fileName, HttpServletResponse response) {
        boolean status = true;

        try {
            File file = new File(filepath);
            InputStream inputstream = new FileInputStream(file);
            if (inputstream == null) {
                return false;
            }
            

            fileName = URLDecoder.decode(fileName, "UTF-8");

            if (fileName.length() > 150) {
                fileName = new String(fileName.getBytes("gb2312"), "ISO8859-1");
            }

            response.setHeader("Content-Disposition", "attachment; filename*=utf-8'zh_cn'"+ fileName);
            response.setContentLength(inputstream.available());

            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(response.getOutputStream());

            byte[] buffer = new byte[inputstream.available()];

            inputstream.read(buffer);
            bufferedOutputStream.write(buffer);

            //fileOutputStream.writeTo(outputStream);
            bufferedOutputStream.flush();
            bufferedOutputStream.close();
        } catch (UnsupportedEncodingException e) {
            status = false;
        } catch (IOException e) {
            status = false;
        }

        return status;
    }


    @RequestMapping(
            value = "/download",
            method = RequestMethod.GET
    )
    public String userInfo(@RequestParam(
            value = "filepath",
            required = true
    ) String filepath, HttpServletResponse response, RedirectAttributes redirectAttributes, ModelMap model) {
        String filename = filepath.substring(filepath.lastIndexOf("/") + 1);
        boolean status = false;
        if (!StringUtils.isEmpty(filepath)) {
            status = downloadFile(filepath, filename, response);
        }
        redirectAttributes.addAttribute("downstatus", status);

        String href = null;
        if (!status) {
            href = "redirect:/index";
        }
        return href;
    }


    @RequestMapping(
            value = "/openfile",
            method = RequestMethod.GET
    )
    public void openfile(@RequestParam(
            value = "filepath",
            required = true
    ) String filepath,@RequestParam(
            value = "n",
            required = false
    ) String n, HttpServletResponse response, RedirectAttributes redirectAttributes, ModelMap model) throws IOException {
        try {

            String suffix = filepath.substring(filepath.lastIndexOf(".") + 1);

            System.out.println(n);
            filepath = URLDecoder.decode(filepath, "utf-8");


            List<String> imageFormats = Arrays.asList(RecordUtil.ImageFormat);
            List<String> musicFormats = Arrays.asList(RecordUtil.MusicFormat);
            if((!imageFormats.contains(suffix.toLowerCase())&&!musicFormats.contains(suffix.toLowerCase()))||n!=null)
            	filepath = new String(filepath.getBytes("iso-8859-1"), "utf-8");

            if(suffix.toLowerCase().equals(RecordUtil.TifFormat))
            	filepath = filepath.substring(0,filepath.lastIndexOf(".")+1)+RecordUtil.JpgFormat;
            
            if(Arrays.asList(RecordUtil.AVIORMOVFormat).contains(suffix.toLowerCase())){
            	filepath = filepath.substring(0,filepath.lastIndexOf(".")+1)+"mp4";
            }

            
            System.out.println(n);
            //<<------------------------------->>
            new File(FileServerPath + "logs.txt").createNewFile();
            FileOutputStream out = new FileOutputStream(new File(FileServerPath + "logs.txt"));   
            if(!System.getProperty("os.name").toLowerCase().startsWith("win")){
            	/*out.write((new String(filepath.getBytes("utf-8"),"iso-8859-1")+"\r\n").getBytes());
            	out.write((filepath+"\r\n").getBytes());
            	filepath = new String(filepath.getBytes("iso-8859-1"),"utf-8");*/
            	out.write((FileServerPath + filepath+"\r\n").getBytes());
            }

            out.write(System.getProperty("os.name").getBytes());   

            out.close();   
            //<<------------------------------->>
            
            File file = new File(FileServerPath + filepath);
            FileInputStream in = new FileInputStream(file);
            OutputStream o = response.getOutputStream();
            //response.setHeader("Content-Disposition","attachment;filename=" + file.getName());

            List<String> officeFormats = Arrays.asList(RecordUtil.OfficeFormat);
            if (officeFormats.contains(suffix.toLowerCase())) {
                OfficeConvertor.officeToPdf(in, suffix, o, RecordUtil.PdfFormat);
            } else {
                int l = 0;
                byte[] buffer = new byte[in.available()];
                while ((l = in.read(buffer)) != -1) {
                    o.write(buffer, 0, l);
                }
                o.flush();
                in.close();
                o.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    


    @RequestMapping(
            value = "/getPicture",
            method = RequestMethod.GET
    )
    public void getPicture(@RequestParam(
            value = "filepath",
            required = true
		    ) String filepath,
		    @RequestParam(
		            value = "pagenum",
		            required = true
		    ) Integer pagenum, HttpServletResponse response, RedirectAttributes redirectAttributes, ModelMap model) throws IOException {
        try {

            filepath = URLDecoder.decode(filepath, "utf-8");
            filepath = new String(filepath.getBytes("iso-8859-1"),"utf-8");
            
            
            String filePath = FileServerPath + filepath;  
            Document document = new Document();  
      
            try {  
                document.setFile(filePath);  
                } catch (Exception ex) {  
            }  
            float scale = 1.3f;  
            float rotation = 0f;  
            File file = null;
           // for (int i = 0; i < document.getNumberOfPages(); i++) {  
                BufferedImage image = (BufferedImage)document.getPageImage(--pagenum,GraphicsRenderingHints.SCREEN,Page.BOUNDARY_CROPBOX, rotation, scale);  
                RenderedImage rendImage = image;  
                /*if(image.getWidth()*image.getHeight()>1600000){
                	
                    int width = (int)Math.sqrt((double)1600000*(image.getWidth()/image.getHeight()));

                    int height = 1600000/width;

                    image = new BufferedImage(width,height,image.getType());

                    Graphics g = image.getGraphics();

                    g.drawImage(image, 0,0,width,height,null);

                    g.dispose();
                }*/
                try {  
                    file = new File(FileServerPath +IDGenerator.generator()+".png");  
                    ImageIO.write(rendImage, "png", file);  
                    } catch (IOException e) {  
                    e.printStackTrace();  
                }  
                image.flush();  
                //System.out.println(image.getWidth()*image.getHeight());
            //}  
                
            document.dispose();  
        	
            FileInputStream in = new FileInputStream(file);
            OutputStream o = response.getOutputStream();
            int l = 0;
            byte[] buffer;
            if(in.available()<5000){
                buffer = new byte[5000];
            }else if(in.available()<50000){
                buffer = new byte[50000];
            }else{
                buffer = new byte[500000];
            }
            while ((l = in.read(buffer)) != -1) {
                o.write(buffer, 0, l);
            }
            o.flush();
            in.close();
            o.close();
            
            file.delete();
        } catch (Exception e) {
        	e.printStackTrace();
        }

    }

    @RequestMapping(
            value = "/downloadfile",
            method = RequestMethod.GET
    )
    public ResponseEntity<byte[]>/*void*/  downloadfile(@RequestParam(
            value = "filepath",
            required = true
    ) String filepath, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes, ModelMap model) throws IOException {
        try {

            filepath = URLDecoder.decode(filepath, "utf-8");
            //filepath = new String(filepath.getBytes("iso-8859-1"), "utf-8");
            File file = new File(FileServerPath + filepath);
            HttpHeaders headers = new HttpHeaders();
            //String fileName=new String("你好.xlsx".getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题 
            //filepath = new String( filepath.substring(filepath.lastIndexOf("/") + 1).getBytes("utf-8"),"iso-8859-1");
            
            filepath = filepath.substring(filepath.lastIndexOf("/") + 1);

            //解决文件中文乱码  
            String agent = request.getHeader("USER-AGENT"); 
          
            if (null != agent && -1 != agent.indexOf("MSIE") || null != agent && -1 != agent.indexOf("Trident")){  
            	filepath = URLEncoder.encode(filepath, "UTF-8");//IE浏览器 
            }else{  
            	filepath = new String(filepath.getBytes("UTF-8"), "ISO8859-1");
            }
                 
            
            headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + filepath + "\"");  
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                    headers, HttpStatus.OK);
        	
        } catch (Exception e) {
            //e.printStackTrace();
        }
        return null;

    }
    @RequestMapping(
            value = "/printfile",
            method = RequestMethod.GET
    )
    public void printfile(@RequestParam(
            value = "filepath",
            required = true
    ) String filepath,@RequestParam(
            value = "n",
            required = false
    ) String n, HttpServletResponse response, RedirectAttributes redirectAttributes, ModelMap model) throws IOException {
        try {

            String suffix = filepath.substring(filepath.lastIndexOf(".") + 1);

            System.out.println(n);
            filepath = URLDecoder.decode(filepath, "utf-8");
            
        	String waterprintpath = filepath.substring(0,filepath.lastIndexOf("."))+"_waterprint.pdf";
            
            System.out.println(n);


            String encoding="GBK";
            String lineTxt = null,lineTxts="";
            File f=new File(FileServerPath+"config.txt");
            if(!f.exists()){
            	f.createNewFile();
            }
            if(f.isFile()){ //判断文件是否存在
                InputStreamReader read = new InputStreamReader(
                new FileInputStream(f),encoding);//考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                while((lineTxt = bufferedReader.readLine()) != null){
                    //System.out.println(lineTxt);
                    lineTxts+=lineTxt;
                }
                read.close();
                //result.put("water_print", lineTxts);
            }else{
                System.out.println("找不到指定的文件");
            }
            
            List<String> officeFormats = Arrays.asList(RecordUtil.OfficeFormat);
        	if (officeFormats.contains(suffix.toLowerCase())) {
        		String prefixFilename = filepath.substring(0,filepath.lastIndexOf("."));
        		
        		OutputStream o = new FileOutputStream(FileServerPath + prefixFilename +".pdf");
        		File file = new File(FileServerPath + filepath);
                FileInputStream in = new FileInputStream(file);
                OfficeConvertor.officeToPdf(in, suffix, o, RecordUtil.PdfFormat);
                o.flush();
                o.close();

            	WaterPrint.setWatermark(FileServerPath + prefixFilename +".pdf", FileServerPath + waterprintpath ,lineTxts);
            	new File(FileServerPath + prefixFilename +".pdf").delete();
            }else {
            	WaterPrint.setWatermark(FileServerPath + filepath, FileServerPath + waterprintpath ,lineTxts);
            }

            File file = new File(FileServerPath + waterprintpath);
            FileInputStream in = new FileInputStream(file);
            OutputStream o = response.getOutputStream();
            //response.setHeader("Content-Disposition","attachment;filename=" + file.getName());

            int l = 0;
            byte[] buffer = new byte[in.available()];
            while ((l = in.read(buffer)) != -1) {
                o.write(buffer, 0, l);
            }
            o.flush();
            in.close();
            o.close();
            
            logService.insert("打印文件（"+filepath.substring(filepath.lastIndexOf("\\")+1,filepath.lastIndexOf("."))+"）");
        	
        	

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(
            value = "/printfile2",
            method = RequestMethod.GET
    )
    public ResponseEntity<byte[]> printfile2(@RequestParam(
            value = "filepath",
            required = true
    ) String filepath,@RequestParam(
            value = "n",
            required = false
    ) String n, HttpServletResponse response, RedirectAttributes redirectAttributes, ModelMap model) throws IOException {
        try {

            String suffix = filepath.substring(filepath.lastIndexOf(".") + 1);

            System.out.println(n);
            filepath = URLDecoder.decode(filepath, "utf-8");
            
        	String waterprintpath = filepath.substring(0,filepath.lastIndexOf("."))+"_waterprint.pdf";
            
            System.out.println(n);


            String encoding="GBK";
            String lineTxt = null,lineTxts="";
            File f=new File(FileServerPath+"config.txt");
            if(!f.exists()){
            	f.createNewFile();
            }
            if(f.isFile()){ //判断文件是否存在
                InputStreamReader read = new InputStreamReader(
                new FileInputStream(f),encoding);//考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                while((lineTxt = bufferedReader.readLine()) != null){
                    //System.out.println(lineTxt);
                    lineTxts+=lineTxt;
                }
                read.close();
                //result.put("water_print", lineTxts);
            }else{
                System.out.println("找不到指定的文件");
            }
            
            List<String> officeFormats = Arrays.asList(RecordUtil.OfficeFormat);
        	if (officeFormats.contains(suffix.toLowerCase())) {
        		String prefixFilename = filepath.substring(0,filepath.lastIndexOf("."));
        		
        		OutputStream o = new FileOutputStream(FileServerPath + prefixFilename +".pdf");
        		File file = new File(FileServerPath + filepath);
                FileInputStream in = new FileInputStream(file);
                OfficeConvertor.officeToPdf(in, suffix, o, RecordUtil.PdfFormat);
                o.flush();
                o.close();

            	WaterPrint.setWatermark(FileServerPath + prefixFilename +".pdf", FileServerPath + waterprintpath ,lineTxts);
            	new File(FileServerPath + prefixFilename +".pdf").delete();
            }else {
            	WaterPrint.setWatermark(FileServerPath + filepath, FileServerPath + waterprintpath ,lineTxts);
            }

            File file = new File(FileServerPath + waterprintpath);
            HttpHeaders headers = new HttpHeaders();
            headers.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + filepath + "\"");  
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            
            logService.insert("打印文件（"+filepath.substring(filepath.lastIndexOf("\\")+1,filepath.lastIndexOf("."))+"）");
            
            return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                    headers, HttpStatus.OK);
        	
        	

        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;

    }
    
    @ResponseBody
    @RequestMapping(value = "/getwaterprint", method = RequestMethod.POST)
    public Map<String, Object> getwaterprint(
            final RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        try {
            try {
                String encoding="GBK";
                File file=new File(FileServerPath+"config.txt");
                if(!file.exists()){
                	file.createNewFile();
                }
                if(file.isFile()){ //判断文件是否存在
                    InputStreamReader read = new InputStreamReader(
                    new FileInputStream(file),encoding);//考虑到编码格式
                    BufferedReader bufferedReader = new BufferedReader(read);
                    String lineTxt = null,lineTxts="";
                    while((lineTxt = bufferedReader.readLine()) != null){
                        System.out.println(lineTxt);
                        lineTxts+=lineTxt;
                    }
                    read.close();
                    result.put("water_print", lineTxts);
		        }else{
		            System.out.println("找不到指定的文件");
		        }
		        } catch (Exception e) {
		            System.out.println("读取文件内容出错");
		            e.printStackTrace();
		        }
            result.put("status", 1);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("status", 0);
        }

        return result;

    }

}


//~ Formatted by Jindent --- http://www.jindent.com
