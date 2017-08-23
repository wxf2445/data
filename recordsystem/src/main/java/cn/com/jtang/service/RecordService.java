package cn.com.jtang.service;

import cn.com.jtang.po.*;
import cn.com.jtang.po.custom.RecordView;
import cn.com.jtang.po.custom.RecordViewExample;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.ColSearchForm;
import cn.com.jtang.web.controller.form.InfoTypeForm;
import cn.com.jtang.web.controller.form.RecordSearchForm;
import cn.com.jtang.web.controller.form.RecordForm;
import cn.com.jtang.web.controller.form.VolumeSearchForm;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface RecordService {

    int countAll(String tableName);

    PageView getCanBuildRecord(RecordSearchForm buildRecordSearchForm);

    String createAndUploadFile(RecordForm uploadFileAndInfo, List<MultipartFile> files) throws IOException;

    int deleteByExample(RecordExample example);

    int deleteByPrimaryKey(String id);

    int insert(Record record,String tableId);
    
    int delete(String recordid,String tableName);

    int insert(List<String> fieldname,List<String> fieldvalue,String tablename,String id );

    List<Record> selectByExample(RecordExample example);

    Page selectByExample(RecordExample example, Page page);

    Record selectByPrimaryKey(String id, String tableName);

    RecordView selectViewByPrimaryKey(String id, String tableName);

    int updateByExampleSelective(Record record, RecordExample example);

    int updateByPrimaryKey(Record record);

    int updateByPrimaryKeySelective(Record record);
    
    Page getApplyRecord(RecordViewExample example,Page page,String tablename);

    Map<String, Object> getImformation(SelectImformation record);

    Map<String, Object> getRecordNoMapData(SelectImformation record);

    Map<String, Object> getAllById(SelectImformation record);

    int checkPass(String tablename,String recordid,String recordno);
    
    int refusePass(String tablename,String recordid,String failReason);

    void typeInfo(InfoTypeForm infoTypeForm) throws IOException;

    List<PageView> selectRecordContent(ColSearchForm colSearchForm);

    List<Record> getByVolumeId(String volumeId, String fondsId, String recordTypeId);

    List<Record> getByVolumeIds(List<String> volumeIds, String tablename);

    List<Record> getByVolumeNo(String volumeId, String tablePrefix);

    List<Record> getRecordByVolumeNo(String volumeNo, String tablePrefix);

    String getFailReason(String recordid);

    String getRecordNo(List<TableField> tfs, SelectImformation si,String fondsno,String recordtypeid,String type,String tablename,String recordid);

    void updateInfo(InfoTypeForm infoTypeForm) throws IOException;

    int updateByPrimaryKeySelective(Record recordForm, String tableName);

    int updateAddress(RecordForm intoHouseForm, String s);

    Map selectRecordByContent(ColSearchForm colSearchForm);

    //Map selectRecordVolumeByContent(VolumeSearchForm volumeSearchForm);

    Map selectVolumeAndRecordContent(ColSearchForm colSearchForm);

    SearchPage selectVolumeAndRecord(String tableName, RecordExample example, SearchPage searchPage);

    List<Map<String,Object>> selectVolumeByContent(VolumeSearchForm colSearchForm,List<TableField> tableField,Page pageObject);

    String selectSubjectByRecordOrVolumeId(String tableprefix,String id);

    String selectVolumeNoByRecordOrVolumeId(String tableprefix,String id);

    PageView selectRecordByVolumeId(String tableprefix,String volumeid,String volumeSubject,List<TableField> recordField);
    
    PageView selectRecordByVolumeId(VolumeSearchForm VolumeSearchForm,String volumeid,String volumeSubject,List<TableField> recordField);

    Page selectRecordByExample(HashMap<String, Object> map, Page page,List<TableField> recordField);

    List<Record> selectByNo(String recordno, String tableName);

    boolean isExistByNo(String recordno);
    
    Page searchRecord(String key, String type, String recordTypeId,int page);

    List<Record> selectIdsByNos (List<String> recordNos, String prePath);

    Map<String,String> getValueMap (String recordId, List<String> fields, String tablePrefix);

    void updatePageNum(String recordId, int page, String tableName);

    List<String> selectIdsByExample (RecordExample example);
}


//~ Formatted by Jindent --- http://www.jindent.com
