package cn.com.jtang.service.impl;

import cn.com.jtang.dao.InfoMapper;
import cn.com.jtang.dao.custom.InfoViewMapper;
import cn.com.jtang.po.Info;
import cn.com.jtang.po.InfoExample;
import cn.com.jtang.po.Template;
import cn.com.jtang.service.InfoService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.template.Column;
import cn.com.jtang.web.controller.form.template.TemplateCreateForm;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("infoService")
public class InfoServiceImpl implements InfoService {

    @Resource
    private InfoMapper infoMapper;
    @Resource
    private InfoViewMapper infoViewMapper;

    @Override
    public List<Info> getCommonColumn() {
        List<Info> infos = new ArrayList<>();
        Info info = new Info();
        info.setColumnid("sourcefile");
        info.setColumnname("源文件");
        infos.add(info);
        info = new Info();
        info.setColumnid("pagenum");
        info.setColumnname("页数");
        infos.add(info);
        return infos;
    }

    @Override
    public int createInfo(TemplateCreateForm templateCreateForm, Template template, int i) {
        List<Column> columns = i==0?templateCreateForm.getColumns():templateCreateForm.getAddcolumns();
        Info info = null;
        if(columns!=null){
            for (Column column : columns) {

                if (!Arrays.asList(RecordUtil.COLUMN_NOT_IN).contains(column.getColname())) {
                    info = new Info();
                    info.setTableid(template.getTableid());
                    info.setPiecetableid(template.getPiecetableid());
                    info.setColumnid(column.getColid());
                    info.setColumnname(column.getColname());
                    info.setColumnwidth(column.getColwidth());
                    infoMapper.insert(info);
                }
            }
        }

        return templateCreateForm.getColumns().size();
    }

    @Override
    public List<Info> selectByTempleId(String id) {

        InfoExample example = new InfoExample();
        InfoExample.Criteria criteria = example.createCriteria();

        example.setOrderByClause("columnid asc");
        criteria.andTableidEqualTo(id);

        List<Info> infos = infoMapper.selectByExample(example);
        infos.addAll(getCommonColumn());

        return infos;
    }

    @Override
    public List<Info> selectByPieceId(String id) {
        InfoExample example = new InfoExample();
        InfoExample.Criteria criteria = example.createCriteria();
        example.setOrderByClause("columnid asc");
        criteria.andPiecetableidEqualTo(id);

        List<Info> infos = infoMapper.selectByExample(example);
        infos.addAll(getCommonColumn());

        return infos;
    }

    @Override
    public int deleteByExample(InfoExample example) {
        return infoMapper.deleteByExample(example);
    }

    @Override
    public int insert(Info record) {
        return infoMapper.insert(record);
    }

    @Override
    public List<Info> selectByExample(InfoExample example) {
        return infoMapper.selectByExample(example);
    }

    @Override
    public Page selectByExample(InfoExample example, Page page) {
        page.retrievePage(infoMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(infoMapper.selectByExample(example));
        return page;
    }

    @Override
    public int updateByExampleSelective(Info record, InfoExample example) {
        return infoMapper.updateByExampleSelective(record, example);
    }

    @Override
    public List<String> selectAllTemCol() {
        InfoExample example = new InfoExample();
        example.setDistinct(true);
        return infoViewMapper.selectAllCol(example);
    }

    @Override
    public List<Info> selectByColName(String colname) {
        InfoExample example = new InfoExample();
        InfoExample.Criteria criteria = example.createCriteria();
        criteria.andColumnnameEqualTo(colname);
        example.setDistinct(true);

        return infoViewMapper.selectByExample(example);
    }

    @Override
    public List<Info> selectRealByTempleId(String tableid) {

        InfoExample example = new InfoExample();
        InfoExample.Criteria criteria = example.createCriteria();

        example.setOrderByClause("columnid asc");
        criteria.andTableidEqualTo(tableid);

        List<Info> infos = infoMapper.selectByExample(example);

        return infos;

    }

    @Override
    public List<Info> selectRealByPieceId(String pieceid) {
        InfoExample example = new InfoExample();
        InfoExample.Criteria criteria = example.createCriteria();

        example.setOrderByClause("columnid asc");
        criteria.andPiecetableidEqualTo(pieceid);

        List<Info> infos = infoMapper.selectByExample(example);

        return infos;
    }

    @Override
    public int deleteByContentTableId(String contentTableId) {
        InfoExample infoExample = new InfoExample();
        InfoExample.Criteria criteria = infoExample.createCriteria();

        criteria.andTableidEqualTo(contentTableId);

        return infoMapper.deleteByExample(infoExample);
    }
}
