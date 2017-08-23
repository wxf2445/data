package cn.com.jtang.web.controller.form;

import cn.com.jtang.po.Record;
import cn.com.jtang.po.RecordVolume;

import java.io.Serializable;
import java.util.Map;

/**
 * Created by ZJUXP on 2016-07-04.
 */
public class RecordVolumeForm extends RecordVolume implements Serializable {

    String fonds;
    String recordtype;
    String address;
    String departmentStr;
    String deadlineStr;
    String yearStr;
    String mode;
    String shNo;
    String shCabNo;
    String shFloorNo;
    Map<String, String> customFields;
    Map<String, String> customIndexFields;

    public Map<String, String> getCustomIndexFields() {
        return customIndexFields;
    }

    public void setCustomIndexFields(Map<String, String> customIndexFields) {
        this.customIndexFields = customIndexFields;
    }

    public Map<String, String> getCustomFields() {
        return customFields;
    }

    public void setCustomFields(Map<String, String> customFields) {
        this.customFields = customFields;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFonds() {
        return fonds;
    }

    public void setFonds(String fonds) {
        this.fonds = fonds;
    }


    public String getRecordtype() {
        return recordtype;
    }

    public void setRecordtype(String recordtype) {
        this.recordtype = recordtype;
    }


    public String getShNo() {
        return shNo;
    }

    public void setShNo(String shNo) {
        this.shNo = shNo;
    }

    public String getShFloorNo() {
        return shFloorNo;
    }

    public void setShFloorNo(String shFloorNo) {
        this.shFloorNo = shFloorNo;
    }

    public String getShCabNo() {
        return shCabNo;
    }

    public void setShCabNo(String shCabNo) {
        this.shCabNo = shCabNo;
    }
    public String getDeadlineStr() {
        return deadlineStr;
    }

    public void setDeadlineStr(String deadlineStr) {
        this.deadlineStr = deadlineStr;
    }

    public String getDepartmentStr() {
        return departmentStr;
    }

    public void setDepartmentStr(String departmentStr) {
        this.departmentStr = departmentStr;
    }

    public String getYearStr() {
        return yearStr;
    }

    public void setYearStr(String yearStr) {
        this.yearStr = yearStr;
    }
}
