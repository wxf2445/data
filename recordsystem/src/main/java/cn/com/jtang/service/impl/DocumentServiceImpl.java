package cn.com.jtang.service.impl;

import cn.com.jtang.dao.DocumentMapper;
import cn.com.jtang.dao.custom.DocumentViewMapper;
import cn.com.jtang.po.Document;
import cn.com.jtang.po.DocumentExample;
import cn.com.jtang.service.DanymicService;
import cn.com.jtang.service.DocumentService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.List;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Service("documentService")
@Transactional
public class DocumentServiceImpl implements DocumentService {
    @Resource
    private DocumentMapper mapper;
    @Resource
    private DocumentViewMapper documentViewMapper;
    @Resource
    private DanymicService danymicService;


    @Override
    public List<Document> selectByRecord(String recordId, String fonsId, String recordTypeId) {
        String tablePrefix = danymicService.getTablePrefix(fonsId, recordTypeId);

        DocumentExample example = new DocumentExample();
        DocumentExample.Criteria criteria = example.createCriteria();

        criteria.andRecordidEqualTo(recordId);

        return documentViewMapper.selectByExample(example, tablePrefix + RecordUtil.DOCUMENT);
    }

    @Override
    public List<Document> selectByRecord(String recordId, String tableid) {

        DocumentExample example = new DocumentExample();
        DocumentExample.Criteria criteria = example.createCriteria();

        criteria.andRecordidEqualTo(recordId);

        return documentViewMapper.selectByExample(example, tableid);
    }
    @Override
    public List<Document> selectByRecordNo(String recordNo, String tableprefix,String type) {
        return documentViewMapper.selectByRecordNo(recordNo, tableprefix,type);
    }

    @Override
    public int deleteByExample(DocumentExample example) {

        // TODO Auto-generated method stub
        return mapper.deleteByExample(example);
    }

    @Override
    public final int deleteByPrimaryKey(String id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public final int insert(Document record, String tableName) {
        return documentViewMapper.insert(record, tableName);
    }


    @Override
    public final List<Document> selectByExample(DocumentExample example, String tablename) {
        return mapper.selectByExample(example, tablename);
    }

    @Override
    public final Page selectByExample(DocumentExample example, Page page, String tablename) {
        tablename = tablename.toLowerCase();
        page.retrievePage(mapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(mapper.selectByExample(example, tablename));

        return page;
    }

    @Override
    public Document selectByPrimaryKey(String id,String tablename) {
        Document document = mapper.selectByPrimaryKey(id,tablename);

        return document;
    }


    @Override
    public int updateByExampleSelective(Document record, DocumentExample example) {

        // TODO Auto-generated method stub
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByPrimaryKey(Document record) {
        return mapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Document record) {

        // TODO Auto-generated method stub
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public void deleteByIds (String documentName, List<String> deleteDocIds) {
        DocumentExample documentExample = new DocumentExample();
        DocumentExample.Criteria criteria = documentExample.createCriteria();

        documentExample.setTableName(documentName);
        criteria.andIdIn(deleteDocIds);
        mapper.deleteByExample(documentExample);
    }

    @Override
    public boolean isExist (String recordId, String relativePath, String documentTable) {
        DocumentExample example = new DocumentExample();
        DocumentExample.Criteria criteria = example.createCriteria();
        example.setTableName(documentTable);

        criteria.andRecordidEqualTo(recordId);
        criteria.andPathEqualTo(relativePath);

        return mapper.countByExample(example)>0;
    }

    @Override
    public int deleteByRecordIds (List<String> deleteIds) {
        DocumentExample example = new DocumentExample();
        DocumentExample.Criteria criteria = example.createCriteria();

        criteria.andRecordidIn(deleteIds);
        return mapper.deleteByExample(example);
    }
    
    @Override
    public int deleteByRecordId (String recordid,String tableName) {
        DocumentExample example = new DocumentExample();
        DocumentExample.Criteria criteria = example.createCriteria();
        
        example.setTableName(tableName);
        criteria.andRecordidEqualTo(recordid);
        return mapper.deleteByExample(example);
    }

    @Override
    public List<String> getDocuments (String recordId, String relativePath, String documentTable) {
        DocumentExample example = new DocumentExample();
        DocumentExample.Criteria criteria = example.createCriteria();
        example.setTableName(documentTable);

        criteria.andRecordidEqualTo(recordId);
        criteria.andPathEqualTo(relativePath);

        return mapper.selectIDByExample(example,documentTable);
    }


    /**
     * Method description isEmpty
     *
     * @param list
     * @return boolean
     */
    private boolean isEmpty(List<?> list) {
        if (isNull(list)) {
            return true;
        } else {
            return list.isEmpty();
        }
    }

    /**
     * Method description isMoreThanOne
     *
     * @param list
     * @return boolean
     */
    private boolean isMoreThanOne(List<?> list) {
        if (isNullOrEmpty(list)) {
            return false;
        }

        if (list.size() > 1) {
            return true;
        }

        return false;
    }

    /**
     * Method description isNull
     *
     * @param object
     * @return boolean
     */
    private boolean isNull(Object object) {
        if (object == null) {
            return true;
        }

        return false;
    }

    /**
     * Method description isNullOrEmpty
     *
     * @param list
     * @return boolean
     */
    private boolean isNullOrEmpty(List<?> list) {
        if (isNull(list)) {
            return true;
        }

        if (isEmpty(list)) {
            return true;
        }

        return false;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
