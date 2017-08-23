package cn.com.jtang.web.controller.form;

import cn.com.jtang.po.Record;
import cn.com.jtang.po.RecordVolume;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Created by ZJUXP on 2016-07-04.
 */
public class LogSearchForm implements Serializable {
	String operator;
	String key;
	String type;
	int page = 1;
	int size = 10;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date starttime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endtime;

	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
}
