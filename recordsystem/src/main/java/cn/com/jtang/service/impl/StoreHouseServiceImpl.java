package cn.com.jtang.service.impl;

import cn.com.jtang.dao.STRecordMapper;
import cn.com.jtang.dao.StoreHouseMapper;
import cn.com.jtang.po.STRecord;
import cn.com.jtang.po.StoreHouse;
import cn.com.jtang.po.StoreHouseExample;
import cn.com.jtang.resulthandler.MapResultHandler;
import cn.com.jtang.resulthandler.SensorResultHandler;
import cn.com.jtang.service.LogService;
import cn.com.jtang.service.StoreHouseService;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("storeHouseService")
public class StoreHouseServiceImpl implements StoreHouseService {

    @Resource
    private StoreHouseMapper storeHouseMapper;
    @Resource
    private STRecordMapper stRecordMapper;
    @Resource
    private LogService logService;

    @Override
    public List<StoreHouse> selectAll() {
        StoreHouseExample example = new StoreHouseExample();
        return storeHouseMapper.selectByExample(example);
    }

    @Override
    public int deleteByExample(StoreHouseExample example) {
        return storeHouseMapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String id) {
    	StoreHouse storeHouse = storeHouseMapper.selectByPrimaryKey(id);
        logService.insert("删除了库房---" + storeHouse.getName());
        return storeHouseMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(StoreHouse record) {
        record.setId(IDGenerator.generator());
        record.setCreatetime(new Date());
        logService.insert("创建了库房---" + record.getName());
        return storeHouseMapper.insert(record);
    }

    @Override
    public List<StoreHouse> selectByExample(StoreHouseExample example) {
        return storeHouseMapper.selectByExample(example);
    }

    @Override
    public Page selectByExample(StoreHouseExample example, Page page) {
        page.retrievePage(storeHouseMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(storeHouseMapper.selectByExample(example));
        return page;
    }

    @Override
    public StoreHouse selectByPrimaryKey(String id) {
        return storeHouseMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByExampleSelective(StoreHouse record, StoreHouseExample example) {
        logService.insert("修改库房---" + record.getName());
        return storeHouseMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByPrimaryKey(StoreHouse record) {
        logService.insert("修改库房---" + record.getName());
        return storeHouseMapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(StoreHouse record) {
        logService.insert("修改库房---" + record.getName());
        return storeHouseMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int edit(StoreHouse storeHouse) {
        logService.insert("修改库房---" + storeHouse.getName());
        return storeHouseMapper.updateByPrimaryKeySelective(storeHouse);
    }

    @Override
    public boolean isExistByName(String name) {
        StoreHouseExample example = new StoreHouseExample();
        StoreHouseExample.Criteria criteria = example.createCriteria();

        criteria.andNameEqualTo(name);

        List<StoreHouse> storeHouses = storeHouseMapper.selectByExample(example);

        return storeHouses != null && storeHouses.size() > 0;
    }

    @Override
    public boolean isExistByNo(String no) {
        StoreHouseExample example = new StoreHouseExample();
        StoreHouseExample.Criteria criteria = example.createCriteria();

        criteria.andNoEqualTo(no);

        List<StoreHouse> storeHouses = storeHouseMapper.selectByExample(example);

        return storeHouses != null && storeHouses.size() > 0;
    }

    @Override
    public int recordInfo(STRecord stRecord) {
        stRecord.setRecordtime(new Date());
        return stRecordMapper.insert(stRecord);
    }

    @Override
    public Map<String, Object> getSensorData(String id) {
        SensorResultHandler mapResultHandler = new SensorResultHandler();
        stRecordMapper.initSensorData(id,mapResultHandler);
        return mapResultHandler.getMappedResults();
    }

}
