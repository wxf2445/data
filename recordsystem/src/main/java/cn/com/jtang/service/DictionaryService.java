package cn.com.jtang.service;



import java.util.List;

import cn.com.jtang.po.TableField;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface DictionaryService {

	List<TableField> getDictionary(String recordtypeid,String tabletype);

	List<TableField> addField(String recordtypeid,String tabletype,String fieldName,String length,String tableName);

	int checkIndexTable(String indextable);

}


//~ Formatted by Jindent --- http://www.jindent.com
