package cn.com.jtang.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

/**
 * Created by ZJUXP on 2016-08-24.
 */
public class DateUtil {

    public static String format(Timestamp timestamp) {
        String tsStr = "";
        DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        try {
            tsStr = sdf.format(timestamp);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tsStr;
    }

    public static Date getThisWeek(Date now) {
        Calendar cal = Calendar.getInstance(Locale.CHINA);
        cal.setFirstDayOfWeek(Calendar.MONDAY);
        cal.setTime(now);
        cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);

        return cal.getTime();
    }

    public static Date getMonday(Date sunday) {
        return new Date(sunday.getTime() - 7 * 24 * 3600 * 1000l);
    }

    public static Date getThisMonthFirstDay(Date now) {
        Calendar c = Calendar.getInstance();
        c.add(Calendar.MONTH, 0);
        c.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
        return c.getTime();
    }

    public static Date getLastMonthFirstDay(Date now) {
        Calendar c = Calendar.getInstance();//获取当前日期
        c.add(Calendar.MONTH, -1);
        c.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
        return c.getTime();
    }

    public static Date getLastMonthFinalDay(Date now) {
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_MONTH, 0);
        return c.getTime();
    }

    public static Date getToday(Date now) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(now);
        calendar.add(calendar.DATE, 0);//把日期往后增加一天.整数往后推,负数往前移动
        return calendar.getTime();
    }

    public static Date getLastDay(Date now) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(now);
        calendar.add(calendar.DATE, -1);//把日期往后增加一天.整数往后推,负数往前移动
        return calendar.getTime();
    }
}
