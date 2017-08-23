package cn.com.jtang.service.impl;

import cn.com.jtang.dao.InfoMapper;
import cn.com.jtang.dao.RecordTypeMapper;
import cn.com.jtang.dao.custom.RecordViewMapper;
import cn.com.jtang.lucene.LuceneIndex;
import cn.com.jtang.po.CreateTable;
import cn.com.jtang.po.Fonds;
import cn.com.jtang.po.RecordType;
import cn.com.jtang.po.RecordTypeExample;
import cn.com.jtang.po.Rule;
import cn.com.jtang.po.TableField;
import cn.com.jtang.po.custom.FondsTree;
import cn.com.jtang.service.*;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Transactional
@Service("recordTypeService")
public class RecordTypeServiceImpl implements RecordTypeService {

    @Resource
    private RecordTypeMapper recordTypeMapper;
    @Resource
    private InfoMapper infoMapper;
    @Resource
    private LuceneIndex luceneIndex;
    @Resource
    private RecordViewMapper recordViewMapper;
    @Resource
    private FondsService fondsService;
    @Resource
    private LogService logService;
    @Resource
    private RuleService ruleService;
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private DictionaryService dictionaryService;

    //@Value("${luceneurl}")
    @Value("${fileserverpath}")
    private String indexDir;

    @Override
    public List<RecordType> selectByFondsId(String id) {
        RecordTypeExample example = new RecordTypeExample();
        RecordTypeExample.Criteria criteria = example.createCriteria();

        criteria.andFondsidEqualTo(id);
        
        return recordTypeMapper.selectByExample(example);
    }

/*    @Override
    public List<RecordType> selectDictionary(String id) {
        RecordTypeExample example = new RecordTypeExample();
        RecordTypeExample.Criteria criteria = example.createCriteria();

        criteria.andFondsidEqualTo(id);
        
        List<RecordType> recordlist = recordTypeMapper.selectByExample(example);
        for(RecordType record:recordlist){
        	record.setTables(recordTypeMapper.selectTableByRecordTypeId(record.getId()));
        }
        return recordlist;
    }
*/
    @Override
    public List<RecordType> selectAll() {
        RecordTypeExample example = new RecordTypeExample();
        return recordTypeMapper.selectByExample(example);
    }

    @Override
    public int deleteByExample(RecordTypeExample example) {
        return recordTypeMapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String id) {
    	try{
    		RecordType recodType = this.selectByPrimaryKey(id);
    		String tablePrefix = recodType.getRecordtable().replace(RecordUtil.RECORD, "");
    		//List<String> documentPaths = recordTypeMapper.getDocumentPaths(tablePrefix);
			luceneIndex.delete(id);
			 
    		deleteFile(new File(indexDir+tablePrefix));
    		//delete table
    		List<String> tablenames = recordTypeMapper.getTableNames(id);
    		tablenames.add(tablePrefix+RecordUtil.RECORD);
    		tablenames.add(tablePrefix+RecordUtil.VOLUME);
    		tablenames.add(tablePrefix+RecordUtil.PIECE);
    		tablenames.add(tablePrefix+RecordUtil.DOCUMENT);
    		tablenames.add(tablePrefix+RecordUtil.PIECEDOCUMENT);
    		recordTypeMapper.deleteTable(tablenames);

    		//info and template
	        infoMapper.deleteInfoAndTemplateByRecordtypeId(id);
	        
    		//checkinfo
	        recordViewMapper.deleteCheckInfoByRecordTypeId(tablenames);
	        
	        //rule
	        ruleService.deleteByRecordTypeId(id);
	        
	        //recordtype
    		recordTypeMapper.deleteByPrimaryKey(id);
    		
    		//tablefield
    		recordTypeMapper.deleteTableFieldByRecordTypeId(id);
    		
    		//log
	        logService.insert(shiroUserService.getLoginUser().getUsername()+"删除了档案类型--"+recodType.getName()+"。");
	        
    	}catch(Exception e){
    		e.printStackTrace();
    		return 0;
    	}
        return 1;
    }

    @Override
    public int insert(RecordType record) {
        return recordTypeMapper.insert(record);
    }

    @Override
    public List<RecordType> selectByExample(RecordTypeExample example) {
        return recordTypeMapper.selectByExample(example);
    }

    @Override
    public Page selectByExample(RecordTypeExample example, Page page) {
        page.retrievePage(recordTypeMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(recordTypeMapper.selectAddFondsByExample(example));
        return page;
    }

    @Override
    public RecordType selectByPrimaryKey(String id) {
        return recordTypeMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByExampleSelective(RecordType record, RecordTypeExample example) {
        return recordTypeMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByPrimaryKey(RecordType record) {
        return recordTypeMapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(RecordType record) {
        return recordTypeMapper.updateByPrimaryKey(record);
    }

    @Override
    public void create(String fondsid,String typename,String typedes,String typeno,String recordRule,String pieceRule,String recordCRule,String pieceCRule,
    		String recordFields,String pieceFields,String volumeFields) {
    	try{
	        Fonds fonds = fondsService.selectByPrimaryKey(fondsid);
	        
	        RecordType recordType = new RecordType();
	        recordType.setId(IDGenerator.generator());
	        recordType.setFondsid(fondsid);
	        recordType.setRecordtable(fonds.getFondsno()+"_"+typeno+RecordUtil.RECORD);
	        recordType.setVolumetable(fonds.getFondsno()+"_"+typeno+RecordUtil.VOLUME);
	        recordType.setTypeno(typeno);
	        recordType.setName(typename);
	        recordType.setCreatetime(new Date());
	        recordTypeMapper.insertSelective(recordType);
	        String recordtypeid = recordType.getId();
	
	        Rule r = new Rule();
	        if(recordRule!=null){
	            r.setId(IDGenerator.generator());
	            r.setRuleorder(recordRule);
	            r.setChineserule(recordCRule);
	            r.setRecordtypeid(recordtypeid);
	            r.setTabletype(RecordUtil.RECORD);
	            ruleService.insert(r);
	        }
	        if(pieceRule!=null){
	            r.setId(IDGenerator.generator());
	            r.setChineserule(pieceCRule);
	            r.setRuleorder(pieceRule);
	            r.setRecordtypeid(recordtypeid);
	            r.setTabletype(RecordUtil.PIECE);
	            ruleService.insert(r);
	        }
	
	        CreateTable fiveTable = new CreateTable(fonds.getFondsno(), typeno, recordFields,pieceFields,volumeFields);
	        this.createTable(fiveTable);
	
	
	        this.saveTableField(recordFields,pieceFields,volumeFields, recordtypeid);
	        
	        logService.insert(shiroUserService.getLoginUser().getUsername()+"创建了档案类型--"+typename+"。");
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }

    @Override
    public boolean isExist(String typename,String fondsid) {

        RecordTypeExample example = new RecordTypeExample();
        RecordTypeExample.Criteria criteria = example.createCriteria();

        criteria.andNameEqualTo(typename);
        criteria.andFondsidEqualTo(fondsid);

        List<RecordType> recordTypes = recordTypeMapper.selectByExample(example);

        return recordTypes != null && recordTypes.size() > 0;
    }

    @Override
    public int edit(String id, String typename, String typedes) {

        RecordType recordType = new RecordType();
        recordType.setId(id);
        recordType.setName(typename);
        logService.insert(shiroUserService.getLoginUser().getUsername()+"将档案类型"+this.selectByPrimaryKey(id).getName()+"名称改成了--"+typename+"。");
        return recordTypeMapper.updateByPrimaryKeySelective(recordType);
    }

    @Override
    public RecordType selectByNo(String recordTypeNo) {
        RecordTypeExample example = new RecordTypeExample();
        RecordTypeExample.Criteria criteria = example.createCriteria();

        criteria.andTypenoEqualTo(recordTypeNo);

        List<RecordType> recordTypes = recordTypeMapper.selectByExample(example);

        return recordTypes != null && recordTypes.size() > 0?recordTypes.get(0):null;
    }

    @Override
	public int createTable(CreateTable createTable) {
		if(createTable.getRecord_fields_value()!=null){
			 recordTypeMapper.createRecordTable(createTable);
			 recordTypeMapper.createVolumeTable(createTable);
			 recordTypeMapper.createDocumentTable(createTable);
		}
		if(createTable.getPiece_fields_value()!=null){
			 recordTypeMapper.createPieceTable(createTable);
			 recordTypeMapper.createPieceDocumentTable(createTable);
		}
		 return 1;
	}

    public boolean insertField(String fields,String recordtypeid,String type){
    	int length = 8;
    	if(type.equals(RecordUtil.VOLUME))length = 7;
    	String [] field = fields.split(",");
		for(int i=0;i<length;i++){
			String[] fieldss = field[i].split(":");
			 //fieldss: 0-fieldname 1-length 2-chineseName  3-idorvalue 4-zeronum  
			TableField tableField = new TableField();
			tableField.setFieldName(fieldss[0].replaceAll("\\s*", ""));
			tableField.setLength(fieldss[1].replaceAll("\\s*", ""));
			tableField.setName(fieldss[2].replaceAll("\\s*", ""));
			tableField.setFieldNo("");
			tableField.setRecordTypeid(recordtypeid);
			tableField.setTabletype(type);
			tableField.setIdorvalue(fieldss[3]);
			tableField.setZeronum(fieldss[4]);
			try{
				recordTypeMapper.insertFields(tableField);
			}catch(Exception e){
				e.printStackTrace();
				return false;
			}
		}
		for(int i=length;i<field.length;i++){
			String[] fieldss = field[i].split(":");
			 //fieldss: 0-fieldname 1-length 2-chineseName  3-idorvalue 4-zeronum  
			TableField tableField = new TableField();
			tableField.setFieldName(fieldss[0].replaceAll("\\s*", ""));
			tableField.setLength(fieldss[1].replaceAll("\\s*", ""));
			tableField.setName(fieldss[2].replaceAll("\\s*", ""));
			tableField.setFieldNo("");
			tableField.setRecordTypeid(recordtypeid);
			tableField.setType(1+"");
			tableField.setTabletype(type);
			tableField.setIdorvalue(fieldss[3]);
			tableField.setZeronum(fieldss[4]);
			if(fieldss[0].replaceAll("\\s*", "").contains("index"))
				tableField.setValueorindex(1+"");
			else
				tableField.setValueorindex(0+"");
			try{
				recordTypeMapper.insertFields(tableField);
			}catch(Exception e){
				e.printStackTrace();
				return false;
			}
		}
		return true;
    }

	@Override
	public List<FondsTree> selectAccessTree() {
		org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();
		List<FondsTree> fondsTrees = null;
		if(my.isPermitted("accessrecord")){
			fondsTrees = recordTypeMapper.getAllBasicField();
		}else{
			fondsTrees = recordTypeMapper.selectAccessRecordTree(shiroUserService.getLoginUser().getUserid());
		}
		return fondsTrees;
	}

	@Override
	public List<String> selectIds() {
		return recordTypeMapper.selectIds();
	}

	@Override
	public List<TableField> getRecordIdOrValueFields (String recordTypeId, String tablesuffix) {
		return recordTypeMapper.getRecordIdOrValueFields(recordTypeId,tablesuffix);
	}

	@Override
	public List<String> getBasicFields (String recordTypeId, String recordCategory) {
		return recordTypeMapper.getBasicFields(recordTypeId, recordCategory);
	}

	@Override
	public int saveTableField(String recordFields,String pieceFields,String volumeFields,String recordtypeid) {
		insertField(recordFields,recordtypeid,RecordUtil.RECORD);
		insertField(pieceFields,recordtypeid,RecordUtil.PIECE);
		insertField(volumeFields,recordtypeid,RecordUtil.VOLUME);
		return 1;
	}

	@Override
	public List<TableField> getCustomValueFields(String recordtypeid, String type) {
		return recordTypeMapper.getCustomValueFields(recordtypeid,type);
	}
	@Override
	public TableField getTitle(String recordtypeid, String type) {
		return recordTypeMapper.getTitle(recordtypeid,type);
	}

	@Override
	public List<TableField> getCustomIndexFields(String recordtypeid, String type) {
		List<TableField> tfs = recordTypeMapper.getCustomIndexFields(recordtypeid, type);
		for(int i=0;i<tfs.size();i++){
			TableField tf = tfs.get(i);
			if(tf.getFieldName().contains("index")){
				if(dictionaryService.checkIndexTable(tf.getFieldName())==0)
					tfs.remove(i);
			}
		}
		return tfs;
	}

	@Override
	public List<TableField> getTableField(String recordtypeid,String type) {
		List<TableField> tfs = recordTypeMapper.getFields(recordtypeid,type);
		for(int i=0;i<tfs.size();i++){
			TableField tf = tfs.get(i);
			if(tf.getFieldName().contains("index")){
				if(dictionaryService.checkIndexTable(tf.getFieldName())==0)
					tfs.remove(i);
			}
		}
		return tfs;
	}
	@Override
	public List<TableField> getAllTableField(String recordtypeid,String type) {
		List<TableField> tfs = recordTypeMapper.getAllFields(recordtypeid,type);
		for(int i=0;i<tfs.size();i++){
			TableField tf = tfs.get(i);
			if(tf.getFieldName().contains("index")){
				if(dictionaryService.checkIndexTable(tf.getFieldName())==0)
					tfs.remove(i);
			}
		}
		System.out.println(tfs);
		return tfs;
	}

	@Override
	public boolean isExistFirstno(String typeNo,String fondsid) {
        RecordTypeExample example = new RecordTypeExample();
        RecordTypeExample.Criteria criteria = example.createCriteria();

        criteria.andTypeNoEqualTo(typeNo);
        criteria.andFondsidEqualTo(fondsid);

        List<RecordType> recordTypes = recordTypeMapper.selectByExample(example);

        return recordTypes != null && recordTypes.size() > 0;
	}

	@Override
	public List<FondsTree> getAllBasicField() {
		return recordTypeMapper.getAllBasicField();
	}

	@Override
	public List<TableField> getTableFieldAllImf(String recordtypeid, String type) {
		return recordTypeMapper.getAllFieldsImf(recordtypeid,type);
	}
	
	   private void deleteFile(File file) {  
		    if (file.exists()) {//判断文件是否存在  
		     if (file.isFile()) {//判断是否是文件  
		      file.delete();//删除文件   
		     } else if (file.isDirectory()) {//否则如果它是一个目录  
		      File[] files = file.listFiles();//声明目录下所有的文件 files[];  
		      for (int i = 0;i < files.length;i ++) {//遍历目录下所有的文件  
		       this.deleteFile(files[i]);//把每个文件用这个方法进行迭代  
		      }  
		      file.delete();//删除文件夹  
		     }  
		    } else {  
		     System.out.println("所删除的文件不存在");  
		    }  
		   }

/*	@Override
	public List<TableField> searchResultRecord(String recordtypeid,
			String type, List<Column> cols) {
		return recordTypeMapper.searchResultRecord(recordtypeid,type,cols);
	}  */

/*	@Override
	public List<Table> selectTableByRecordTypeId(String recordtypeid) {
		return recordTypeMapper.selectTableByRecordTypeId(recordtypeid);
	}   */
}
