import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFImageWriter;

import java.io.IOException;

/**
 * Created by ZJUXP on 2016-12-21.
 */
public class TestPdfBox {

    public static void main (String[] args) {
        String password = "";
        String pdfFile = "E:\\zhm\\叶老师项目\\数据库\\openfile.pdf";
        String outputPrefix = "E:\\zhm\\叶老师项目\\数据库\\openfile";
        String imageFormat = "jpg";//格式
        PDDocument document = null;
        try {
            document = PDDocument.load(pdfFile);
            PDFImageWriter imageWriter = new PDFImageWriter();
            imageWriter.writeImage(document, imageFormat, password, 1, 1, outputPrefix, 1, 100);
            //参数1-内部PDF文档，参数2-图片格式，参数3-密码，参数4-起始页，参数5-结束页，参数6-输出文件名，参数7-输出的图片色深--类型，参数8-还没研究
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
