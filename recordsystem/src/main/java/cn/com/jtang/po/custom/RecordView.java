package cn.com.jtang.po.custom;

import cn.com.jtang.po.Record;

import java.io.Serializable;
import java.util.Date;

public class RecordView extends Record implements Serializable {

    private String yearString;
    private String deadlineString;
    private String departmentString;

    public String getYearString() {
        return yearString;
    }

    public void setYearString(String yearString) {
        this.yearString = yearString;
    }

    public String getDepartmentString() {
        return departmentString;
    }

    public void setDepartmentString(String departmentString) {
        this.departmentString = departmentString;
    }

    public String getDeadlineString() {
        return deadlineString;
    }

    public void setDeadlineString(String deadlineString) {
        this.deadlineString = deadlineString;
    }

}