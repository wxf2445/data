package cn.com.jtang.dao.custom;

import cn.com.jtang.po.Document;
import cn.com.jtang.po.RecordExample;
import cn.com.jtang.po.TableField;
import cn.com.jtang.resulthandler.MapResultHandler;
import cn.com.jtang.resulthandler.VolumeInnerResultHandler;
import cn.com.jtang.web.controller.form.template.Column;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface DanymicMapper {

    List<String> selectAllIds(@Param("tableName") String tableName);

    Map getMapValue(@Param("tableName") String tableName, @Param("id") String id);

    int creatTableAndInsert(Map allparams);

    int insertInfo(Map allparams);

    List<Object> selectObjectByRecordId(Map allparams);

    List<String> selectRecordIdsByRecordContent(Map allparams);

    List<Map<String, Object>> selectByRecordId(@Param("tablename") String tablename, @Param("recordid") String recordid);

    void deleteOldInfo(@Param("tableId") String tableId, @Param("recordid") String recordid);

    int selectCountByCols(@Param("tableName") String tableName, @Param("example") RecordExample example);

    List<Object> selectByCols(@Param("cols") List<String> cols, @Param("indexFields") List<TableField> indexFields, @Param("tableName") String tableName, @Param("example") RecordExample example);

    int countByTableId(@Param("tableid") String tableid);

    void dropTable(@Param("tableName") String tableName);

    void getColMapValue(@Param("recordTypeId") String recordTypeId, @Param("tableFieldType") String tableFieldType, MapResultHandler resultHandler);

    void getVolumeInner(@Param("tableName") String tableName, @Param("example") RecordExample example, VolumeInnerResultHandler resultHandler);

    int addColumn(@Param("tableName") String tableName, @Param("cols") List<Column> cols);

    Map selectByRecordNo(@Param("tableName") String tableName, @Param("volumeno") String volumeno);

    Map selectInnerByRecordNo(@Param("tableName") String tableName, @Param("recordNo") String recordNo);

    void insertBatch(@Param("documents") List<Document> documents, @Param("documentTable") String documentTable);

    List<String> selectPieceIdsByNos(@Param("tableName")String tableName,@Param("nos") List<String> nos);

    List<String> selectNosByPieceIds(@Param("tableName")String tableName,@Param("ids") List<String> ids);

}