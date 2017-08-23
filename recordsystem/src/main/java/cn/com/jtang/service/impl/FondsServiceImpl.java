package cn.com.jtang.service.impl;

import cn.com.jtang.dao.FondsMapper;
import cn.com.jtang.dao.custom.FondsViewMapper;
import cn.com.jtang.po.Fonds;
import cn.com.jtang.po.FondsExample;
import cn.com.jtang.po.RecordType;
import cn.com.jtang.po.custom.FondsTree;
import cn.com.jtang.po.custom.RecordTree;
import cn.com.jtang.service.FondsService;
import cn.com.jtang.service.RecordTypeService;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.Page;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Transactional
@Service("fondsService")
public class FondsServiceImpl implements FondsService {

    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private FondsViewMapper fondsViewMapper;
    @Resource
    private FondsMapper fondsMapper;

    @Override
    public RecordTree createRecordTree() {
        List<Fonds> fondsList = selectAll();

        RecordTree tree = new RecordTree();
        List<FondsTree> fondsTrees = new ArrayList<>();
        FondsTree fondsTree = null;
        for (Fonds fonds : fondsList) {
            fondsTree = new FondsTree();
            fondsTree.setFonds(fonds);
            fondsTree.setRecordTypes(recordTypeService.selectByFondsId(fonds.getId()));
            fondsTrees.add(fondsTree);
        }

        tree.setFondss(fondsTrees);
        return tree;
    }

    @Override
    public List<Fonds> selectAll() {
        FondsExample example = new FondsExample();
        return fondsMapper.selectByExample(example);
    }

    @Override
    public int deleteByExample(FondsExample example) {
        return fondsMapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String id) {
    	List<String> recordtypeids = fondsMapper.deleteByPrimaryKey(id);
    	for(String recordtypeid:recordtypeids)
    		recordTypeService.deleteByPrimaryKey(recordtypeid);
        return 1;
    }

    @Override
    public int insert(Fonds record) {
        return fondsMapper.insert(record);
    }

    @Override
    public List<Fonds> selectByExample(FondsExample example) {
        return fondsViewMapper.selectByExample(example);
    }

    @Override
    public Page selectByExample(FondsExample example, Page page) {
        page.retrievePage(fondsViewMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(fondsViewMapper.selectByExample(example));
        return page;
    }

    @Override
    public Fonds selectByPrimaryKey(String id) {
        return fondsViewMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByExampleSelective(Fonds record, FondsExample example) {
        return fondsMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByPrimaryKey(Fonds record) {
        return fondsMapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Fonds record) {
        return fondsMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int create(String fondsname, String fondsno, String fondsdes, String shid) {

        Fonds fonds = new Fonds();
        fonds.setId(IDGenerator.generator());
        fonds.setName(fondsname);
        fonds.setFondsno(fondsno);
        fonds.setDes(fondsdes);
        fonds.setShid(shid);
        fonds.setCreatetime(new Date());

        return fondsViewMapper.insert(fonds);
    }


    @Override
    public boolean isNameExist(String typename) {
        FondsExample fondsExample = new FondsExample();
        FondsExample.Criteria criteria = fondsExample.createCriteria();

        criteria.andNameEqualTo(typename);
        List<Fonds> fonds = fondsMapper.selectByExample(fondsExample);
        return fonds != null && fonds.size() > 0;
    }

    @Override
    public boolean isNoExist(String fondsno) {
        FondsExample fondsExample = new FondsExample();
        FondsExample.Criteria criteria = fondsExample.createCriteria();

        criteria.andFondsnoEqualTo(fondsno);
        List<Fonds> fonds = fondsMapper.selectByExample(fondsExample);
        return fonds != null && fonds.size() > 0;
    }

    @Override
    public List<RecordType> getRecordType(String fondsid) {
        return fondsViewMapper.getRecordType(fondsid);
    }

    @Override
    public Fonds selectByFondsNo(String fondsNo) {
        FondsExample fondsExample = new FondsExample();
        FondsExample.Criteria criteria = fondsExample.createCriteria();

        criteria.andFondsnoEqualTo(fondsNo);
        List<Fonds> fonds = fondsViewMapper.selectByExample(fondsExample);
        return fonds != null && fonds.size() > 0 ? fonds.get(0) : null;
    }

    @Override
    public List<Fonds> selectHasRecordType() {
        FondsExample example = new FondsExample();
        example.setDistinct(true);
        return fondsViewMapper.selectHasRecordType(example);
    }

}
