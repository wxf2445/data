package cn.com.jtang.po;

import java.io.Serializable;
import java.util.Date;

public class Pending implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pending.id
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    private String id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pending.volumeid
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    private String volumeid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pending.recordids
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    private String recordids;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pending.fondNo
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    private String fondno;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pending.recordtype
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    private String recordtype;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pending.status
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    private String status;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pending.createtime
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    private Date createtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table pending
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pending.id
     *
     * @return the value of pending.id
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pending.id
     *
     * @param id the value for pending.id
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pending.volumeid
     *
     * @return the value of pending.volumeid
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public String getVolumeid() {
        return volumeid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pending.volumeid
     *
     * @param volumeid the value for pending.volumeid
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public void setVolumeid(String volumeid) {
        this.volumeid = volumeid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pending.recordids
     *
     * @return the value of pending.recordids
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public String getRecordids() {
        return recordids;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pending.recordids
     *
     * @param recordids the value for pending.recordids
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public void setRecordids(String recordids) {
        this.recordids = recordids;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pending.fondNo
     *
     * @return the value of pending.fondNo
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public String getFondno() {
        return fondno;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pending.fondNo
     *
     * @param fondno the value for pending.fondNo
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public void setFondno(String fondno) {
        this.fondno = fondno;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pending.recordtype
     *
     * @return the value of pending.recordtype
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public String getRecordtype() {
        return recordtype;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pending.recordtype
     *
     * @param recordtype the value for pending.recordtype
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public void setRecordtype(String recordtype) {
        this.recordtype = recordtype;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pending.status
     *
     * @return the value of pending.status
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public String getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pending.status
     *
     * @param status the value for pending.status
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pending.createtime
     *
     * @return the value of pending.createtime
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pending.createtime
     *
     * @param createtime the value for pending.createtime
     *
     * @mbggenerated Wed Jul 06 16:06:21 CST 2016
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}