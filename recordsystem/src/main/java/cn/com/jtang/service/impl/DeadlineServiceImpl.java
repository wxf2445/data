package cn.com.jtang.service.impl;

import cn.com.jtang.dao.DeadlineMapper;
import cn.com.jtang.po.Deadline;
import cn.com.jtang.po.DeadlineExample;
import cn.com.jtang.po.YearExample;
import cn.com.jtang.po.DepartmentExample.Criteria;
import cn.com.jtang.service.DeadlineService;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.Page;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("deadlineService")
public class DeadlineServiceImpl implements DeadlineService {

    @Resource
    private DeadlineMapper deadlineMapper;

    @Override
    public int checkAndCreate(String deadline) {
        int id = 0;
        DeadlineExample example = new DeadlineExample();
        DeadlineExample.Criteria criteria = example.createCriteria();

        criteria.andNameEqualTo(deadline);
        List<Deadline> deadlines = deadlineMapper.selectByExample(example);
        if (deadlines != null && deadlines.size() > 0) {
            id = deadlines.get(0).getId();
        } else {
            Deadline deadline1 = new Deadline();
            deadline1.setName(deadline);
            deadlineMapper.insert(deadline1);
            id = deadline1.getId();
        }
        return id;
    }

    @Override
    public boolean isExist(String deadline) {
        DeadlineExample example = new DeadlineExample();
        DeadlineExample.Criteria criteria = example.createCriteria();

        criteria.andNameEqualTo(deadline);
        List<Deadline> deadlines = deadlineMapper.selectByExample(example);
        return deadlines != null && deadlines.size() > 0;
    }

    @Override
    public List<Deadline> selectAll() {
        DeadlineExample example = new DeadlineExample();
        DeadlineExample.Criteria criteria = example.createCriteria();
        example.setOrderByClause("name asc");
        criteria.andStatusEqualTo(1);
        return deadlineMapper.selectByExample(example);
    }

    @Override
    public int deleteByExample(DeadlineExample example) {
        return deadlineMapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(int id) {
        return deadlineMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Deadline record) {
        return deadlineMapper.insert(record);
    }

    @Override
    public List<Deadline> selectByExample(DeadlineExample example) {
        return deadlineMapper.selectByExample(example);
    }

    @Override
    public Page selectByExample(DeadlineExample example, Page page) {
        page.retrievePage(deadlineMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(deadlineMapper.selectByExample(example));
        return page;
    }

    @Override
    public Deadline selectByPrimaryKey(int id) {
        return deadlineMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByExampleSelective(Deadline record, DeadlineExample example) {
        return deadlineMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByPrimaryKey(Deadline record) {
        return deadlineMapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Deadline record) {
        return deadlineMapper.updateByPrimaryKeySelective(record);
    }
}
