package cn.com.jtang.po.custom;

import cn.com.jtang.po.RecordCategory;
import com.alibaba.fastjson.JSONArray;

/**
 * Created by ZJUXP on 2016-06-21.
 */
public class RecordTypeTree {

    RecordCategory recordCategory;

    JSONArray RecordCategoryContents;

    public RecordCategory getRecordCategory() {
        return recordCategory;
    }

    public void setRecordCategory(RecordCategory recordCategory) {
        this.recordCategory = recordCategory;
    }

    public JSONArray getRecordCategoryContents() {
        return RecordCategoryContents;
    }

    public void setRecordCategoryContents(JSONArray RecordCategoryContents) {
        this.RecordCategoryContents = RecordCategoryContents;
    }
}
