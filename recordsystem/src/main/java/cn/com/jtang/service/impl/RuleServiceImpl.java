package cn.com.jtang.service.impl;

import cn.com.jtang.dao.*;
import cn.com.jtang.dao.custom.DanymicMapper;
import cn.com.jtang.dao.custom.RecordViewMapper;
import cn.com.jtang.dao.custom.RecordVolumeViewMapper;
import cn.com.jtang.po.*;
import cn.com.jtang.service.IndexTableService;
import cn.com.jtang.service.RecordService;
import cn.com.jtang.service.RecordTypeService;
import cn.com.jtang.service.RuleService;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.CreateVolumeForm;
import cn.com.jtang.web.controller.form.InfoTypeForm;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;

import java.util.*;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("ruleService")
@Transactional
public class RuleServiceImpl implements RuleService {

    @Resource
    private RuleMapper ruleMapper;
    @Resource
    private FondsMapper fondsMapper;
    @Resource
    private RecordViewMapper recordViewMapper;
    @Resource
    private RecordService recordService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private YearMapper yearMapper;
    @Resource
    private DeadlineMapper deadlineMapper;
    @Resource
    private DepartmentMapper departmentMapper;
    @Resource
    private IndexTableService indexTableService;



    @Override
    public int insert(Rule record) {
        return ruleMapper.insert(record);
    }

    @Override
    public Rule selectByPrimaryKey(String id) {
        return ruleMapper.selectByPrimaryKey(id);
    }

    @Override
    public Rule selectByRecordType(String recordtype,String tabletype) {
        RuleExample example = new RuleExample();
        RuleExample.Criteria criteria = example.createCriteria();

        tabletype = RecordUtil.VOLUME.equals(tabletype)?RecordUtil.RECORD:tabletype;
        criteria.andRecordtypeidEqualTo(recordtype);
        criteria.andTableTypeEqualTo(tabletype);

        List<Rule> rules = ruleMapper.selectByExample(example);

        return rules != null ? rules.get(0) : null;
    }

    @Override
    public String getVolumeRuleorder(CreateVolumeForm form, String tablePrefix) {
        /*RecordVolumeExample example = new RecordVolumeExample();
        example.setTableName(tablePrefix+RecordUtil.VOLUME);
        RecordType recordType = recordTypeService.selectByPrimaryKey(form.getRecordtype());
        String volumeOrder = String.valueOf(recordType.getVolumenoindex()+1);
        Map<String, String> customFields = form.getCustomFields();*/
        /*String tablesuffix = "";
        if(RecordUtil.MODE_PIECE.equals(form.getMode())){
            tablesuffix = RecordUtil.PIECE;
        }else if(RecordUtil.MODE_VOLUMEPIECE.equals(form.getMode())){
            tablesuffix = RecordUtil.VOLUME;
        }*/
        Rule rule = selectByRecordType(form.getRecordtype(),RecordUtil.VOLUME);
        String order = rule.getRuleorder().replace("-"+RecordUtil.SEQUENCNO, "");

        //String year = yearMapper.selectByPrimaryKey(form.getYear()).getName();
        //String deadline = deadlineMapper.selectByPrimaryKey(form.getDeadline()).getName();
        //String department = departmentMapper.selectByPrimaryKey(form.getDepartment()).getName();
        String fondsNo = fondsMapper.selectByPrimaryKey(form.getFonds()).getFondsno();

        List<TableField> tableFields = recordTypeService.getRecordIdOrValueFields(form.getRecordtype(),RecordUtil.VOLUME);
        List<String> idList = new ArrayList<>();
        //List<String> valueList = new ArrayList<>();
        Map zeronums = new HashMap();
        for(TableField tableField : tableFields){
            if(tableField.getIdorvalue()!=null&&tableField.getIdorvalue().equals("1")){
                idList.add(tableField.getFieldName());
            }/*else if(tableField.getIdorvalue().equals("1")){
                valueList.add(tableField.getFieldName());
            }*/
            if (tableField.getZeronum() != null && !tableField.getZeronum().equals("0") && !tableField.getZeronum().equals("")) {
                zeronums.put(tableField.getFieldName(), tableField.getZeronum());
            }
        }
/*        //只含id的所有字段值及值

        Map<String, Object> record2 = recordViewMapper.selectRecordMapByRecordId(RecordUtil.VOLUME, recordid);
        
        //含中文的所有字段及值
        List<TableField> tfs = recordTypeService.getAllTableField(form.getRecordtype(), RecordUtil.VOLUME);
        SelectImformation si = new SelectImformation(tablePrefix+RecordUtil.VOLUME , "", tfs);
        Map<String, Object> record = recordService.getImformation(si);
        
        
        String no = order.replace(RecordUtil.FONDSID, fondsNo);
        List<String> keys = new ArrayList<String>(record.keySet());*/

    	//替换fondsNo
    	order = order.replace(RecordUtil.FONDSID, fondsNo);
    	
    	//替换year
    	String year = "";
    	if(idList.contains(RecordUtil.YEAR)){
        	year = yearMapper.selectByPrimaryKey(form.getYear()).getNo();
        }else{
        	year = yearMapper.selectByPrimaryKey(form.getYear()).getName();
        }
    	order = order.replace(RecordUtil.YEAR, year);
    	
    	//替换deadline
    	String dealine = "";
    	if(idList.contains(RecordUtil.DEADLINE)){
    		dealine = deadlineMapper.selectByPrimaryKey(form.getDeadline()).getNo();
        }else{
    		dealine = deadlineMapper.selectByPrimaryKey(form.getDeadline()).getName();
        }
    	order = order.replace(RecordUtil.DEADLINE, dealine);
    	
    	//替换department
    	String department = "";
    	if(idList.contains(RecordUtil.DEPARTMENT)){
    		department = departmentMapper.selectByPrimaryKey(form.getDepartment()).getNo();
        }else{
    		department = departmentMapper.selectByPrimaryKey(form.getDepartment()).getName();
        }
    	order = order.replace(RecordUtil.DEPARTMENT, department);
        	
        
        /*if(customFields!=null){
            Set<String> keys = customFields.keySet();
            for(String key :keys){
                if(no.contains(key)){
                    no = no.replace(key,customFields.get(key));
                }
            }
        }*/

        //return sb.toString();
        return order;
    }
    public String addZero(String str,int num){
    	if(str.length()<num)
            for (int j = 0; j < num - str.length(); j++)
            	str = "0" + str;
    	return str;
    }



/*    @Override
    public String createRecordRuleorder(InfoTypeForm form, String sequencno) {
        String tablesuffix = "";
        if(RecordUtil.MODE_PIECE.equals(form.getMode())){
            tablesuffix = RecordUtil.PIECE;
        }else if(RecordUtil.MODE_VOLUMEPIECE.equals(form.getMode())){
            tablesuffix = RecordUtil.VOLUME;
        }
                //String no = order.replace(RecordUtil.FONDSID,fondsNo ).replace(RecordUtil.YEAR, year).replace(RecordUtil.DEADLINE,String.valueOf(form.getDeadline())).replace(RecordUtil.DEPARTMENT, String.valueOf(form.getDepartment())).replace(RecordUtil.SEQUENCENO, StringUtils.isEmpty(sequencno)?"":sequencno );
        Map<String,String> map0 = new HashMap<String,String>();
        map0.put(RecordUtil.FONDSID,fondsMapper.selectByPrimaryKey(form.getFonds()).getFondsno());
        map0.put(RecordUtil.YEAR,yearMapper.selectByPrimaryKey(form.getYear()).getName());
        map0.put(RecordUtil.DEPARTMENT,departmentMapper.selectByPrimaryKey(form.getDepartment()).getName());
        map0.put(RecordUtil.DEADLINE,deadlineMapper.selectByPrimaryKey(form.getDeadline()).getName());
        map0.put(RecordUtil.SEQUENCENO,StringUtils.isEmpty(sequencno)?"":sequencno);

        Rule rule = selectByRecordType(form.getRecordtype(),tablesuffix);
        String order = rule.getRuleorder();

        String[] orderArray = order.split("-");
        if(form.getCustomFields()!=null){
            map0.putAll(form.getCustomFields());
        }
        StringBuffer sb = new StringBuffer();
        for(String one:orderArray){
            if(map0.containsKey(one)){
                sb.append(map0.get(one)).append("-");
            }
        }
        String no = sb.toString();
        return no.substring(0,no.length()-2);
    }*/

	@Override
	public String getChineseRule(String recordtypeid,String tabletype) {
		String rule ;
		if(tabletype.equals(RecordUtil.VOLUME)){
			tabletype = RecordUtil.RECORD;
			rule = ruleMapper.getChineseRule(recordtypeid, tabletype);
			rule = rule.substring(0,rule.lastIndexOf("-"));
		}else{
			rule = ruleMapper.getChineseRule(recordtypeid, tabletype);
		}

        return rule;
	}

	@Override
	public int deleteByRecordTypeId(String recordtypeid) {
		return ruleMapper.deleteByRecordTypeId(recordtypeid);
	}

	@Override
	public String getRule(String recordtypeid, String tabletype) {
		String rule ;
		if(tabletype.equals(RecordUtil.VOLUME)){
			tabletype = RecordUtil.RECORD;
			rule = ruleMapper.getRule(recordtypeid, tabletype);
			rule = rule.substring(0,rule.lastIndexOf("-"));
		}else{
			rule = ruleMapper.getRule(recordtypeid, tabletype);
		}

        return rule;
	}


}
