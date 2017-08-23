package cn.com.jtang.service.impl;

import cn.com.jtang.dao.custom.DictionaryMapper;
import cn.com.jtang.po.TableField;
import cn.com.jtang.service.DictionaryService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.List;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Service("dictionaryService")
@Transactional
public class DictionaryServiceImpl implements DictionaryService {
    @Resource
    private DictionaryMapper mapper;

	@Override
	public List<TableField> getDictionary(String recordtypeid,String tabletype) {
		
		return mapper.getDictionaryField(recordtypeid,tabletype);
	}

	@Override
	public List<TableField> addField(String recordtypeid, String tabletype,
			String fieldName, String length,String tableName) {
		int count = mapper.getCount(recordtypeid, tabletype);
		return mapper.addField(recordtypeid, tabletype, fieldName, length,count,tableName);
	}

	@Override
	public int checkIndexTable(String indextable) {
		return mapper.checkIndexTable(indextable);
	}


    
}


//~ Formatted by Jindent --- http://www.jindent.com
