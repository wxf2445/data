package cn.com.jtang.service;



import java.util.List;
import java.util.Map;

import cn.com.jtang.po.GeneralData;
import cn.com.jtang.po.TableField;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface GeneralDataService {

	List<GeneralData> getGeneralData(String tablename);

	List<GeneralData> getAllGeneralData(String tablename);
	
	List<GeneralData> addGeneralData(String tablename,String name,String no);
	
	List<GeneralData> deleteGeneralData(String tablename,int id);

	List<GeneralData> sureGeneralData(String tablename,int id);
	
	String getGeneralDataById(String tablename,int id);

    boolean isNameExist(String name);

	int createGeneralData(String name);

	String deleteDictionary(String indextable);
	
	List<Map> getIndexTables();
	
	String getIndexName(String indextable);

}


//~ Formatted by Jindent --- http://www.jindent.com
