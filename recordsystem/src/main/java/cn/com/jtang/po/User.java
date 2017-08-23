package cn.com.jtang.po;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class User implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.userId
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String userid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.roleId
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private Integer roleid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.userName
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String username;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.pwd
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String pwd;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.email
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String email;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.usergroup
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String usergroup;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.phone
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String phone;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.teamname
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String teamname;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.teampeonum
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private Integer teampeonum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.schoolname
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String schoolname;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.teachername
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String teachername;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.applydata
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String applydata;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.checkresult
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private Boolean checkresult;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.isdelete
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private Boolean isdelete;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.description
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String description;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.createTime
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private Date createtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.editTime
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private Date edittime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.lastLogin
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private Date lastlogin;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.lastIP
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String lastip;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.reserved1
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String reserved1;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.reserved2
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String reserved2;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.reserved3
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private String reserved3;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.reservedi1
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private Long reservedi1;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.reservedi2
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private Long reservedi2;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.reservedd1
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private BigDecimal reservedd1;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user.reservedd2
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private BigDecimal reservedd2;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table user
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.userId
     *
     * @return the value of user.userId
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getUserid() {
        return userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.userId
     *
     * @param userid the value for user.userId
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setUserid(String userid) {
        this.userid = userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.roleId
     *
     * @return the value of user.roleId
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public Integer getRoleid() {
        return roleid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.roleId
     *
     * @param roleid the value for user.roleId
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.userName
     *
     * @return the value of user.userName
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.userName
     *
     * @param username the value for user.userName
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.pwd
     *
     * @return the value of user.pwd
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getPwd() {
        return pwd;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.pwd
     *
     * @param pwd the value for user.pwd
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.email
     *
     * @return the value of user.email
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.email
     *
     * @param email the value for user.email
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.usergroup
     *
     * @return the value of user.usergroup
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getUsergroup() {
        return usergroup;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.usergroup
     *
     * @param usergroup the value for user.usergroup
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setUsergroup(String usergroup) {
        this.usergroup = usergroup;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.phone
     *
     * @return the value of user.phone
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getPhone() {
        return phone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.phone
     *
     * @param phone the value for user.phone
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.teamname
     *
     * @return the value of user.teamname
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getTeamname() {
        return teamname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.teamname
     *
     * @param teamname the value for user.teamname
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setTeamname(String teamname) {
        this.teamname = teamname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.teampeonum
     *
     * @return the value of user.teampeonum
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public Integer getTeampeonum() {
        return teampeonum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.teampeonum
     *
     * @param teampeonum the value for user.teampeonum
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setTeampeonum(Integer teampeonum) {
        this.teampeonum = teampeonum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.schoolname
     *
     * @return the value of user.schoolname
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getSchoolname() {
        return schoolname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.schoolname
     *
     * @param schoolname the value for user.schoolname
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setSchoolname(String schoolname) {
        this.schoolname = schoolname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.teachername
     *
     * @return the value of user.teachername
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getTeachername() {
        return teachername;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.teachername
     *
     * @param teachername the value for user.teachername
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setTeachername(String teachername) {
        this.teachername = teachername;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.applydata
     *
     * @return the value of user.applydata
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getApplydata() {
        return applydata;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.applydata
     *
     * @param applydata the value for user.applydata
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setApplydata(String applydata) {
        this.applydata = applydata;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.checkresult
     *
     * @return the value of user.checkresult
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public Boolean getCheckresult() {
        return checkresult;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.checkresult
     *
     * @param checkresult the value for user.checkresult
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setCheckresult(Boolean checkresult) {
        this.checkresult = checkresult;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.isdelete
     *
     * @return the value of user.isdelete
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public Boolean getIsdelete() {
        return isdelete;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.isdelete
     *
     * @param isdelete the value for user.isdelete
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setIsdelete(Boolean isdelete) {
        this.isdelete = isdelete;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.description
     *
     * @return the value of user.description
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getDescription() {
        return description;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.description
     *
     * @param description the value for user.description
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.createTime
     *
     * @return the value of user.createTime
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.createTime
     *
     * @param createtime the value for user.createTime
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.editTime
     *
     * @return the value of user.editTime
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public Date getEdittime() {
        return edittime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.editTime
     *
     * @param edittime the value for user.editTime
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setEdittime(Date edittime) {
        this.edittime = edittime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.lastLogin
     *
     * @return the value of user.lastLogin
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public Date getLastlogin() {
        return lastlogin;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.lastLogin
     *
     * @param lastlogin the value for user.lastLogin
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setLastlogin(Date lastlogin) {
        this.lastlogin = lastlogin;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.lastIP
     *
     * @return the value of user.lastIP
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getLastip() {
        return lastip;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.lastIP
     *
     * @param lastip the value for user.lastIP
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setLastip(String lastip) {
        this.lastip = lastip;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.reserved1
     *
     * @return the value of user.reserved1
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getReserved1() {
        return reserved1;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.reserved1
     *
     * @param reserved1 the value for user.reserved1
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setReserved1(String reserved1) {
        this.reserved1 = reserved1;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.reserved2
     *
     * @return the value of user.reserved2
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getReserved2() {
        return reserved2;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.reserved2
     *
     * @param reserved2 the value for user.reserved2
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setReserved2(String reserved2) {
        this.reserved2 = reserved2;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.reserved3
     *
     * @return the value of user.reserved3
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public String getReserved3() {
        return reserved3;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.reserved3
     *
     * @param reserved3 the value for user.reserved3
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setReserved3(String reserved3) {
        this.reserved3 = reserved3;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.reservedi1
     *
     * @return the value of user.reservedi1
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public Long getReservedi1() {
        return reservedi1;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.reservedi1
     *
     * @param reservedi1 the value for user.reservedi1
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setReservedi1(Long reservedi1) {
        this.reservedi1 = reservedi1;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.reservedi2
     *
     * @return the value of user.reservedi2
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public Long getReservedi2() {
        return reservedi2;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.reservedi2
     *
     * @param reservedi2 the value for user.reservedi2
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setReservedi2(Long reservedi2) {
        this.reservedi2 = reservedi2;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.reservedd1
     *
     * @return the value of user.reservedd1
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public BigDecimal getReservedd1() {
        return reservedd1;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.reservedd1
     *
     * @param reservedd1 the value for user.reservedd1
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setReservedd1(BigDecimal reservedd1) {
        this.reservedd1 = reservedd1;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user.reservedd2
     *
     * @return the value of user.reservedd2
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public BigDecimal getReservedd2() {
        return reservedd2;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user.reservedd2
     *
     * @param reservedd2 the value for user.reservedd2
     *
     * @mbggenerated Mon Aug 01 17:23:28 CST 2016
     */
    public void setReservedd2(BigDecimal reservedd2) {
        this.reservedd2 = reservedd2;
    }
}