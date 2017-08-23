package cn.com.jtang.service;

import cn.com.jtang.po.CreateTable;
import cn.com.jtang.po.RecordType;
import cn.com.jtang.po.RecordTypeExample;
import cn.com.jtang.po.TableField;
import cn.com.jtang.po.custom.FondsTree;
import cn.com.jtang.util.Page;

import java.util.List;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface RecordTypeService {

    List<RecordType> selectByFondsId(String id);

    List<RecordType> selectAll();

    int deleteByExample(RecordTypeExample RecordTypeexample);

    int deleteByPrimaryKey(String RecordTypeid);

    int insert(RecordType record);

    List<RecordType> selectByExample(RecordTypeExample example);

    Page selectByExample(RecordTypeExample example, Page page);

    RecordType selectByPrimaryKey(String RecordTypeid);

    int updateByExampleSelective(RecordType record, RecordTypeExample example);

    int updateByPrimaryKey(RecordType record);

    int updateByPrimaryKeySelective(RecordType record);

    void create(String fondsid,String typename,String typedes,String typeno,String recordRule,String pieceRule,String recordCRule,String pieceCRule,
    		String recordFields,String pieceFields,String volumeFields);

    boolean isExist(String typename,String fondsid);

    boolean isExistFirstno(String firstno,String fondsid);

    int createTable(CreateTable createTable);

    int saveTableField(String recordField,String pieceField,String volumeFields,String recordtypeid);
    
    List<TableField> getCustomValueFields(String recordtypeid,String type);
    
    TableField getTitle(String recordtypeid,String type);

    List<TableField> getCustomIndexFields(String recordtypeid,String type);

    List<TableField> getTableField(String recordtypeid,String type);

    List<TableField> getAllTableField(String recordtypeid,String type);
    
    List<TableField> getTableFieldAllImf(String recordtypeid,String type);
    
   // List<TableField> searchResultRecord(String recordtypeid,String type,List<Column> cols);
    
    int edit(String id, String typename, String typedes);

    RecordType selectByNo(String recordTypeNo);

    List<FondsTree> getAllBasicField();
    
    boolean insertField(String fields,String recordtypeid,String type);

    List<FondsTree> selectAccessTree();

    List<String> selectIds();

    List<TableField> getRecordIdOrValueFields (String recordTypeId, String tablesuffix);

    List<String> getBasicFields (String recordTypeId, String recordCategory);

/*    List<Table> selectTableByRecordTypeId(String recordtypeid);*/

	/*List<RecordType> selectDictionary(String recordtypeid);*/
}


//~ Formatted by Jindent --- http://www.jindent.com
