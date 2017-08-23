package cn.com.jtang.converter;

import com.artofsolving.jodconverter.DefaultDocumentFormatRegistry;
import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.DocumentFormat;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;

import java.io.*;
import java.net.ConnectException;

/**
 * Created by ZJUXP on 2016-10-13.
 */
public class OfficeConvertor {
    public static void officeToPdf(InputStream source, String sourceExtension, OutputStream dest, String destExtension) {
        //File inputFile = new File("document.doc");
        //File outputFile = new File("document.pdf");

        // connect to an OpenOffice.org instance running on port 8100
        OpenOfficeConnection connection = new SocketOpenOfficeConnection(8100);
        try {
            connection.connect();
        } catch (ConnectException e) {
            e.printStackTrace();
        }

        // convert
        //DocumentFormat sourceFormat = new DocumentFormat(source);
        DocumentConverter converter = new OpenOfficeDocumentConverter(connection);
        DefaultDocumentFormatRegistry formatReg = new DefaultDocumentFormatRegistry();
        DocumentFormat sourceFormat = formatReg.getFormatByFileExtension(sourceExtension);
        DocumentFormat destFormat = formatReg.getFormatByFileExtension(destExtension);
        converter.convert(source, sourceFormat, dest, destFormat);

        // close the connection
        connection.disconnect();
    }

    public static void main(String[] args) throws FileNotFoundException {
        String sourcePath = "E:/zhm/2016医康互联通讯录.xlsx";
        String destPath = "E:/zhm/2016.pdf";
        File inputFile = new File(sourcePath);
        File outputFile = new File(destPath);

        InputStream source = new FileInputStream(inputFile);
        FileOutputStream fileOutputStream = new FileOutputStream(outputFile);

        String sourceSuffix = sourcePath.substring(sourcePath.lastIndexOf(".") + 1);
        String destSuffix = destPath.substring(destPath.lastIndexOf(".") + 1);
        // connect to an OpenOffice.org instance running on port 8100
        OpenOfficeConnection connection = new SocketOpenOfficeConnection(8100);
        try {
            connection.connect();
        } catch (ConnectException e) {
            e.printStackTrace();
        }

        // convert
        DocumentConverter converter = new OpenOfficeDocumentConverter(connection);
        //converter.convert(inputFile, outputFile);
        //DocumentFormat sourceformat = new DocumentFormat("Microsoft Word", "application/msword", "doc");
        DefaultDocumentFormatRegistry formatReg = new DefaultDocumentFormatRegistry();
        DocumentFormat sourceformat = formatReg.getFormatByFileExtension(sourceSuffix);
        DocumentFormat destformat = formatReg.getFormatByFileExtension(destSuffix);
        converter.convert(source, sourceformat, fileOutputStream, destformat);
        // close the connection
        connection.disconnect();
    }
}
