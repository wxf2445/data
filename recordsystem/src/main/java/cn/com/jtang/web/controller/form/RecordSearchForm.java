package cn.com.jtang.web.controller.form;

import cn.com.jtang.web.controller.form.common.SearchForm;
import cn.com.jtang.web.controller.form.template.Column;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ZJUXP on 2016-06-21.
 */
public class RecordSearchForm extends SearchForm implements Serializable {

    Boolean isStore;
    String year;
    String deadline;
    String department;
    String rccId;
    String recordCatogory;
    String rtId;
    String fondsId;
    String status;
    List<Column> cols;


	public List<Column> getCols() {
		return cols;
	}

	public void setCols(List<Column> cols) {
		this.cols = cols;
	}

	public Boolean getStore() {
        return isStore;
    }

    public void setStore(Boolean store) {
        isStore = store;
    }
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getRecordCatogory() {
        return recordCatogory;
    }

    public void setRecordCatogory(String recordCatogory) {
        this.recordCatogory = recordCatogory;
    }

    public String getRtId() {
        return rtId;
    }

    public void setRtId(String rtId) {
        this.rtId = rtId;
    }

    public String getRccId() {
        return rccId;
    }

    public void setRccId(String rccId) {
        this.rccId = rccId;
    }

    public String getFondsId() {
        return fondsId;
    }

    public void setFondsId(String fondsId) {
        this.fondsId = fondsId;
    }
}
