package cn.com.jtang.service.impl;

import cn.com.jtang.dao.FondsMapper;
import cn.com.jtang.dao.RecordTypeMapper;
import cn.com.jtang.dao.TemplateMapper;
import cn.com.jtang.dao.custom.TemplateViewMapper;
import cn.com.jtang.po.*;
import cn.com.jtang.po.custom.TemplateMultiSelect;
import cn.com.jtang.service.DanymicService;
import cn.com.jtang.service.InfoService;
import cn.com.jtang.service.TemplateService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.template.Column;
import cn.com.jtang.web.controller.form.template.TemplateCreateForm;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("templateService")
@Transactional
public class TemplateServiceImpl implements TemplateService {

    @Resource
    private TemplateMapper templateMapper;
    @Resource
    private TemplateViewMapper templateViewMapper;
    @Resource
    private FondsMapper fondsMapper;
    @Resource
    private RecordTypeMapper recordTypeMapper;
    @Resource
    private DanymicService danymicService;
    @Resource
    private InfoService infoService;


    @Override
    public List<TemplateMultiSelect> selectMultiSelectTemplate() {
        TemplateExample example = new TemplateExample();
        return templateViewMapper.selectByExample(example);
    }

    @Override
    public List<Template> selectByTypeId(String typeId) {
        TemplateExample example = new TemplateExample();
        TemplateExample.Criteria criteria = example.createCriteria();
        criteria.andRecordtypeidEqualTo(typeId);

        return templateMapper.selectByExample(example);
    }

    @Override
    public int countByTypeId(String typeId) {
        TemplateExample example = new TemplateExample();
        TemplateExample.Criteria criteria = example.createCriteria();
        criteria.andRecordtypeidEqualTo(typeId);

        return templateMapper.countByExample(example);
    }

    @Override
    public Template create(TemplateCreateForm form) {
        Fonds fonds = fondsMapper.selectByPrimaryKey(form.getFonds());
        RecordType recordType = recordTypeMapper.selectByPrimaryKey(form.getRecordtype());

        int num = recordType.getTemtableindex();
        num++;
        Template template = new Template();

        StringBuffer sb = new StringBuffer();
        sb.append(fonds.getFondsno()).append("_").append(recordType.getTypeno()).append(RecordUtil.RECORDCONTENT).append(num);
        template.setTableid(sb.toString().toLowerCase());

        sb = new StringBuffer();
        sb.append(fonds.getFondsno()).append("_").append(recordType.getTypeno()).append(RecordUtil.PIECECONTENT).append(num);
        template.setPiecetableid(sb.toString().toLowerCase());

        template.setName(form.getTemname());
        template.setRecordtypeid(form.getRecordtype());
        template.setDescription(form.getDescription());
        template.setCreatetime(new Date());
        templateMapper.insert(template);

        //update index
        RecordType upRecordType = new RecordType();
        upRecordType.setId(recordType.getId());
        upRecordType.setTemtableindex(num);
        recordTypeMapper.updateByPrimaryKeySelective(upRecordType);

        return template;
    }

    @Override
    public void createAndInfo(TemplateCreateForm form) {
        Template template = create(form);
        //create table
        danymicService.createTable(template, form);

        infoService.createInfo(form, template,0);
    }

    @Override
    public List<Template> selectAll() {
        TemplateExample example = new TemplateExample();
        return templateMapper.selectByExample(example);
    }

    @Override
    public int deleteByExample(TemplateExample example) {
        return templateMapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String id) {
        return templateMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Template record) {
        return templateMapper.insert(record);
    }

    @Override
    public List<Template> selectByExample(TemplateExample example) {
        return templateMapper.selectByExample(example);
    }

    @Override
    public Page selectByExample(TemplateExample example, Page page) {
        page.retrievePage(templateMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(templateMapper.selectByExample(example));
        return page;
    }

    @Override
    public Template selectByPrimaryKey(String id) {
        return templateMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByExampleSelective(Template record, TemplateExample example) {
        return templateMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByPrimaryKey(Template record) {
        return templateMapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Template record) {
        return templateMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public Template selectByRecordTypeId(String recordTypeId) {
        TemplateExample example = new TemplateExample();
        TemplateExample.Criteria criteria = example.createCriteria();

        criteria.andRecordtypeidEqualTo(recordTypeId);
        List<Template> templates = templateMapper.selectByExample(example);
        return templates != null && templates.size() > 0 ? templates.get(0) : null;
    }

    @Override
    public boolean hasContent(String contentTableId) {
        Template template = templateMapper.selectByPrimaryKey(contentTableId);
        boolean status = true;
        try{
            if(danymicService.countByTableId(template.getTableid())==0&&danymicService.countByTableId(template.getPiecetableid())==0){
                status = false;
            }
        }catch(Exception e){
        	
        }
        return status;
    }

    @Override
    public int edit(TemplateCreateForm templateCreateForm, String tableid) {
        Template template = new Template();
        template.setTableid(tableid);
        template.setName(templateCreateForm.getTemname());
        template.setDescription(templateCreateForm.getDescription());
        templateMapper.updateByPrimaryKeySelective(template);

        //updateInfoCol
        for(Column column : templateCreateForm.getColumns()){
            updateByCol(column,tableid);
        }

        //addInfoCol
        String pieceTableId = tableid.replace(RecordUtil.RECORDCONTENT,RecordUtil.PIECECONTENT);
        if(templateCreateForm.getAddcolumns()!=null){
            int i = templateCreateForm.getColumns().size();
            for (Column column : templateCreateForm.getAddcolumns()) {
                column.setColid(RecordUtil.COL_PREFIX + i);
                i++;
            }
            //addTableCol
            danymicService.addColumn(tableid,templateCreateForm.getAddcolumns());
            danymicService.addColumn(pieceTableId,templateCreateForm.getAddcolumns());
        }
        template.setPiecetableid(pieceTableId);
        infoService.createInfo(templateCreateForm, template,1);


        return 1;
    }

    @Override
    public void forceDeleteByPrimaryKey(String contentTableId) {
        Template template = templateMapper.selectByPrimaryKey(contentTableId);
        templateMapper.deleteByPrimaryKey(contentTableId);
        infoService.deleteByContentTableId(contentTableId);
        try{
            danymicService.dropTable(template.getTableid());
        }catch(Exception e){
        	
        }
        try{
            danymicService.dropTable(template.getPiecetableid());
        }catch(Exception e){
        	
        }
    }

    @Override
    public List<Template> selectByName(String templatename) {
        TemplateExample example = new TemplateExample();
        TemplateExample.Criteria criteria = example.createCriteria();

        criteria.andNameEqualTo(templatename);

        return templateMapper.selectByExample(example);
    }

    @Override
    public boolean isExistByName(String templatename) {
        List<Template> templates = selectByName(templatename);

        return templates!=null&&!templates.isEmpty();
    }

    private void updateByCol(Column column, String tableid) {
        InfoExample infoExample = new InfoExample();
        InfoExample.Criteria criteria = infoExample.createCriteria();

        criteria.andTableidEqualTo(tableid);
        criteria.andColumnidEqualTo(column.getColid());
        Info info = new Info();
        info.setColumnname(column.getColname());
        infoService.updateByExampleSelective(info,infoExample);
    }


}
