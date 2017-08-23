package cn.com.jtang.service;

import cn.com.jtang.po.Template;
import cn.com.jtang.po.TemplateExample;
import cn.com.jtang.po.custom.TemplateMultiSelect;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.template.TemplateCreateForm;

import java.util.List;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface TemplateService {

    List<TemplateMultiSelect> selectMultiSelectTemplate();

    List<Template> selectByTypeId(String typeId);

    int countByTypeId(String typeId);

    Template create(TemplateCreateForm form);

    void createAndInfo(TemplateCreateForm form);

    List<Template> selectAll();

    int deleteByExample(TemplateExample templateexample);

    int deleteByPrimaryKey(String templateid);

    int insert(Template record);

    List<Template> selectByExample(TemplateExample example);

    Page selectByExample(TemplateExample example, Page page);

    Template selectByPrimaryKey(String templateid);

    int updateByExampleSelective(Template record, TemplateExample example);

    int updateByPrimaryKey(Template record);

    int updateByPrimaryKeySelective(Template record);

    Template selectByRecordTypeId(String recordTypeId);

    boolean hasContent(String contentTableId);

    int edit(TemplateCreateForm templateCreateForm, String tableid);

    void forceDeleteByPrimaryKey(String contentTableId);

    List<Template> selectByName(String templatename);

    boolean isExistByName(String templatename);
}


//~ Formatted by Jindent --- http://www.jindent.com
