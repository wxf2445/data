import org.apache.poi.POITextExtractor;
import org.apache.poi.hslf.extractor.PowerPointExtractor;
import org.apache.poi.hssf.extractor.ExcelExtractor;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.exceptions.OpenXML4JException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xslf.extractor.XSLFPowerPointExtractor;
import org.apache.poi.xssf.extractor.XSSFExcelExtractor;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.xmlbeans.XmlException;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * Created by ZJUXP on 2016-10-21.
 */
public class testPoi {
    public static void main(String[] args) {
        //extractOfficeFile("E:/zhm/testpoi/test.docx");
        extractOfficeFile("E:/14905127.docx");
        //extractOfficeFile("E:/zhm/testpoi/test.xls");
        //extractOfficeFile("E:/zhm/testpoi/test.xlsx");
        //extractOfficeFile("E:/zhm/testpoi/test.ppt");
        //extractOfficeFile("E:/zhm/testpoi/test.pptx");
    }

    public static void extractOfficeFile(String path) {
        String suffix = path.substring(path.lastIndexOf(".") + 1);
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(path);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        POITextExtractor textExtractor = null;
        try {
            if ("docx".equals(suffix)) {
                textExtractor = new XWPFWordExtractor(new XWPFDocument(fis));
                System.out.print(textExtractor.getText());
            } else if ("xlsx".equals(suffix)) {
                textExtractor = new XSSFExcelExtractor(new XSSFWorkbook(fis));
                System.out.print(textExtractor.getText());
            } else if ("pptx".equals(suffix)) {
                OPCPackage opcPackage = OPCPackage.open(fis);
                textExtractor = new XSLFPowerPointExtractor(opcPackage);
                System.out.print(textExtractor.getText());
            } else if ("xls".equals(suffix)) {
                ExcelExtractor excelExtractor = new ExcelExtractor(new HSSFWorkbook(fis));
                System.out.print(excelExtractor.getText());
            } else if ("ppt".equals(suffix)) {
                PowerPointExtractor powerPointExtractor = new PowerPointExtractor(fis);
                System.out.print(powerPointExtractor.getText());
            } else if ("doc".equals(suffix)) {
                WordExtractor extractor = new WordExtractor(fis);
                System.out.println(extractor.getText());
                /*POIFSFileSystem fileSystem = new POIFSFileSystem(fis);
// Firstly, get an extractor for the Workbook
                POIOLE2TextExtractor oleTextExtractor =
                        ExtractorFactory.createExtractor(fileSystem);
// Then a List of extractors for any embedded Excel, Word, PowerPoint
// or Visio objects embedded into it.
                POITextExtractor[] embeddedExtractors =
                        ExtractorFactory.getEmbededDocsTextExtractors(oleTextExtractor);
                for (POITextExtractor extractor : embeddedExtractors) {
                    // If the embedded object was an Excel spreadsheet.
                    if (textExtractor instanceof ExcelExtractor) {
                        ExcelExtractor excelExtractor = (ExcelExtractor) textExtractor;
                        System.out.println(excelExtractor.getText());
                    }
                    // A Word Document
                    else if (textExtractor instanceof WordExtractor) {
                        WordExtractor wordExtractor = (WordExtractor) textExtractor;
                        String[] paragraphText = wordExtractor.getParagraphText();
                        for (String paragraph : paragraphText) {
                            System.out.println(paragraph);
                        }
                        // Display the document's header and footer text
                        System.out.println("Footer text: " + wordExtractor.getFooterText());
                        System.out.println("Header text: " + wordExtractor.getHeaderText());
                    }
                    // PowerPoint Presentation.
                    else if (textExtractor instanceof PowerPointExtractor) {
                        PowerPointExtractor powerPointExtractor =
                                (PowerPointExtractor) textExtractor;
                        System.out.println("Text: " + powerPointExtractor.getText());
                        System.out.println("Notes: " + powerPointExtractor.getNotes());
                    }
                    // Visio Drawing
                    else if (textExtractor instanceof VisioTextExtractor) {
                        VisioTextExtractor visioTextExtractor =
                                (VisioTextExtractor) textExtractor;
                        System.out.println("Text: " + visioTextExtractor.getText());
                    }
                }*/
            }

        } catch (IOException e) {
            e.printStackTrace();
        } catch (InvalidFormatException e) {
            e.printStackTrace();
        } catch (XmlException e) {
            e.printStackTrace();
        } catch (OpenXML4JException e) {
            e.printStackTrace();
        }
    }
}
