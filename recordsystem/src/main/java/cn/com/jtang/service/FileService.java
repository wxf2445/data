package cn.com.jtang.service;

import java.io.IOException;
import java.io.InputStream;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface FileService {

    void writeTxt(String content, String path) throws IOException;

    void writeFile(InputStream inputStream, String path) throws IOException;

    String readTxt(String path) throws IOException;

    InputStream readFile(String path) throws IOException;

    void removeFile(String sqlpath);

    String writeAllFile(InputStream inputStream, String prefix,String suffix) throws IOException;
}


//~ Formatted by Jindent --- http://www.jindent.com
