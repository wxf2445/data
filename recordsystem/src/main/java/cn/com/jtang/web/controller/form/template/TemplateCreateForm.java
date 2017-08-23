package cn.com.jtang.web.controller.form.template;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ZJUXP on 2016-06-21.
 */
public class TemplateCreateForm implements Serializable {

    String fonds;
    String recordtype;
    String temname;
    List<Column> columns;
    List<Column> addcolumns;
    String description;

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

    public String getTemname() {
        return temname;
    }

    public void setTemname(String temname) {
        this.temname = temname;
    }

    public List<Column> getColumns() {
        return columns;
    }

    public void setColumns(List<Column> columns) {
        this.columns = columns;
    }
    public List<Column> getAddcolumns() {
        return addcolumns;
    }

    public void setAddcolumns(List<Column> addcolumns) {
        this.addcolumns = addcolumns;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}
