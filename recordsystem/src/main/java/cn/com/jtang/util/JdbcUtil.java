package cn.com.jtang.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Class description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public class JdbcUtil {
    private static Properties prop;

    static {
        prop = new Properties();

        try {
            InputStream in = JdbcUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");

            prop.load(in);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * ѧ������
     * @return
     */
    public static Connection getAcademicConnection() {
        Connection con = null;

        try {
            Class.forName(prop.getProperty("jdbc.driver"));
            con = DriverManager.getConnection(prop.getProperty("jdbc.academicurl"),
                                              prop.getProperty("jdbc.username"),
                                              prop.getProperty("jdbc.password"));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return con;
    }

    /**
     * ������
     * @return
     */
    public static Connection getSConnection() {
        Connection con = null;

        try {
            Class.forName(prop.getProperty("jdbc.driver"));
            con = DriverManager.getConnection(prop.getProperty("jdbc.url"),
                                              prop.getProperty("jdbc.username"),
                                              prop.getProperty("jdbc.password"));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return con;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
