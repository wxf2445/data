package cn.com.jtang.util;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;


/**
 * �ʼ���������
 *
 * @author fg
 */
public class MailUtil {
    private final static String DefaultNick = "报名系统";
    private static Properties prop;

    static {
        prop = new Properties();

        try {
            InputStream in = JdbcUtil.class.getClassLoader().getResourceAsStream("mail.properties");

            prop.load(in);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * �ʼ�����
     *
     * @param title
     * @param text
     * @param mailto
     * @throws Exception
     */
    public static void sendMail(String title, String text, String mailto) throws Exception {

      /*  // �����ʼ�������
        JavaMailSenderImpl ms = new JavaMailSenderImpl();

        ms.setHost(prop.getProperty("mail.host"));

        // �Ƿ���Ҫ��¼��֤
        Properties mp = new Properties();

        mp.put("mail.smtp.auth", prop.getProperty("mail.auth"));
        ms.setJavaMailProperties(mp);
        ms.setUsername(prop.getProperty("mail.username"));
        ms.setPassword(prop.getProperty("mail.password"));

        // ��д�ʼ�����,�趨�ʼ�����
        SimpleMailMessage smm = new SimpleMailMessage();

        smm.setFrom(prop.getProperty("mail.username"));
        smm.setFrom("天津医康互联");
        smm.setTo(mailto);
        smm.setSubject(title);
        smm.setText(text);

        // �����ʼ�
        ms.send(smm);*/


        Properties props = System.getProperties();
        // 创建信件服务器
        props.put("mail.smtp.host", prop.getProperty("mail.host"));
        props.put("mail.smtp.auth", prop.getProperty("mail.auth"));
        props.put("mail.transport.protocol", "smtp");
        // 得到默认的对话对象
        Authenticator a = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                 /* return new PasswordAuthentication( prop.getProperty("mail.username"),  prop.getProperty("mail.password"));*/
                return new PasswordAuthentication(prop.getProperty("mail.username"), prop.getProperty("mail.password"));
            }
        };
        //创建Session实例
        Session session = Session.getDefaultInstance(props, a);
        //创建MimeMessage实例对象
        MimeMessage msg = new MimeMessage(session);
        //设置发信人
//        msg.setFrom(new InternetAddress(from));  
        //设置自定义发件人昵称
        String nick = "";
        try {
            nick = javax.mail.internet.MimeUtility.encodeText(DefaultNick);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        msg.setFrom(new InternetAddress(prop.getProperty("mail.username"), nick));
        //设置收信人
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailto));
        //设置发送日期
        msg.setSentDate(new Date());
        //设置邮件主题
        msg.setSubject(title);
        //设置邮件正文(纯文本 )
          /*msg.setText(text);  */
        //设置邮件正文(HTML格式 )
        msg.setContent(text, "text/html;charset = UTF-8");
        Transport.send(msg);
    }

    /**
     * ������
     *
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
