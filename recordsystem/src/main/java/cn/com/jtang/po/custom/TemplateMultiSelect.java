package cn.com.jtang.po.custom;

import cn.com.jtang.po.Fonds;

import java.util.List;

/**
 * Created by ZJUXP on 2016-07-10.
 */
public class TemplateMultiSelect {
    Fonds fonds;
    List<RecordTypeView> recordTypeViews;

    public Fonds getFonds() {
        return fonds;
    }

    public void setFonds(Fonds fonds) {
        this.fonds = fonds;
    }

    public List<RecordTypeView> getRecordTypeViews() {
        return recordTypeViews;
    }

    public void setRecordTypeViews(List<RecordTypeView> recordTypeViews) {
        this.recordTypeViews = recordTypeViews;
    }
}
