package cn.com.jtang.service;

import cn.com.jtang.po.Department;
import cn.com.jtang.po.DepartmentExample;
import cn.com.jtang.util.Page;

import java.util.List;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface DepartmentService {

    int checkAndCreate(String department);

    boolean isExist(String department);

    List<Department> selectAll();

    int deleteByExample(DepartmentExample userexample);

    int deleteByPrimaryKey(int userid);

    int insert(Department record);

    List<Department> selectByExample(DepartmentExample example);

    Page selectByExample(DepartmentExample example, Page page);

    Department selectByPrimaryKey(int userid);

    int updateByExampleSelective(Department record, DepartmentExample example);

    int updateByPrimaryKey(Department record);

    int updateByPrimaryKeySelective(Department record);

}


//~ Formatted by Jindent --- http://www.jindent.com
