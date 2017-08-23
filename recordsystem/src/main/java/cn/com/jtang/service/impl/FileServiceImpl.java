package cn.com.jtang.service.impl;

import cn.com.jtang.converter.OfficeConvertor;
import cn.com.jtang.service.FileService;
import cn.com.jtang.service.ShiroUserService;
import cn.com.jtang.util.ConvertAVI;
import cn.com.jtang.util.FileUtils;
import cn.com.jtang.util.ImageTurn;
import cn.com.jtang.util.RecordUtil;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.io.*;
import java.util.Arrays;
import java.util.List;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Service("fileService")
public class FileServiceImpl implements FileService {
    @Resource
    private ShiroUserService shiroUserService;
    @Value("${fileserverpath}")
    private String ROOT_PATH;
    
    @Override
    public void writeTxt(String content, String path) throws IOException {
        //transformRuleIO.writeText(content, path);
        FileUtils.saveTxt(content, mkDirIfNotExist(path));

    }

    private String mkDirIfNotExist(String path) throws IOException {
        String prePath = path.substring(0, path.lastIndexOf("/"));
        String fileName = path.substring(path.lastIndexOf("/") + 1);
        File file = new File(prePath);
        if (!file.exists()) {
            file.mkdirs();
        }
        file = new File(path);
        file.createNewFile();
        return path;
    }

    @Override
    public void writeFile(InputStream inputStream, String path) throws IOException {
        FileUtils.saveFile(inputStream, mkDirIfNotExist(path));
        //transformRuleIO.writeFile(inputStream, path);
    }

    @Override
    public String readTxt(String path) throws IOException {
        //String content = transformRuleIO.readText(path);
        //return content;
        InputStream is = readFile(path);
        return FileUtils.readTxt(is);
    }

    @Override
    public InputStream readFile(String path) throws IOException {
        File file = new File(path);
        return new FileInputStream(file);
        //InputStream is = transformRuleIO.readFile(path);
        //return is;
    }

    @Override
    public void removeFile(String sqlpath) {
        File file = new File(sqlpath);
        file.delete();
    }

    @Override
    public String writeAllFile(InputStream inputStream, String prefix, String suffix) throws IOException {
        //List<String> formats = Arrays.asList(RecordUtil.OfficeFormat);
        String path = "";
        /*if (formats.contains(suffix)) {
            path = prefix + "." + RecordUtil.PdfFormat;
            mkDirIfNotExist(path);
            FileOutputStream fileOutputStream = new FileOutputStream(path);
            OfficeConvertor.officeToPdf(inputStream, suffix, fileOutputStream, RecordUtil.PdfFormat);
        } else */
        if(RecordUtil.TifFormat.equals(suffix)){
            path = prefix + "." + suffix;
            writeFile(inputStream, mkDirIfNotExist(path));
            //System.out.println(System.getProperty("java.library.path"));
            //ImageTurn.turn(path, prefix+".jpg");
            //ZipImage.resetsize(path, path);
            ImageTurn.compressPic(path, prefix+".jpg");
        }else{
            path = prefix + "." + suffix;
            writeFile(inputStream, mkDirIfNotExist(path));
            
            if(Arrays.asList(RecordUtil.AVIORMOVFormat).contains(suffix)){
            	/*MutliThread thread = new MutliThread(path);
            	Thread t1 = new Thread(thread);  
                t1.start();*/
            	try{
                	if(ConvertAVI.convert(ROOT_PATH+"ffmpeg.exe", path, prefix + ".mp4"))
                		return path;
            	}catch(Exception e){
            		return null;
            	}
            }
        }
        return path;
    }

    /*class MutliThread extends Thread{
    	String path ;
        MutliThread(String path){
        	this.path = path;
        }
        public void run(){
        	String prefix = path.substring(0,path.lastIndexOf("."));
        	ConvertAVI.convert(ROOT_PATH+"ffmpeg.exe", path, prefix + ".mp4");
        }
    }*/
    

}


//~ Formatted by Jindent --- http://www.jindent.com
