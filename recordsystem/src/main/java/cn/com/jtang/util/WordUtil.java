package cn.com.jtang.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;

/**
 * Created by ZJUXP on 2016-06-21.
 */
public class WordUtil {
/*	public static void main(String[] args) {
		WordUtil wordUtil = new WordUtil();
		wordUtil.getWordText();
	}*/
	public String getWordText(String path){
		String str  = "";
        FileInputStream in;
		try {
			in = new FileInputStream("E:/14905127王欣峰.doc");
	        WordExtractor extractor = new WordExtractor(in);
	        try {
				str = extractor.getText();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
	        System.out.println(str);  
	        in.close();

	        InputStream is = new FileInputStream("E:/14905127王欣峰.docx");  
	        XWPFDocument doc = new XWPFDocument(is);  
	        XWPFWordExtractor extractor2 = new XWPFWordExtractor(doc);  
	        String text = extractor2.getText();  
	        is.close();
	        System.out.println(text);  
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
        return str;
	}
}
