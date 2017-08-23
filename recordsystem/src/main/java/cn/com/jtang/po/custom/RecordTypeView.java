package cn.com.jtang.po.custom;

import cn.com.jtang.po.RecordType;
import cn.com.jtang.po.Template;

import java.util.List;

/**
 * Created by ZJUXP on 2016-07-10.
 */
public class RecordTypeView {
    String recordTypeId;
    RecordType recordType;
    List<Template> templateList;

    public String getRecordTypeId() {
        return recordTypeId;
    }

    public void setRecordTypeId(String recordTypeId) {
        this.recordTypeId = recordTypeId;
    }

    public RecordType getRecordType() {
        return recordType;
    }

    public void setRecordType(RecordType recordType) {
        this.recordType = recordType;
    }

    public List<Template> getTemplateList() {
        return templateList;
    }

    public void setTemplateList(List<Template> templateList) {
        this.templateList = templateList;
    }
}
