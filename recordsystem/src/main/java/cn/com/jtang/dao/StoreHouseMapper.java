package cn.com.jtang.dao;

import cn.com.jtang.po.StoreHouse;
import cn.com.jtang.po.StoreHouseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StoreHouseMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storehouse
     *
     * @mbggenerated Fri Jul 15 10:34:38 CST 2016
     */
    int countByExample(StoreHouseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storehouse
     *
     * @mbggenerated Fri Jul 15 10:34:38 CST 2016
     */
    int deleteByExample(StoreHouseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storehouse
     *
     * @mbggenerated Fri Jul 15 10:34:38 CST 2016
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storehouse
     *
     * @mbggenerated Fri Jul 15 10:34:38 CST 2016
     */
    int insert(StoreHouse record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storehouse
     *
     * @mbggenerated Fri Jul 15 10:34:38 CST 2016
     */
    int insertSelective(StoreHouse record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storehouse
     *
     * @mbggenerated Fri Jul 15 10:34:38 CST 2016
     */
    List<StoreHouse> selectByExample(StoreHouseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storehouse
     *
     * @mbggenerated Fri Jul 15 10:34:38 CST 2016
     */
    StoreHouse selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storehouse
     *
     * @mbggenerated Fri Jul 15 10:34:38 CST 2016
     */
    int updateByExampleSelective(@Param("record") StoreHouse record, @Param("example") StoreHouseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storehouse
     *
     * @mbggenerated Fri Jul 15 10:34:38 CST 2016
     */
    int updateByExample(@Param("record") StoreHouse record, @Param("example") StoreHouseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storehouse
     *
     * @mbggenerated Fri Jul 15 10:34:38 CST 2016
     */
    int updateByPrimaryKeySelective(StoreHouse record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table storehouse
     *
     * @mbggenerated Fri Jul 15 10:34:38 CST 2016
     */
    int updateByPrimaryKey(StoreHouse record);
}