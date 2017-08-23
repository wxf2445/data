package cn.com.jtang.dao.custom;

import org.apache.ibatis.annotations.Param;

import cn.com.jtang.po.GeneralData;
import cn.com.jtang.po.TableField;

import java.util.List;
import java.util.Map;

public interface GeneralDataMapper {

	   List<GeneralData> getGeneralData(@Param("tablename") String tablename);

	   List<GeneralData> getAllGeneralData(@Param("tablename") String tablename);

	   
	   int addGeneralData(@Param("tablename") String tablename,@Param("name") String name,@Param("no") String no);

	   
	   int deleteGeneralData(@Param("tablename") String tablename,@Param("id") int id);
	   

	   int sureGeneralData(@Param("tablename") String tablename,@Param("id") int id);


	   String getGeneralDataById(@Param("tablename") String tablename,@Param("id") int id);
	   

	   int getCountByIndexTableName(@Param("name") String name);
	   

	   int getIndexTableMaxId();
	   

	   List<Map> getIndexTables();
	   
	   
	   List<String> getIndexTableContent(@Param("tablename") String tablename);
	   

	   int createGeneralData(@Param("name") String name,@Param("maxid") int maxid);

	   
	   String deleteDictionary(@Param("indextable") String indextable);
	   
	   
	   String getIndexName(@Param("indextable") String indextable);
}