package cn.com.jtang.service;

import cn.com.jtang.po.Deadline;
import cn.com.jtang.po.DeadlineExample;
import cn.com.jtang.util.Page;

import java.util.List;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface DeadlineService {

    int checkAndCreate(String deadline);

    boolean isExist(String deadline);

    List<Deadline> selectAll();

    int deleteByExample(DeadlineExample userexample);

    int deleteByPrimaryKey(int userid);

    int insert(Deadline record);

    List<Deadline> selectByExample(DeadlineExample example);

    Page selectByExample(DeadlineExample example, Page page);

    Deadline selectByPrimaryKey(int userid);

    int updateByExampleSelective(Deadline record, DeadlineExample example);

    int updateByPrimaryKey(Deadline record);

    int updateByPrimaryKeySelective(Deadline record);

}


//~ Formatted by Jindent --- http://www.jindent.com
