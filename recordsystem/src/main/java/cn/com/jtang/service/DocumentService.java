package cn.com.jtang.service;

import cn.com.jtang.po.Document;
import cn.com.jtang.po.DocumentExample;
import cn.com.jtang.util.Page;

import java.util.List;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface DocumentService {

    List<Document> selectByRecord(String recordId, String fonsId, String recordTypeId);
    
    List<Document> selectByRecord(String recordId, String tableid);
    
    List<Document> selectByRecordNo(String recordNo, String tableprefix,String type);

    int deleteByExample(DocumentExample userexample);

    int deleteByPrimaryKey(String userid);

    int insert(Document record,String tableName);

    List<Document> selectByExample(DocumentExample example,String tablename);

    Page selectByExample(DocumentExample example, Page page,String tablename);

    Document selectByPrimaryKey(String userid,String tablename);

    int updateByExampleSelective(Document record, DocumentExample example);

    int updateByPrimaryKey(Document record);

    int updateByPrimaryKeySelective(Document record);

    void deleteByIds (String documentName, List<String> deleteDocIds);

    boolean isExist (String recordId, String relativePath, String documentTable);

    int deleteByRecordId (String recordid,String tableName);

    int deleteByRecordIds (List<String> deleteIds);

    List<String> getDocuments (String recordId, String relativePath, String documentTable);
}


//~ Formatted by Jindent --- http://www.jindent.com
