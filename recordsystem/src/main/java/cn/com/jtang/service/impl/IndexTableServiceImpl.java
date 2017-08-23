package cn.com.jtang.service.impl;

import cn.com.jtang.dao.AddIndexMapper;
import cn.com.jtang.dao.IndexTableMapper;
import cn.com.jtang.po.AddIndex;
import cn.com.jtang.po.AddIndexExample;
import cn.com.jtang.po.IndexTable;
import cn.com.jtang.po.IndexTableExample;
import cn.com.jtang.po.RecordExample;
import cn.com.jtang.service.IndexTableService;
import cn.com.jtang.util.Page;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;

/**
 * Created by ZJUXP on 2016-08-10.
 */
@Service("indexTableService")
public class IndexTableServiceImpl implements IndexTableService {
    @Resource
    private IndexTableMapper indexTableMapper;
    @Resource
    private AddIndexMapper addIndexMapper;

    @Override
    public boolean isExist(String indexTable) {
        return false;
    }

    @Override
    public List<AddIndex> selectAllIndexValue(String tableName) {
        AddIndexExample example = new AddIndexExample();
        AddIndexExample.Criteria criteria = example.createCriteria();
        criteria.andStatusEqualTo("1");
        example.setTableName(tableName);
        return addIndexMapper.selectByExample(example);
    }

    @Override
    public int deleteByExample(IndexTableExample example) {
        return 0;
    }

    @Override
    public int deleteByPrimaryKey(int id) {
        return 0;
    }

    @Override
    public int insert(IndexTable record) {
        return 0;
    }

    @Override
    public List<IndexTable> selectByExample(IndexTableExample example) {
        return null;
    }

    @Override
    public Page selectByExample(IndexTableExample example, Page page) {
        return null;
    }

    @Override
    public IndexTable selectByPrimaryKey(int id) {
        return null;
    }

    @Override
    public int updateByExampleSelective(IndexTable record, IndexTableExample example) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(IndexTable record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeySelective(IndexTable record) {
        return 0;
    }

    @Override
    public IndexTable getIndexValue (int id) {
        return indexTableMapper.selectByPrimaryKey(id);
    }
}
