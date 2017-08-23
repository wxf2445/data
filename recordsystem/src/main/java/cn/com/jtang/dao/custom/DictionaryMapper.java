package cn.com.jtang.dao.custom;

import org.apache.ibatis.annotations.Param;

import cn.com.jtang.po.TableField;

import java.util.List;
import java.util.Map;

public interface DictionaryMapper {

	   List<TableField> getDictionaryField(@Param("recordtypeid")String recordtypeid,@Param("tabletype") String tabletype);
	   
	   
	   int getCount(@Param("recordtypeid")String recordtypeid,@Param("tabletype") String tabletype);
	   
	   List<TableField> addField(@Param("recordtypeid")String recordtypeid,@Param("tabletype") String tabletype,@Param("fieldName") String fieldName
			   ,@Param("length") String length,@Param("count") int count,@Param("tableName") String tableName);
	   

	   int checkIndexTable(@Param("indextable")String indextable);
}