package cn.com.jtang.service.impl;

import cn.com.jtang.dao.RecordTypeMapper;
import cn.com.jtang.dao.RecordVolumeMapper;
import cn.com.jtang.dao.custom.RecordViewMapper;
import cn.com.jtang.dao.custom.RecordVolumeViewMapper;
import cn.com.jtang.lucene.LuceneIndex;
import cn.com.jtang.po.*;
import cn.com.jtang.service.*;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.CreateVolumeForm;
import cn.com.jtang.web.controller.form.RecordVolumeForm;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.io.File;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("recordVolumeService")
@Transactional
public class RecordVolumeServiceImpl implements RecordVolumeService {

    @Resource
    private CommonService commonservice;
    @Resource
    private RecordViewMapper recordViewMapper;
    @Resource
    private RecordService recordService;
    @Resource
    private RecordVolumeMapper mapper;
    @Resource
    private RecordVolumeViewMapper recordVolumeViewMapper;
    @Resource
    private DanymicService danymicService;
    @Resource
    private DocumentService documentService;
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private RuleService ruleService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private RecordVolumeMapper recordVolumeMapper;
    @Resource
    private DeadlineService deadlineService;
    @Resource
    private LuceneIndex luceneIndex;
    @Resource
    private RecordTypeMapper recordTypeMapper;
    //@Value("${luceneurl}")
    @Value("${fileserverpath}")
    private String fileserverpath;


    @Override
    public int deleteByExample(RecordVolumeExample example) {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(RecordVolume recordVolume) {
        return mapper.insert(recordVolume);
    }

    @Override
    public List<RecordVolume> selectByExample(RecordVolumeExample example) {
        return recordVolumeViewMapper.selectByExample(example);
    }

    @Override
    public Page selectByExample(RecordVolumeExample example, Page page) {
        page.retrievePage(recordVolumeViewMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        example.setOrderByClause("SUBSTRING_INDEX(volumeNo, '-', 1) asc,	SUBSTRING(SUBSTRING_INDEX(volumeNo, '-' ,2),INSTR(volumeNo,'-')+1,3) + 1 ASC,"
        		+ "SUBSTRING(SUBSTRING_INDEX(volumeNo,'-',-3),1,3)+1 asc ,SUBSTRING(SUBSTRING_INDEX(volumeNo,'-',-2),1,3)+1 asc , SUBSTRING(SUBSTRING_INDEX(volumeNo,'-',-1),1,4)+1 asc,"
        		+ " SUBSTRING(SUBSTRING_INDEX(volumeNo,'-',-1),1,5)+1 asc, SUBSTRING(SUBSTRING_INDEX(volumeNo,'-',-1),1,6)+1 asc,volumeNo asc,volumeNo");
        page.setItems(recordVolumeViewMapper.selectByExample(example));
        return page;
    }

    @Override
    public RecordVolume selectByPrimaryKey(String id) {
        return recordVolumeViewMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByExampleSelective(RecordVolume recordVolume, RecordVolumeExample example) {
        return mapper.updateByExampleSelective(recordVolume, example);
    }

    @Override
    public int updateByPrimaryKey(RecordVolume recordVolume) {
        return mapper.updateByPrimaryKey(recordVolume);
    }

    @Override
    public int updateByPrimaryKeySelective(RecordVolume recordVolume) {
        return mapper.updateByPrimaryKeySelective(recordVolume);
    }

    @Override
    public int create(CreateVolumeForm form) {

        String tablePrefix = danymicService.getTablePrefix(form.getFonds(), form.getRecordtype());

        form.setId(IDGenerator.generator());
        /*form.setDeadline(deadlineService.checkAndCreate(form.getDeadlineStr()));
        form.setDepartment(departmentService.checkAndCreate(form.getDepartmentStr()));
        form.setYear(yearService.checkAndCreate(form.getYearStr()));*/
        if (StringUtils.isEmpty(form.getVolumeno())) {
            String no = ruleService.getVolumeRuleorder(form, tablePrefix);
            form.setVolumeno(no+"-"+getSeq(no,form.getRecordtype()));
        }else{
            form.setVolumeno(form.getVolumeno());
        }
        //form.setAddress(commonservice.createAddress(form.getShNo(),form.getShCabNo(),form.getShFloorNo()));
        form.setOperator(shiroUserService.getLoginUser().getUsername());
        form.setCheckstatus(RecordUtil.CHECK_PASS);
        form.setCreatetime(new Date());

        List<String> idList = form.getRecordIds();
        int size = idList.size();
        Date startDate = null;
        Date endDate = null;
        Date tempDate = null;
        int num = 0;
        List<Record> records = new ArrayList<>();
        for (int i = 0; i < size; i++) {

            Record record = recordViewMapper.selectByPrimaryKey(idList.get(i), tablePrefix + RecordUtil.RECORD);
            num += record.getPagenum();
            Date creartDate = record.getCreatetime();
            if (tempDate == null) {
                tempDate = creartDate;
                startDate = creartDate;
                endDate = creartDate;
            }

            if (tempDate.after(creartDate)) {
                startDate = creartDate;
            } else {
                endDate = creartDate;
            }
            record.setSequencno(String.valueOf(i + 1));
            record.setRecordno(form.getVolumeno() + "-" + record.getSequencno());
            luceneIndex.updateRecordNo(form.getVolumeno() + "-" + record.getSequencno(), idList.get(i), form.getRecordtype());
            record.setVolumeid(form.getId());

            records.add(i, record);
        }

        form.setPagenum(num);
        form.setTimerange(DateFormatUtils.format(startDate, "yyyy-MM-dd HH:MM:ss") + "---" + DateFormatUtils.format(endDate, "yyyy-MM-dd HH:MM:ss"));
        form.setInnersize(size);

        Map<String, String> customFields = form.getCustomFields();
        List<String> keys = new ArrayList<>();
        List<String> values = new ArrayList<>();
        if (customFields != null) {
            keys.addAll(customFields.keySet());
            values.addAll(customFields.values());
        }
        recordVolumeViewMapper.insertSelective(form, tablePrefix + RecordUtil.VOLUME, keys, values);

        for (Record record : records) {
            recordViewMapper.updateByPrimaryKeySelective(record, tablePrefix + RecordUtil.RECORD,null,null);
        }
        //pendingService.create(form.getFonds(), form.getRecordtype(), recordVolume.getId(), form.getRecordIds());

        return 1;
    }

    private String getSeq (String no, String recordTypeId) {
        List<RecordVolume> volumes = getLikeVolume(no,recordTypeId);
        String seq = "1";
        int max = 0;
        if(volumes!=null&&volumes.size()>0){
            List<Integer> seqs = new ArrayList<>();
            for(RecordVolume volume: volumes){
                String n = volume.getVolumeno();
                String oneSequence = n.substring(n.lastIndexOf("-")+1);
                int thisseq = Integer.valueOf(oneSequence);
                max = max <thisseq? thisseq:max;
            }
            seq = String.valueOf(max+1);
        }
        return seq;
    }

    @Override
    public List<RecordVolume> selectExportByExample(RecordVolumeExample example) {
        return recordVolumeViewMapper.selectExportByExample(example);
    }

    @Override
    public int updateByPrimaryKeySelective(RecordVolume recordVolume, String tableName) {

        return recordVolumeViewMapper.updateByPrimaryKeySelective(recordVolume, tableName, null, null);
    }

    @Override
    public int updateAddress(RecordVolumeForm form, String tableName) {
        form.setAddress(commonservice.createAddress(form.getShNo(), form.getShCabNo(), form.getShFloorNo()));
        return updateByPrimaryKeySelective(form, tableName);
    }

    @Override
    public List<RecordVolume> selectByNo(String recordno, String recordtypeid) {

        RecordVolumeExample example = new RecordVolumeExample();
        RecordVolumeExample.Criteria criteria = example.createCriteria();
        example.setTableName(danymicService.getTablePrefix(recordtypeid) + RecordUtil.VOLUME);

        criteria.andVolumenoEqualTo(recordno);

        return mapper.selectByExample(example);
    }

    @Override
    public boolean isExistByNo(String recordno,  String recordtypeid) {
        List<RecordVolume> records = selectByNo(recordno,  recordtypeid);
        boolean status = false;
        if((records != null && !records.isEmpty())||(isPieceExistByNo(recordno,recordtypeid))||isRecordExistByNo(recordno, recordtypeid)){
            status = true;
        }
        return status;
    }

    private boolean isPieceExistByNo (String recordno, String recordtypeid) {
        List<Record> records = selectPieceByNo(recordno,recordtypeid);
        return records != null && !records.isEmpty();
    }

    private List<Record> selectPieceByNo (String recordno, String recordtypeid) {
        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();
        example.setTableName(danymicService.getTablePrefix(recordtypeid) + RecordUtil.PIECE);

        criteria.andRecordnoEqualTo(recordno);

        return recordViewMapper.selectByExample(example);
    }
    private boolean isRecordExistByNo (String recordno, String recordtypeid) {
        List<Record> records = selectRecordByNo(recordno,recordtypeid);
        return records != null && !records.isEmpty();
    }

    private List<Record> selectRecordByNo (String recordno, String recordtypeid) {
        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();
        example.setTableName(danymicService.getTablePrefix(recordtypeid) + RecordUtil.RECORD);

        criteria.andRecordnoEqualTo(recordno);

        return recordViewMapper.selectByExample(example);
    }

    @Override
    public Map getMapValue(String volumeId, String fondsId, String recordTypeId) {
        String tablePrefix = danymicService.getTablePrefix(fondsId, recordTypeId);
        return danymicService.getMapValue(tablePrefix + RecordUtil.VOLUME, volumeId);
    }

    @Override
    public int edit(CreateVolumeForm volumeCreateForm) {
        String tablePrefix = danymicService.getTablePrefix(volumeCreateForm.getFonds(), volumeCreateForm.getRecordtype());
        Map<String, String> customFields = volumeCreateForm.getCustomFields();
        List<String> keys = new ArrayList<>();
        if (customFields != null) {
            keys.addAll(customFields.keySet());
        }
        if (StringUtils.isEmpty(volumeCreateForm.getVolumeno())) {
            volumeCreateForm.setVolumeno(null);
        }
        return recordVolumeViewMapper.updateByPrimaryKeySelective(volumeCreateForm, tablePrefix + RecordUtil.VOLUME, keys, customFields);
    }

    @Override
    public void uncoverVolume(String volumeId, String fondsId, String recordTypeId) {
        String prefix = danymicService.getTablePrefix(fondsId, recordTypeId);
        //set record to no volumeid
        RecordExample example = new RecordExample();
        example.setTableName(prefix + RecordUtil.RECORD);
        RecordExample.Criteria criteria = example.createCriteria();
        criteria.andVolumeidEqualTo(volumeId);

        Record record = new Record();
        record.setVolumeid(null);
        recordViewMapper.updateByExampleSelective2(record, example);

        //delete volume
        RecordVolumeExample example1 = new RecordVolumeExample();
        RecordVolumeExample.Criteria criteria1 = example1.createCriteria();

        criteria1.andIdEqualTo(volumeId);
        example1.setTableName(prefix + RecordUtil.VOLUME);
        deleteByExample(example1);

    }

    @Override
    public boolean isStopNo(String volumeno, String recordtypeid) {
        RecordType recordType = recordTypeMapper.selectByPrimaryKey(recordtypeid);
        int index = recordType.getVolumenoindex();
        boolean status = false;

        if(volumeno.lastIndexOf("-")!=-1){
            String inputindex = volumeno.substring(volumeno.lastIndexOf("-")+1);
            int iindex = Integer.valueOf(inputindex);
            if(iindex<=index){
                status = true;
            }
        }

        return status;
    }

    @Override
    public boolean isExistByNo (String volumeno) {
        List<RecordType> recordTypes = recordTypeMapper.selectByExample(new RecordTypeExample());
        boolean status = false;
        for(RecordType recordType : recordTypes){
            if(isExistByNo(volumeno,recordType.getId())){
                status = true;
                break;
            }
        }
        return status;
    }

    @Override
    public int deleteByNo (String volumeno,String tableprefix,String type, String recordtypeid) {
        if(type.equals(RecordUtil.VOLUME)){

            List<Record> records = recordService.getRecordByVolumeNo( volumeno, tableprefix);
            
            for(Record record:records){
                luceneIndex.deleteByRecordNo(record.getRecordno(), RecordUtil.RECORD,recordtypeid);
                List<Document> docs = documentService.selectByRecord(record.getId(), tableprefix+RecordUtil.DOCUMENT);
                for(Document doc:docs)
            		deleteFile(new File(fileserverpath+doc.getPath()));
            }
        	return recordVolumeViewMapper.deleteVolumeByNo(volumeno,tableprefix);
        }else if(type.equals(RecordUtil.RECORD)){
        	luceneIndex.deleteByRecordNo(volumeno, type,recordtypeid);
            List<Document> docs = documentService.selectByRecordNo(volumeno, tableprefix,RecordUtil.RECORD);
            for(Document doc:docs)
        		deleteFile(new File(fileserverpath+doc.getPath()));
        	return recordVolumeViewMapper.deleteRecordByNo(volumeno,tableprefix+type,tableprefix+RecordUtil.DOCUMENT);
        }else{
        	luceneIndex.deleteByRecordNo(volumeno, type,recordtypeid);
            List<Document> docs = documentService.selectByRecordNo(volumeno, tableprefix,RecordUtil.PIECE);
            for(Document doc:docs)
        		deleteFile(new File(fileserverpath+doc.getPath()));
        	return recordVolumeViewMapper.deleteRecordByNo(volumeno,tableprefix+type,tableprefix+RecordUtil.PIECEDOCUMENT);
        }
    }
	@Override
	public String getVolumeidByVolumeNo(String volumeNo,String tablename) {
		return recordVolumeViewMapper.getVolumeidByVolumeNo(volumeNo, tablename);
	}

    @Override
    public int getSequence (CreateVolumeForm form) {

        String tablePrefix = danymicService.getTablePrefix(form.getRecordtype());
        Rule rule = ruleService.selectByRecordType(form.getRecordtype(),RecordUtil.VOLUME);
        String order = rule.getRuleorder().replace("-"+RecordUtil.SEQUENCNO, "").replace("-"+RecordUtil.YEAR,"").replace("-"+RecordUtil.DEADLINE,"").replace("-"+RecordUtil.DEPARTMENT,"");
        order = rule.getRuleorder().replace("."+RecordUtil.SEQUENCNO, "").replace("."+RecordUtil.YEAR,"").replace("."+RecordUtil.DEADLINE,"").replace("."+RecordUtil.DEPARTMENT,"");

        String[] array = order.replace(",", "-").split("-");
        RecordVolumeExample example = new RecordVolumeExample();
        RecordVolumeExample.Criteria criteria = example.createCriteria();
        example.setTableName(tablePrefix+RecordUtil.VOLUME);
        criteria.andYearEqualTo(form.getYear());
        criteria.andDepartmentEqualTo(form.getDepartment());
        criteria.andDeadlineEqualTo(form.getDeadline());
        for(String one:array){
           Map<String,String> customFields =  form.getCustomFields();
            Map<String, String> customIndexFields = form.getCustomIndexFields();
            String value = "";
            if(customFields!=null&&customFields.containsKey(one)){
                value = customFields.get(one);
            }else if(customIndexFields!=null&&customIndexFields.containsKey(one)){
                value= customIndexFields.get(one);
            }
            if(!StringUtils.isEmpty(value)){
                criteria.andOneEqualTo(one,value);
            }
        }
        int i = recordVolumeMapper.countByExample(example);

        return  i+1;
    }


    @Override
    public Map<String,Object> checkVolumeNo (String volumeno, String recordtypeid) {
        Map<String,Object> result = new HashMap<>();
        String prefix = volumeno;
        String sequence = "";
        if(volumeno.indexOf("-")!=-1){
            prefix = volumeno.substring(0,volumeno.lastIndexOf("-"));
            sequence = volumeno.substring(volumeno.lastIndexOf("-")+1);
        }
        if(!isNumeric(sequence)){
            prefix = volumeno;
            sequence = "1";
        }
        int thisseq = Integer.valueOf(sequence);
        List<RecordVolume> volumes = getLikeVolume(prefix,recordtypeid);

        if(volumes!=null&&volumes.size()>0){
            List<Integer> seqs = new ArrayList<>();
            boolean status = false;
            for(RecordVolume volume: volumes){
                String no = volume.getVolumeno();
                String noPrefix = no;
                String oneSequence = "";
                if(no.indexOf("-")!=-1){
                    noPrefix = no.substring(0,no.lastIndexOf("-"));
                    oneSequence = no.substring(no.lastIndexOf("-")+1);
                }
                if(!isNumeric(sequence)){
                    noPrefix = no;
                    oneSequence = "1";
                }
                if(no.equals(prefix)){
                    status = true;
                    break;
                }
                if(prefix.equals(noPrefix)){
                    seqs.add(Integer.valueOf(oneSequence));
                }
            }
            if(status||seqs.contains(thisseq)){
                result.put("success",false);
                result.put("message","档号已存在!");
            }else if(seqs.size()>0){
                result.putAll(getListPosition(thisseq,seqs));
            }else{
                result.put("success",true);
            }
        }else {
            result.put("success",true);
        }

        return result;
    }

    @Override
    public List<String> selectIdsByExample (RecordVolumeExample example) {
        return recordVolumeMapper.selectIdsByExample(example);
    }

    private Map<String,Object> getListPosition (int thisseq, List<Integer> seqs) {

        Map<String,Object> result = new HashMap<>();
        StringBuffer sb1 = new StringBuffer();
        StringBuffer sb2 = new StringBuffer();
        int max = 0;
        for(Integer i:seqs){
            max = max>i?max:i;
            if(thisseq>i){
                sb1.append(i).append(",");
            }else{
                sb2.append(i).append(",");
            }
        }
        result.put("success",false);
        if(sb1.length()>=0&&sb2.length()>0){
            result.put("message","您的档号属于断号，目前已有的档号顺序号为"+sb1.toString()+","+sb2.toString()+"建议改变最后的顺序号！");
        }else if(sb2.length()==0&&thisseq>max+1){
            result.put("message","您的档号属于跳号，目前已有的档号顺序号为"+sb1.toString()+"建议改变最后的顺序号！");
        }else{
            result.put("success",true);
        }
        return result;
    }

    private List<RecordVolume> getLikeVolume (String noprefix, String recordtypeid) {
        String tablePrefix = danymicService.getTablePrefix(recordtypeid);

        RecordVolumeExample example = new RecordVolumeExample();
        RecordVolumeExample.Criteria criteria = example.createCriteria();
        example.setTableName(tablePrefix+RecordUtil.VOLUME);
        criteria.andVolumenoLike("%"+noprefix+"%");
        return recordVolumeMapper.selectByExample(example);
    }
    public boolean isNumeric(String str){
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if( !isNum.matches() ){
            return false;
        }
        return true;
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
}
