package cn.com.jtang.service;

import cn.com.jtang.po.RecordCategory;
import cn.com.jtang.po.RecordCategoryExample;
import cn.com.jtang.util.Page;

import java.util.List;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface RecordCategoryService {

    List<RecordCategory> selectAll();

    int deleteByExample(RecordCategoryExample example);

    int deleteByPrimaryKey(String id);

    int insert(RecordCategory record);

    List<RecordCategory> selectByExample(RecordCategoryExample example);

    Page selectByExample(RecordCategoryExample example, Page page);

    RecordCategory selectByPrimaryKey(String id);

    int updateByExampleSelective(RecordCategory record, RecordCategoryExample example);

    int updateByPrimaryKey(RecordCategory record);

    int updateByPrimaryKeySelective(RecordCategory record);

}


//~ Formatted by Jindent --- http://www.jindent.com
