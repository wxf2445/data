package cn.com.jtang.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

/**
 * Class description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public class SerializeUtil {

    /**
     * Method description serialize
     *
     *
     * @param object
     *
     * @return byte[] 
     */
    public static byte[] serialize(Object object) {
        ObjectOutputStream    oos  = null;
        ByteArrayOutputStream baos = null;

        try {

            // 序列化
            baos = new ByteArrayOutputStream();
            oos  = new ObjectOutputStream(baos);
            oos.writeObject(object);

            byte[] bytes = baos.toByteArray();

            return bytes;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Method description unserialize
     *
     *
     * @param bytes
     *
     * @return Object 
     */
    public static Object unserialize(byte[] bytes) {
        if (bytes == null) {
            return null;
        }

        ByteArrayInputStream bais = null;

        try {

            // 反序列化
            bais = new ByteArrayInputStream(bytes);

            ObjectInputStream ois = new ObjectInputStream(bais);

            return ois.readObject();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
