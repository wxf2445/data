package cn.com.jtang.service.impl;

import cn.com.jtang.dao.YearMapper;
import cn.com.jtang.po.DepartmentExample;
import cn.com.jtang.po.Year;
import cn.com.jtang.po.YearExample;
import cn.com.jtang.po.DepartmentExample.Criteria;
import cn.com.jtang.service.YearService;
import cn.com.jtang.util.Page;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("yearService")
public class YearServiceImpl implements YearService {

    @Resource
    private YearMapper yearMapper;

    @Override
    public int checkAndCreate(String year) {
        int id = 0;
        YearExample example = new YearExample();
        YearExample.Criteria criteria = example.createCriteria();

        criteria.andNameEqualTo(year);
        List<Year> years = yearMapper.selectByExample(example);
        if (years != null && years.size() > 0) {
            id = years.get(0).getId();
        } else {
            Year year1 = new Year();
            year1.setName(year);
            yearMapper.insert(year1);
            id = year1.getId();
        }
        return id;
    }

    @Override
    public boolean isExist(String year) {

        YearExample example = new YearExample();
        YearExample.Criteria criteria = example.createCriteria();

        criteria.andNameEqualTo(year);
        List<Year> years = yearMapper.selectByExample(example);
        return years != null && years.size() > 0;
    }

    @Override
    public List<Year> selectAll() {
        YearExample example = new YearExample();
        YearExample.Criteria criteria = example.createCriteria();
        criteria.andStatusEqualTo(1);
        example.setOrderByClause("name asc");
        return yearMapper.selectByExample(example);
    }

    @Override
    public int deleteByExample(YearExample example) {
        return yearMapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(int id) {
        return yearMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Year record) {
        return yearMapper.insert(record);
    }

    @Override
    public List<Year> selectByExample(YearExample example) {
        return yearMapper.selectByExample(example);
    }

    @Override
    public Page selectByExample(YearExample example, Page page) {
        page.retrievePage(yearMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(yearMapper.selectByExample(example));
        return page;
    }

    @Override
    public Year selectByPrimaryKey(int id) {
        return yearMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByExampleSelective(Year record, YearExample example) {
        return yearMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByPrimaryKey(Year record) {
        return yearMapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Year record) {
        return yearMapper.updateByPrimaryKeySelective(record);
    }
}
