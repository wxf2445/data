package cn.com.jtang.po;

import java.io.Serializable;

public class DailyBack implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dailyback.week
     *
     * @mbggenerated Wed Sep 21 17:45:15 CST 2016
     */
    private Integer week;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column dailyback.cronexpression
     *
     * @mbggenerated Wed Sep 21 17:45:15 CST 2016
     */
    private String cronexpression;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table dailyback
     *
     * @mbggenerated Wed Sep 21 17:45:15 CST 2016
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dailyback.week
     *
     * @return the value of dailyback.week
     *
     * @mbggenerated Wed Sep 21 17:45:15 CST 2016
     */
    public Integer getWeek() {
        return week;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dailyback.week
     *
     * @param week the value for dailyback.week
     *
     * @mbggenerated Wed Sep 21 17:45:15 CST 2016
     */
    public void setWeek(Integer week) {
        this.week = week;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column dailyback.cronexpression
     *
     * @return the value of dailyback.cronexpression
     *
     * @mbggenerated Wed Sep 21 17:45:15 CST 2016
     */
    public String getCronexpression() {
        return cronexpression;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column dailyback.cronexpression
     *
     * @param cronexpression the value for dailyback.cronexpression
     *
     * @mbggenerated Wed Sep 21 17:45:15 CST 2016
     */
    public void setCronexpression(String cronexpression) {
        this.cronexpression = cronexpression;
    }
}