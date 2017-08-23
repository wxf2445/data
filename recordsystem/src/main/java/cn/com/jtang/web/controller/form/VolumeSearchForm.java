package cn.com.jtang.web.controller.form;

import cn.com.jtang.web.controller.form.template.Column;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * Created by ZJUXP on 2016-07-11.
 */
public class VolumeSearchForm {
    String tableprefix;
    List<Column> record;
    List<Column> volume;
    private String key;
    private Integer page;
    private Integer size;
    private String typeid;
    private String pattern;
    private String id;
    private String orderByClause;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date starttime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endtime;

    public String getPattern() {
        return pattern;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public String getTypeid() {
        return typeid;
    }

    public void setTypeid(String typeid) {
        this.typeid = typeid;
    }

	public List<Column> getRecord() {
		return record;
	}

	public void setRecord(List<Column> record) {
		this.record = record;
	}

	public List<Column> getVolume() {
		return volume;
	}

	public void setVolume(List<Column> volume) {
		this.volume = volume;
	}

	public String getTableprefix() {
		return tableprefix;
	}

	public void setTableprefix(String tableprefix) {
		this.tableprefix = tableprefix;
	}


}
