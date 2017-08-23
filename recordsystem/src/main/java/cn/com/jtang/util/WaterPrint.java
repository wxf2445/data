package cn.com.jtang.util;

import java.awt.Color;  
import java.io.BufferedOutputStream;  
import java.io.BufferedReader;
import java.io.File;  
import java.io.FileInputStream;
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;  
import java.util.Calendar;  

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfGState;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
  
public class WaterPrint {  
    public static void main(String[] args) throws DocumentException,  
            IOException {          // 要输出的pdf文件  
        /*Calendar cal = Calendar.getInstance();  
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  */
        // 将pdf文件先加水印然后输出  
    	//String waterprintpath = filepath.substring(0,filepath.lastIndexOf("."))+"_waterprint.pdf";
        setWatermark("E:/1.pdf","E:/1_waterprint.pdf","博睿思达档案管理");  
    }  
  
    public static String setWatermark(String filepath,String waterprintpath,String water_print) throws DocumentException,  
            IOException {  
    	
        BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(waterprintpath)));  
        PdfReader reader = new PdfReader(filepath);  
        PdfStamper stamper = new PdfStamper(reader, bos);  
        int total = reader.getNumberOfPages() + 1;  
        PdfContentByte content;  
        BaseFont base = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H",BaseFont.EMBEDDED);  
        PdfGState gs = new PdfGState();  
        for (int i = 1; i < total; i++) {  
            content = stamper.getOverContent(i);// 在内容上方加水印  
            //content = stamper.getUnderContent(i);//在内容下方加水印  
            gs.setFillOpacity(0.3f);  
            
            content.setGState(gs);  
            content.beginText();  
            content.setColorFill(BaseColor.BLACK);  
            content.setFontAndSize(base, 50);  
            content.setTextMatrix(70, 200);  
            content.showTextAligned(Element.ALIGN_CENTER, water_print, 300,350, 55);  
            //Image image = Image.getInstance("D:/itext2.png");  
            /*img.setAlignment(Image.LEFT | Image.TEXTWRAP); 
            img.setBorder(Image.BOX); 
            img.setBorderWidth(10); 
            img.setBorderColor(BaseColor.WHITE); 
            img.scaleToFit(1000, 72);//大小 
            img.setRotationDegrees(-30);//旋转 */  
            //image.setAbsolutePosition(200, 206); // set the first background image of the absolute   
            //image.scaleToFit(200,200);  
            //content.addImage(image);  
            //content.setColorFill(Color.BLACK);  
            /*content.setFontAndSize(base, 8);  
            content.showTextAligned(Element.ALIGN_CENTER,"", 300, 10, 0);  */
            content.endText();  
           // content.restoreState();
  
        }  
        stamper.close(); 
        reader.close();
        bos.close();
        return waterprintpath;
    }  
} 
