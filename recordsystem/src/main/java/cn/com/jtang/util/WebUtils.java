package cn.com.jtang.util;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * Created by ZJUXP on 2016-05-31.
 */
public class WebUtils {
    private static String classPath = WebUtils.class.getResource("/").getPath();
    private static String rootPath = classPath.substring(1, classPath.indexOf("/WEB-INF/classes"));
    private static String resourcePath = rootPath + "/resources/";


    public static void returnJson(HttpServletResponse response, Map<String, Object> result) {
        response.setContentType("text/html");
        try {
            response.getWriter().write(new JSONObject(result).toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getClassPath() {
        return classPath;
    }

    public static String getRootPath() {
        return rootPath;
    }

    public static String getResourcePath() {
        return resourcePath;
    }

    public static void main(String[] args) {
        String dd = WebUtils.class.getResource("/").getPath();
        System.out.println(dd);
        System.out.println(dd.indexOf("/WEB-INF/classes"));
    }

}
