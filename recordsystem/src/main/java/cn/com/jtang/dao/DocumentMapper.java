package cn.com.jtang.dao;

import cn.com.jtang.po.Document;
import cn.com.jtang.po.DocumentExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface DocumentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table document
     *
     * @mbggenerated Tue Jun 21 11:29:25 CST 2016
     */
    int countByExample(DocumentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table document
     *
     * @mbggenerated Tue Jun 21 11:29:25 CST 2016
     */
    int deleteByExample(DocumentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table document
     *
     * @mbggenerated Tue Jun 21 11:29:25 CST 2016
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table document
     *
     * @mbggenerated Tue Jun 21 11:29:25 CST 2016
     */
    int insert(Document record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table document
     *
     * @mbggenerated Tue Jun 21 11:29:25 CST 2016
     */
    int insertSelective(Document record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table document
     *
     * @mbggenerated Tue Jun 21 11:29:25 CST 2016
     */
    List<Document> selectByExample(@Param("example")DocumentExample example,@Param("tablename")String tablename);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table document
     *
     * @mbggenerated Tue Jun 21 11:29:25 CST 2016
     */
    Document selectByPrimaryKey(@Param("id")String id,@Param("tablename")String tablename);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table document
     *
     * @mbggenerated Tue Jun 21 11:29:25 CST 2016
     */
    int updateByExampleSelective(@Param("record") Document record, @Param("example") DocumentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table document
     *
     * @mbggenerated Tue Jun 21 11:29:25 CST 2016
     */
    int updateByExample(@Param("record") Document record, @Param("example") DocumentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table document
     *
     * @mbggenerated Tue Jun 21 11:29:25 CST 2016
     */
    int updateByPrimaryKeySelective(Document record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table document
     *
     * @mbggenerated Tue Jun 21 11:29:25 CST 2016
     */
    int updateByPrimaryKey(Document record);

    List<String> selectIDByExample (@Param("example")DocumentExample example,@Param("tablename")String tablename);
}