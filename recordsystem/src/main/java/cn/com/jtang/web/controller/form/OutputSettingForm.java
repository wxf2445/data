package cn.com.jtang.web.controller.form;

import cn.com.jtang.po.OutputOrder;

import java.util.Map;

/**
 * Created by ZJUXP on 2016-08-30.
 */
public class OutputSettingForm extends OutputOrder {
    Map<String,String> width;

    public Map<String, String> getWidth() {
        return width;
    }

    public void setWidth(Map<String, String> width) {
        this.width = width;
    }
}
