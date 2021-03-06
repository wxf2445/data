package cn.com.jtang.po;

import java.io.Serializable;
import java.util.Date;

public class Fonds implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fonds.id
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    private String id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fonds.name
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fonds.fondsNo
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    private String fondsno;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fonds.shid
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    private String shid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fonds.des
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    private String des;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column fonds.createtime
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    private Date createtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table fonds
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fonds.id
     *
     * @return the value of fonds.id
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fonds.id
     *
     * @param id the value for fonds.id
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fonds.name
     *
     * @return the value of fonds.name
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fonds.name
     *
     * @param name the value for fonds.name
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fonds.fondsNo
     *
     * @return the value of fonds.fondsNo
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public String getFondsno() {
        return fondsno;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fonds.fondsNo
     *
     * @param fondsno the value for fonds.fondsNo
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public void setFondsno(String fondsno) {
        this.fondsno = fondsno;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fonds.shid
     *
     * @return the value of fonds.shid
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public String getShid() {
        return shid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fonds.shid
     *
     * @param shid the value for fonds.shid
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public void setShid(String shid) {
        this.shid = shid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fonds.des
     *
     * @return the value of fonds.des
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public String getDes() {
        return des;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fonds.des
     *
     * @param des the value for fonds.des
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public void setDes(String des) {
        this.des = des;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column fonds.createtime
     *
     * @return the value of fonds.createtime
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column fonds.createtime
     *
     * @param createtime the value for fonds.createtime
     *
     * @mbggenerated Thu Jul 14 20:50:49 CST 2016
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}