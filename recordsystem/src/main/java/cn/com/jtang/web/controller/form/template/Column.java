package cn.com.jtang.web.controller.form.template;

/**
 * Created by ZJUXP on 2016-06-26.
 */
public class Column {

    String colid;
    String colname;
    String colwidth;
    String colvalue;
    String indexorvalue;

    public String getIndexorvalue() {
		return indexorvalue;
	}

	public void setIndexorvalue(String indexorvalue) {
		this.indexorvalue = indexorvalue;
	}

	public String getColvalue() {
        return colvalue;
    }

    public void setColvalue(String colvalue) {
        this.colvalue = colvalue;
    }

    public String getColid() {
        return colid;
    }

    public void setColid(String colid) {
        this.colid = colid;
    }

    public String getColname() {
        return colname;
    }

    public void setColname(String colname) {
        this.colname = colname;
    }

    public String getColwidth() {
        return colwidth;
    }

    public void setColwidth(String colwidth) {
        this.colwidth = colwidth;
    }
}
