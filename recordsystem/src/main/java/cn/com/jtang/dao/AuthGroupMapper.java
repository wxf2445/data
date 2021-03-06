package cn.com.jtang.dao;

import cn.com.jtang.po.AuthGroup;
import cn.com.jtang.po.AuthGroupExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AuthGroupMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table authgroup
     *
     * @mbggenerated Wed Aug 10 10:43:54 CST 2016
     */
    int countByExample(AuthGroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table authgroup
     *
     * @mbggenerated Wed Aug 10 10:43:54 CST 2016
     */
    int deleteByExample(AuthGroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table authgroup
     *
     * @mbggenerated Wed Aug 10 10:43:54 CST 2016
     */
    int deleteByPrimaryKey(String authgroupid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table authgroup
     *
     * @mbggenerated Wed Aug 10 10:43:54 CST 2016
     */
    int insert(AuthGroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table authgroup
     *
     * @mbggenerated Wed Aug 10 10:43:54 CST 2016
     */
    int insertSelective(AuthGroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table authgroup
     *
     * @mbggenerated Wed Aug 10 10:43:54 CST 2016
     */
    List<AuthGroup> selectByExample(AuthGroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table authgroup
     *
     * @mbggenerated Wed Aug 10 10:43:54 CST 2016
     */
    AuthGroup selectByPrimaryKey(String authgroupid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table authgroup
     *
     * @mbggenerated Wed Aug 10 10:43:54 CST 2016
     */
    int updateByExampleSelective(@Param("record") AuthGroup record, @Param("example") AuthGroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table authgroup
     *
     * @mbggenerated Wed Aug 10 10:43:54 CST 2016
     */
    int updateByExample(@Param("record") AuthGroup record, @Param("example") AuthGroupExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table authgroup
     *
     * @mbggenerated Wed Aug 10 10:43:54 CST 2016
     */
    int updateByPrimaryKeySelective(AuthGroup record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table authgroup
     *
     * @mbggenerated Wed Aug 10 10:43:54 CST 2016
     */
    int updateByPrimaryKey(AuthGroup record);
}