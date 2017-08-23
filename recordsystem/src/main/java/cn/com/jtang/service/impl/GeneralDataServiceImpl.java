package cn.com.jtang.service.impl;

import cn.com.jtang.dao.custom.DictionaryMapper;
import cn.com.jtang.dao.custom.GeneralDataMapper;
import cn.com.jtang.po.GeneralData;
import cn.com.jtang.po.TableField;
import cn.com.jtang.service.GeneralDataService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Service("generaldataService")
@Transactional
public class GeneralDataServiceImpl implements GeneralDataService {
    @Resource
    private GeneralDataMapper generalDataMapper;

	@Override
	public List<GeneralData> getGeneralData(String tablename) {
		return generalDataMapper.getGeneralData(tablename);
	}
	@Override
	public List<GeneralData> getAllGeneralData(String tablename) {
		return generalDataMapper.getAllGeneralData(tablename);
	}

	@Override
	public List<GeneralData> addGeneralData(String tablename, String name,String no) {
		generalDataMapper.addGeneralData(tablename, name,no);
		return generalDataMapper.getGeneralData(tablename);
	}

	@Override
	public List<GeneralData> deleteGeneralData(String tablename, int id) {
		generalDataMapper.deleteGeneralData(tablename, id);
		return generalDataMapper.getGeneralData(tablename);
	}

	@Override
	public List<GeneralData> sureGeneralData(String tablename, int id) {
		generalDataMapper.sureGeneralData(tablename, id);
		return generalDataMapper.getGeneralData(tablename);
	}

	@Override
	public String getGeneralDataById(String tablename,int id) {
		return generalDataMapper.getGeneralDataById(tablename,id);
	}

	@Override
	public boolean isNameExist(String name) {
		return generalDataMapper.getCountByIndexTableName(name)>0;
	}

	@Override
	public int createGeneralData(String name) {
		try{
			generalDataMapper.createGeneralData(name,generalDataMapper.getIndexTableMaxId());
			return 1;
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<Map> getIndexTables() {
		List<Map> maps = generalDataMapper.getIndexTables();
		for(Map map:maps){
			map.put("title", generalDataMapper.getIndexTableContent(""+map.get("indextable")));
		}
		return maps;
	}

	@Override
	public String deleteDictionary(String indextable) {
		return generalDataMapper.deleteDictionary(indextable);
	}

	@Override
	public String getIndexName(String indextable) {
		String indexName = "";
		if(indextable.equals(RecordUtil.YEAR)){
			indexName = "年度";
		}else if(indextable.equals(RecordUtil.DEADLINE)){
			indexName = "保管期限";
		}else if(indextable.equals(RecordUtil.DEPARTMENT)){
			indexName = "部门";
		}else{
			indexName = generalDataMapper.getIndexName(indextable);
		}
		return indexName;
	}

    
}


//~ Formatted by Jindent --- http://www.jindent.com
