package cn.com.jtang.service;

import cn.com.jtang.po.RecordVolume;
import cn.com.jtang.po.RecordVolumeExample;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.CreateVolumeForm;
import cn.com.jtang.web.controller.form.RecordVolumeForm;

import java.util.List;
import java.util.Map;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface RecordVolumeService {

    int deleteByExample(RecordVolumeExample example);

    int deleteByPrimaryKey(String id);

    int insert(RecordVolume record);

    List<RecordVolume> selectByExample(RecordVolumeExample example);

    Page selectByExample(RecordVolumeExample example, Page page);

    RecordVolume selectByPrimaryKey(String id);

    int updateByExampleSelective(RecordVolume record, RecordVolumeExample example);

    int updateByPrimaryKey(RecordVolume record);

    int updateByPrimaryKeySelective(RecordVolume record);

    int create(CreateVolumeForm form);

    List<RecordVolume> selectExportByExample(RecordVolumeExample example);

    int updateByPrimaryKeySelective(RecordVolume recordVolume, String tableName);

    int updateAddress(RecordVolumeForm form, String tableName);

    List<RecordVolume> selectByNo(String recordno, String recordtypeid);

    boolean isExistByNo(String recordno, String recordtypeid);

    Map getMapValue(String volumeId, String fondsId, String recordTypeId);

    int edit(CreateVolumeForm volumeCreateForm);

    void uncoverVolume(String volumeId, String fondsId, String recordTypeId);

    boolean isStopNo(String volumeno, String recordtypeid);

    boolean isExistByNo (String volumeno);

    int deleteByNo (String volumeno,String tableprefix,String type, String recordtypeid);

    String getVolumeidByVolumeNo (String volumeNo,String  tablename);

    int getSequence (CreateVolumeForm recordtype);

    Map<String,Object> checkVolumeNo (String volumeno, String recordtypeid);

    List<String> selectIdsByExample (RecordVolumeExample example);
}


//~ Formatted by Jindent --- http://www.jindent.com
