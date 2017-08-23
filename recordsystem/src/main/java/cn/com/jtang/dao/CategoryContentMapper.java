package cn.com.jtang.dao;

import cn.com.jtang.po.CategoryContent;
import cn.com.jtang.po.CategoryContentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CategoryContentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table categorycontent
     *
     * @mbggenerated Thu Jun 30 17:47:12 CST 2016
     */
    int countByExample(CategoryContentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table categorycontent
     *
     * @mbggenerated Thu Jun 30 17:47:12 CST 2016
     */
    int deleteByExample(CategoryContentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table categorycontent
     *
     * @mbggenerated Thu Jun 30 17:47:12 CST 2016
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table categorycontent
     *
     * @mbggenerated Thu Jun 30 17:47:12 CST 2016
     */
    int insert(CategoryContent record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table categorycontent
     *
     * @mbggenerated Thu Jun 30 17:47:12 CST 2016
     */
    int insertSelective(CategoryContent record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table categorycontent
     *
     * @mbggenerated Thu Jun 30 17:47:12 CST 2016
     */
    List<CategoryContent> selectByExample(CategoryContentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table categorycontent
     *
     * @mbggenerated Thu Jun 30 17:47:12 CST 2016
     */
    CategoryContent selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table categorycontent
     *
     * @mbggenerated Thu Jun 30 17:47:12 CST 2016
     */
    int updateByExampleSelective(@Param("record") CategoryContent record, @Param("example") CategoryContentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table categorycontent
     *
     * @mbggenerated Thu Jun 30 17:47:12 CST 2016
     */
    int updateByExample(@Param("record") CategoryContent record, @Param("example") CategoryContentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table categorycontent
     *
     * @mbggenerated Thu Jun 30 17:47:12 CST 2016
     */
    int updateByPrimaryKeySelective(CategoryContent record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table categorycontent
     *
     * @mbggenerated Thu Jun 30 17:47:12 CST 2016
     */
    int updateByPrimaryKey(CategoryContent record);
}