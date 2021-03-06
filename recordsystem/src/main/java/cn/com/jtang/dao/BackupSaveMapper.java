package cn.com.jtang.dao;

import cn.com.jtang.po.BackupSave;
import cn.com.jtang.po.BackupSaveExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BackupSaveMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table backupsave
     *
     * @mbggenerated Fri Sep 23 16:45:03 CST 2016
     */
    int countByExample(BackupSaveExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table backupsave
     *
     * @mbggenerated Fri Sep 23 16:45:03 CST 2016
     */
    int deleteByExample(BackupSaveExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table backupsave
     *
     * @mbggenerated Fri Sep 23 16:45:03 CST 2016
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table backupsave
     *
     * @mbggenerated Fri Sep 23 16:45:03 CST 2016
     */
    int insert(BackupSave record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table backupsave
     *
     * @mbggenerated Fri Sep 23 16:45:03 CST 2016
     */
    int insertSelective(BackupSave record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table backupsave
     *
     * @mbggenerated Fri Sep 23 16:45:03 CST 2016
     */
    List<BackupSave> selectByExample(BackupSaveExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table backupsave
     *
     * @mbggenerated Fri Sep 23 16:45:03 CST 2016
     */
    BackupSave selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table backupsave
     *
     * @mbggenerated Fri Sep 23 16:45:03 CST 2016
     */
    int updateByExampleSelective(@Param("record") BackupSave record, @Param("example") BackupSaveExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table backupsave
     *
     * @mbggenerated Fri Sep 23 16:45:03 CST 2016
     */
    int updateByExample(@Param("record") BackupSave record, @Param("example") BackupSaveExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table backupsave
     *
     * @mbggenerated Fri Sep 23 16:45:03 CST 2016
     */
    int updateByPrimaryKeySelective(BackupSave record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table backupsave
     *
     * @mbggenerated Fri Sep 23 16:45:03 CST 2016
     */
    int updateByPrimaryKey(BackupSave record);
}