package cn.com.jtang.service.impl;

import cn.com.jtang.dao.RecordCategoryMapper;
import cn.com.jtang.po.RecordCategory;
import cn.com.jtang.po.RecordCategoryExample;
import cn.com.jtang.service.RecordCategoryService;
import cn.com.jtang.util.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("recordCategoryService")
public class RecordCategoryServiceImpl implements RecordCategoryService {

    @Resource
    private RecordCategoryMapper mapper;



    @Override
    public List<RecordCategory> selectAll() {
        RecordCategoryExample example = new RecordCategoryExample();
        return mapper.selectByExample(example);
    }

    @Override
    public int deleteByExample(RecordCategoryExample example) {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(RecordCategory record) {
        return mapper.insert(record);
    }

    @Override
    public List<RecordCategory> selectByExample(RecordCategoryExample example) {
        return mapper.selectByExample(example);
    }

    @Override
    public Page selectByExample(RecordCategoryExample example, Page page) {
        page.retrievePage(mapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(mapper.selectByExample(example));
        return page;
    }

    @Override
    public RecordCategory selectByPrimaryKey(String id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByExampleSelective(RecordCategory record, RecordCategoryExample example) {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByPrimaryKey(RecordCategory record) {
        return mapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(RecordCategory record) {
        return mapper.updateByPrimaryKeySelective(record);
    }
}
