package cn.com.jtang.service.impl;

import cn.com.jtang.dao.DepartmentMapper;
import cn.com.jtang.po.Deadline;
import cn.com.jtang.po.DeadlineExample;
import cn.com.jtang.po.Department;
import cn.com.jtang.po.DepartmentExample;
import cn.com.jtang.service.DepartmentService;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {

    @Resource
    private DepartmentMapper departmentMapper;


    @Override
    public int checkAndCreate(String department) {
        int id = 0;
        DepartmentExample example = new DepartmentExample();
        DepartmentExample.Criteria criteria = example.createCriteria();

        criteria.andNameEqualTo(department);
        List<Department> departments = departmentMapper.selectByExample(example);
        if (departments != null && departments.size() > 0) {
            id = departments.get(0).getId();
        } else {
            Department department1 = new Department();
            department1.setName(department);
            departmentMapper.insert(department1);
            id = department1.getId();
        }
        return id;
    }

    @Override
    public boolean isExist(String department) {
        DepartmentExample example = new DepartmentExample();
        DepartmentExample.Criteria criteria = example.createCriteria();

        criteria.andNameEqualTo(department);
        List<Department> departments = departmentMapper.selectByExample(example);
        return departments != null && departments.size() > 0;
    }

    @Override
    public List<Department> selectAll() {
        DepartmentExample example = new DepartmentExample();
        DepartmentExample.Criteria criteria = example.createCriteria();
        example.setOrderByClause("name asc");
        criteria.andStatusEqualTo(1);
        return departmentMapper.selectByExample(example);
    }

    @Override
    public int deleteByExample(DepartmentExample example) {
        return departmentMapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(int id) {
        return departmentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Department record) {
        return departmentMapper.insert(record);
    }

    @Override
    public List<Department> selectByExample(DepartmentExample example) {
        return departmentMapper.selectByExample(example);
    }

    @Override
    public Page selectByExample(DepartmentExample example, Page page) {
        page.retrievePage(departmentMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(departmentMapper.selectByExample(example));
        return page;
    }

    @Override
    public Department selectByPrimaryKey(int id) {
        return departmentMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByExampleSelective(Department record, DepartmentExample example) {
        return departmentMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByPrimaryKey(Department record) {
        return departmentMapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Department record) {
        return departmentMapper.updateByPrimaryKeySelective(record);
    }
}
