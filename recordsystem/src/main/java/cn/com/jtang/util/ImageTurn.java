package cn.com.jtang.util;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;  
import java.io.IOException;
import java.io.OutputStream;  
  










import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.media.jai.JAI;  
import javax.media.jai.RenderedOp;  
  










import com.sun.media.jai.codec.BMPEncodeParam;  
import com.sun.media.jai.codec.ImageCodec;  
import com.sun.media.jai.codec.ImageEncoder;  
import com.sun.media.jai.codec.JPEGEncodeParam; 	
public class ImageTurn {
	public static void turn (String imgFrom,String imgTo) throws IOException{
		/* tif转换到jpg格式 */   
        RenderedOp src2 = JAI.create("fileload", imgFrom);  
        OutputStream os2 = new FileOutputStream(imgTo);  
        JPEGEncodeParam param2 = new JPEGEncodeParam();  
        //指定格式类型，jpg 属于 JPEG 类型  
        ImageEncoder enc2 = ImageCodec.createImageEncoder("JPEG", os2, param2);  
        enc2.encode(src2);  
        os2.close();  
          
          
        /*tif转换到bmp格式*/  
        /*String inputFile = "d:/img/b.tif";  
        String outputFile = "d:/img/b.bmp";  
        RenderedOp src = JAI.create("fileload", inputFile);  
        OutputStream os = new FileOutputStream(outputFile);  
        BMPEncodeParam param = new BMPEncodeParam();  
        ImageEncoder enc = ImageCodec.createImageEncoder("BMP", os,param);  
        enc.encode(src);  
        os.close();//关闭流  
          
        //其他的一样的方式转换  
*/	}
	public static boolean compressPic(String srcFilePath, String descFilePath)    
    {    
        File file = null;    
        BufferedImage src = null;    
        FileOutputStream out = null;    
        ImageWriter imgWrier;    
        ImageWriteParam imgWriteParams;    
    
        // 指定写图片的方式为 jpg    
        imgWrier = ImageIO.getImageWritersByFormatName("jpg").next();    
        imgWriteParams = new javax.imageio.plugins.jpeg.JPEGImageWriteParam(null);    
        // 要使用压缩，必须指定压缩方式为MODE_EXPLICIT    
        imgWriteParams.setCompressionMode(imgWriteParams.MODE_EXPLICIT);    
        // 这里指定压缩的程度，参数qality是取值0~1范围内，    
        imgWriteParams.setCompressionQuality((float)0.9);    
        imgWriteParams.setProgressiveMode(imgWriteParams.MODE_DISABLED);    
        ColorModel colorModel = ColorModel.getRGBdefault();    
        // 指定压缩时使用的色彩模式    
        imgWriteParams.setDestinationType(new javax.imageio.ImageTypeSpecifier(colorModel, colorModel    
                .createCompatibleSampleModel(16, 16)));    
    
        try    
        {    
            if(srcFilePath.equals(""))    
            {    
                return false;    
            }    
            else    
            {    
                file = new File(srcFilePath);    
                if(!file.exists())
                	return false;
                src = ImageIO.read(file);    
                out = new FileOutputStream(descFilePath);    
    
                imgWrier.reset();    
                // 必须先指定 out值，才能调用write方法, ImageOutputStream可以通过任何 OutputStream构造    
                imgWrier.setOutput(ImageIO.createImageOutputStream(out));    
                // 调用write方法，就可以向输入流写图片    
                imgWrier.write(null, new IIOImage(zoomInImage(src, 5), null, null), imgWriteParams);    
                out.flush();    
                out.close();    
            }    
        }    
        catch(Exception e)    
        {    
            e.printStackTrace();    
            return false;    
        }    
        return true;    
    }   
	public static BufferedImage zoomInImage(BufferedImage originalImage, Integer times) 
    { 
        int width = originalImage.getWidth() / times; 
        int height = originalImage.getHeight() / times; 
        BufferedImage newImage = new BufferedImage(width, height, originalImage.getType()); 
        Graphics g = newImage.getGraphics(); 
        g.drawImage(originalImage, 0, 0, width, height, null); 
        g.dispose(); 
        return newImage; 
    } 
}
