package cn.com.jtang.service;

import cn.com.jtang.po.STRecord;
import cn.com.jtang.po.StoreHouse;
import cn.com.jtang.po.StoreHouseExample;
import cn.com.jtang.po.RecordType;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.common.SearchForm;

import java.util.List;
import java.util.Map;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface StoreHouseService {

    List<StoreHouse> selectAll();

    int deleteByExample(StoreHouseExample StoreHouseExample);

    int deleteByPrimaryKey(String id);

    int insert(StoreHouse record);

    List<StoreHouse> selectByExample(StoreHouseExample example);

    Page selectByExample(StoreHouseExample example, Page page);

    StoreHouse selectByPrimaryKey(String id);

    int updateByExampleSelective(StoreHouse record, StoreHouseExample example);

    int updateByPrimaryKey(StoreHouse record);

    int updateByPrimaryKeySelective(StoreHouse record);

    int edit(StoreHouse storeHouse);

    boolean isExistByName(String name);

    boolean isExistByNo(String no);

    int recordInfo(STRecord stRecord);

    Map<String,Object> getSensorData(String id);
}


//~ Formatted by Jindent --- http://www.jindent.com
