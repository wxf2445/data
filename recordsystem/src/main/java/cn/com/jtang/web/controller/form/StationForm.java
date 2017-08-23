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
public class StationForm implements Serializable {
	int page = 1;
	int size = 10;

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
}
