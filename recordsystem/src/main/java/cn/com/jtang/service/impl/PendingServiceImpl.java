package cn.com.jtang.service.impl;

import cn.com.jtang.dao.PendingMapper;
import cn.com.jtang.po.Pending;
import cn.com.jtang.po.PendingExample;
import cn.com.jtang.service.PendingService;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("pendingService")
public class PendingServiceImpl implements PendingService {

    @Resource
    private PendingMapper pendingMapper;

    @Override
    public List<Pending> selectAll() {
        PendingExample example = new PendingExample();
        return pendingMapper.selectByExample(example);
    }

    @Override
    public int deleteByExample(PendingExample example) {
        return pendingMapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String id) {
        return pendingMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Pending record) {
        return pendingMapper.insert(record);
    }

    @Override
    public List<Pending> selectByExample(PendingExample example) {
        return pendingMapper.selectByExample(example);
    }

    @Override
    public Page selectByExample(PendingExample example, Page page) {
        page.retrievePage(pendingMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(pendingMapper.selectByExample(example));
        return page;
    }

    @Override
    public Pending selectByPrimaryKey(String id) {
        return pendingMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByExampleSelective(Pending record, PendingExample example) {
        return pendingMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByPrimaryKey(Pending record) {
        return pendingMapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Pending record) {
        return pendingMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int create(String fondsid, String recordtype, String volumeid, String recordids) {
        Pending pending = new Pending();
        pending.setId(IDGenerator.generator());
        pending.setVolumeid(volumeid);
        pending.setFondno(fondsid);
        pending.setRecordids(recordids);
        pending.setRecordtype(recordtype);
        pending.setCreatetime(new Date());
        pending.setStatus(RecordUtil.SUBMIT_CHECK);
        return pendingMapper.insert(pending);
    }


}
