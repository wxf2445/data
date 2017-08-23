package cn.com.jtang.dao.custom;

import cn.com.jtang.po.Template;
import cn.com.jtang.po.TemplateExample;
import cn.com.jtang.po.custom.TemplateMultiSelect;

import java.util.List;

public interface TemplateViewMapper {
    List<TemplateMultiSelect> selectByExample(TemplateExample example);

}