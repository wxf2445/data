package cn.com.jtang.service;

import cn.com.jtang.po.AddIndex;
import cn.com.jtang.po.IndexTable;
import cn.com.jtang.po.IndexTableExample;
import cn.com.jtang.util.Page;

import java.util.List;

/**
 * Interface description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public interface IndexTableService {

    boolean isExist(String indexTable);

    List<AddIndex> selectAllIndexValue(String tableName);

    int deleteByExample(IndexTableExample example);

    int deleteByPrimaryKey(int id);

    int insert(IndexTable record);

    List<IndexTable> selectByExample(IndexTableExample example);

    Page selectByExample(IndexTableExample example, Page page);

    IndexTable selectByPrimaryKey(int id);

    int updateByExampleSelective(IndexTable record, IndexTableExample example);

    int updateByPrimaryKey(IndexTable record);

    int updateByPrimaryKeySelective(IndexTable record);

    IndexTable getIndexValue(int id);
}


//~ Formatted by Jindent --- http://www.jindent.com
