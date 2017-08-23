package cn.com.jtang.service;

import cn.com.jtang.po.*;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.ColSearchForm;
import cn.com.jtang.service.impl.DanymicServiceImpl.InfoClass;
import cn.com.jtang.web.controller.form.template.Column;
import cn.com.jtang.web.controller.form.template.TemplateCreateForm;

import java.util.List;
import java.util.Map;

/**
 * Created by ZJUXP on 2016-07-01.
 */
public interface DanymicService {

    Map getMapValue(String tableName, String id);

    String getTablePrefix(String fonds, String recordtype);

    int createTable(Map params);

    int createTable(Template template, TemplateCreateForm templateCreateForm);

    void insertInfo(List<String> lists, Integer colSize, String tableId, String recordId);

    Map selectInfosByRecordId(String tableId, String recordId);

    List<List<InfoClass>> selectInfoByRecordId(String tablename,String type, String recordId);

    List<String> selectRecordIdsByRecordContent(ColSearchForm form);

    void deleteOldInfo(String tableId, String id);

    void selectPageByCols(List<String> cols, List<TableField> indexFields, String tableName, RecordExample example, Page pageObject);
    
    List<Object> selectByCols(List<String> cols, List<TableField> indexFields, String tableName, RecordExample example);

    int countByTableId(String tableid);

    void dropTable(String tableName);

    Map getColMapValue(String recordTypeId, String tableFieldType);

    String getTablePrefix(String recordTypeId);

    SearchPage selectVolumeRecord(String tableName, RecordExample example, SearchPage searchPage);

    int addColumn(String tableName,List<Column> cols);

    int selectCountByCols(String s, RecordExample pieceExample);

    RecordType getPrePath(String volumeno);

    void insertBatchDocuments(List<Document> documents, String documentTable);

    String selectByRecordNo(String recordTable, String s);

    RecordType getPiecePrefix(String temp);

    List<String> selectPieceIdsByNos(String prefix, List<String> nos);

    List<String> selectNosByPieceIds(String prefix, List<String> ids);

}
