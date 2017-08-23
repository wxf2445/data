package cn.com.jtang.service.impl;

import cn.com.jtang.dao.RecordMapper;
import cn.com.jtang.dao.custom.RecordViewMapper;
import cn.com.jtang.lucene.LuceneIndex;
import cn.com.jtang.po.*;
import cn.com.jtang.po.custom.RecordView;
import cn.com.jtang.po.custom.RecordViewExample;
import cn.com.jtang.service.*;
import cn.com.jtang.util.*;
import cn.com.jtang.web.controller.form.*;
import cn.com.jtang.web.controller.form.template.Column;

import com.alibaba.fastjson.JSONArray;
import com.itextpdf.text.pdf.PdfReader;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("recordService")
@Transactional
public class RecordServiceImpl implements RecordService {

    @Resource
    private CommonService commonservice;
    /*@Resource
    private LuceneIndex luceneIndex;*/
    @Resource
    private RecordMapper mapper;
    @Resource
    private RecordViewMapper recordViewMapper;
    @Resource
    private RecordService recordService;
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private YearService yearService;
    @Resource
    private DeadlineService deadlineService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    private DocumentService documentService;
    @Resource
    private FileService fileService;
    @Resource
    private FondsService fondsService;
    @Resource
    private RuleService ruleService;
    @Resource
    private DanymicService danymicService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private InfoService infoService;
    @Resource
    private LogService logService;
    @Resource
    private LuceneIndex luceneIndex;
    @Value("${fileserverpath}")
    private String ROOT_PATH;

    @Override
    public int countAll(String tableName) {
        return recordViewMapper.countAll(tableName);
    }

    @Override
    public PageView getCanBuildRecord(RecordSearchForm buildRecordSearchForm) {

        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();

        Fonds fonds = fondsService.selectByPrimaryKey(buildRecordSearchForm.getFondsId());
        RecordType recordType = recordTypeService.selectByPrimaryKey(buildRecordSearchForm.getRtId());
        example.setTableName((fonds.getFondsno() + "_" + recordType.getTypeno() + RecordUtil.RECORD).toLowerCase());
        criteria.andDepartmentEqualTo(Integer.valueOf(buildRecordSearchForm.getDepartment()));

        criteria.andVolumeidIsNull();

        if (buildRecordSearchForm.getStarttime() != null) {
            criteria.andCreatetimeGreaterThanOrEqualTo(buildRecordSearchForm.getStarttime());
        }
        if (buildRecordSearchForm.getEndtime() != null) {
            criteria.andCreatetimeLessThanOrEqualTo(buildRecordSearchForm.getEndtime());
        }

        if (!StringUtils.isEmpty(buildRecordSearchForm.getKey())) {
            criteria.andSubjectLike(buildRecordSearchForm.getKey());
        }

        int page = (buildRecordSearchForm.getPage() == null)
                ? 0
                : buildRecordSearchForm.getPage();
        int size = (buildRecordSearchForm.getSize() == null)
                ? 0
                : buildRecordSearchForm.getSize();
        Page pageObject = new Page(null, 0, page, size);
        return new PageView(selectByExample(example, pageObject));

    }

    @Override
    public String createAndUploadFile(RecordForm uploadFileAndInfo, List<MultipartFile> files) throws IOException {
        String tablePrefix = danymicService.getTablePrefix(uploadFileAndInfo.getFonds(), uploadFileAndInfo.getRecordtype());
        //save record info into database
        String fonds = uploadFileAndInfo.getFonds();
        String recordtype = uploadFileAndInfo.getRecordtype();
        uploadFileAndInfo.setYear(yearService.checkAndCreate(uploadFileAndInfo.getYearStr()));
        uploadFileAndInfo.setDepartment(departmentService.checkAndCreate(uploadFileAndInfo.getDepartmentStr()));
        uploadFileAndInfo.setDeadline(deadlineService.checkAndCreate(uploadFileAndInfo.getDeadlineStr()));

        Record record = new Record();
        record.setId(IDGenerator.generator());
        //record.setRecordno(ruleService.getRecordRuleorder(uploadFileAndInfo));
        //record.setFontsid(fonds);
        record.setYear(Integer.valueOf(uploadFileAndInfo.getYear()));
        record.setDepartment(Integer.valueOf(uploadFileAndInfo.getDepartment()));
        record.setDeadline(Integer.valueOf(uploadFileAndInfo.getDeadline()));
        record.setPeople("");
        record.setSubject("");
        record.setSequencno("");
        record.setCheckstatus(RecordUtil.NOT_CHECK);
        record.setCreatetime(new Date());

        Map<String, String> customFields = uploadFileAndInfo.getCustomFields();
        List<String> keys = new ArrayList<>(customFields.keySet());
        List<String> values = new ArrayList<>(customFields.values());
        recordViewMapper.insertSelective(record, tablePrefix + RecordUtil.RECORD, keys, values);

        //put file to filebase
        String prePath = FileUtils.getPath(ROOT_PATH);
        for (MultipartFile file : files) {
            if (file.getSize() != 0) {
                fileService.writeFile(file.getInputStream(), prePath + file.getOriginalFilename());
                //save document info into database
                Document document = new Document();
                document.setId(IDGenerator.generator());
                document.setRecordid(record.getId());
                document.setPath(prePath + file.getOriginalFilename());
                document.setUploadtime(new Date());
                documentService.insert(document, tablePrefix + RecordUtil.DOCUMENT);
            }
        }

        return record.getId();
    }

    @Override
    public int deleteByExample(RecordExample example) {
        return mapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(String id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Record record, String tableId) {
        return recordViewMapper.insert(record, tableId);
    }
    @Override
    public int insert(List<String> fieldname,List<String> fieldvalue,String tablename,String id) {
    	String username = shiroUserService.getLoginUser().getUsername();
        return recordViewMapper.insertByFieldNameAndValue(fieldname, fieldvalue,tablename,id,username);
    }

    @Override
    public List<Record> selectByExample(RecordExample example) {
        return recordViewMapper.selectByExample(example);
    }

    @Override
    public Page selectByExample(RecordExample example, Page page) {
        page.retrievePage(recordViewMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        example.setOrderByClause("SUBSTRING_INDEX(recordNo, '-', 1) asc,	SUBSTRING(SUBSTRING_INDEX(recordNo, '-' ,2),INSTR(recordNo,'-')+1,3) + 1 ASC,"
        		+ "SUBSTRING(SUBSTRING_INDEX(recordNo,'-',-3),1,3)+1 asc ,SUBSTRING(SUBSTRING_INDEX(recordNo,'-',-2),1,3)+1 asc , SUBSTRING(SUBSTRING_INDEX(recordNo,'-',-1),1,4)+1 asc,"
        		+ " SUBSTRING(SUBSTRING_INDEX(recordNo,'-',-1),1,5)+1 asc, SUBSTRING(SUBSTRING_INDEX(recordNo,'-',-1),1,6)+1 asc,recordNo asc,recordNo");
        page.setItems(recordViewMapper.selectByExample(example));
        return page;
    }

    @Override
    public Record selectByPrimaryKey(String id, String tableName) {
        return recordViewMapper.selectByPrimaryKey(id, tableName);
    }

    @Override
    public RecordView selectViewByPrimaryKey(String id, String tableName) {
        return recordViewMapper.selectViewByPrimaryKey(id, tableName);
    }

    @Override
    public int updateByExampleSelective(Record record, RecordExample example) {
        return mapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateByPrimaryKey(Record record) {
        return mapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Record record) {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public Page getApplyRecord(RecordViewExample example, Page page, String tablename) {
        tablename = tablename.toLowerCase();
        page.retrievePage(recordViewMapper.getApplyRecordCount(example, tablename));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(recordViewMapper.getApplyRecord(example, tablename));
        return page;
    }

    @Override
    public Map<String, Object> getImformation(SelectImformation record) {
        return recordViewMapper.getImformation(record);
    }

    @Override
    public Map<String, Object> getRecordNoMapData(SelectImformation record) {
        return recordViewMapper.getRecordNoMapData(record);
    }

    @Override
    public int checkPass(String tablename, String recordid, String recordno) {
        Map<String, Object> record = recordViewMapper.selectRecordMapByRecordId(tablename, recordid);
        logService.insert("通过了新档案---" + record.get(RecordUtil.SUBJECT) + "(申请人：" + record.get(RecordUtil.OPERATOR) + ")的认证申请");
        String[] countArr = recordno.replace(".", "-").split("-");
        if(!recordno.contains("-"))
        	return recordViewMapper.checkPass(tablename, recordid, recordno, "1", RecordUtil.CHECK_PASS);
        else
        	return recordViewMapper.checkPass(tablename, recordid, recordno, countArr[countArr.length - 1], RecordUtil.CHECK_PASS);
    }

    @Override
    public int refusePass(String tablename, String recordid, String failReason) {

        Record record = recordService.selectByPrimaryKey(recordid, tablename);
        logService.insert("否定了新档案---" + record.getSubject() + "(申请人：" + record.getOperator() + "的认证申请,并提出反馈意见:" + failReason + "。");
        recordViewMapper.insertCheckInfo(tablename, recordid, failReason);
        return recordViewMapper.refusePass(tablename, recordid, RecordUtil.CHECK_NOTPASS);
    }

    @Override
    public void typeInfo(InfoTypeForm infoTypeForm) throws IOException {
        String tableid = infoTypeForm.getTableid();
        String tablePrefix = danymicService.getTablePrefix(infoTypeForm.getFonds(), infoTypeForm.getRecordtype());
        String tableName = "";
        String documentName = "";
        String type = "";
        //boolean isAddress = false;
        /*if (RecordUtil.MODE_VOLUMEPIECE.equals(infoTypeForm.getMode())) {
            type = RecordUtil.RECORD;
            documentName = tablePrefix + RecordUtil.DOCUMENT;
        } else */
        if (RecordUtil.MODE_PIECE.equals(infoTypeForm.getMode())) {
            type = RecordUtil.PIECE;
            documentName = tablePrefix + RecordUtil.PIECEDOCUMENT;
            RecordExample example = new RecordExample();
            example.setTableName(tablePrefix + type);
            //isAddress = true;
        }else{
            type = RecordUtil.RECORD;
            documentName = tablePrefix + RecordUtil.DOCUMENT;
        }
        tableName = tablePrefix + type;
        //save record info into database
        String fonds = infoTypeForm.getFonds();
        String recordtype = infoTypeForm.getRecordtype();


        infoTypeForm.setId(IDGenerator.generator());

        //put file to filebase
        //String prePath = FileUtils.getPath(ROOT_PATH);
        String prePath = tablePrefix+ type + "/" + infoTypeForm.getId() + "/";
        PdfReader pdfReader = null;
        int pagenums = 0;
        List<Document> documents = new ArrayList<>();
        for (MultipartFile file : infoTypeForm.getResFile()) {
            if (file.getSize() != 0) {

                String fileName = file.getOriginalFilename();
                String suffix = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
                String relativePath = prePath + fileName;
                String prefix = relativePath.substring(0,relativePath.lastIndexOf("."));
                fileService.writeAllFile(file.getInputStream(), ROOT_PATH+prefix,suffix);

                //save document info into database
                Document document = new Document();
                document.setId(IDGenerator.generator());
                document.setRecordid(infoTypeForm.getId());
                document.setPath(relativePath);
                document.setUploadtime(new Date());
                documents.add(document);
                int page = 0;
                if (fileName.endsWith("pdf")) {
                    pdfReader = new PdfReader(file.getInputStream());
                    page = pdfReader.getNumberOfPages();
                } else {
                    page = 1;
                }

                pagenums += page;
            }
        }

        infoTypeForm.setPagenum(pagenums);
        //customfields
        Map<String, String> customFields = infoTypeForm.getCustomFields();
        Map<String, String> customIndexFields = infoTypeForm.getCustomIndexFields();
        List<String> keys = new ArrayList<>();
        List<String> values = new ArrayList<>();
        if (customFields == null) {
            customFields = new HashMap<>();
        }
        if (customIndexFields != null) {
            customFields.putAll(customIndexFields);
        }
        keys.addAll(customFields.keySet());
        values.addAll(customFields.values());

        //infoTypeForm.setSequencno(String.valueOf(recordViewMapper.countAll(tableName)));
        //infoTypeForm.setRecordno(ruleService.createRecordRuleorder(infoTypeForm,infoTypeForm.getSequencno()));
        infoTypeForm.setCheckstatus(RecordUtil.SUBMIT_CHECK);
        /*if(isAddress){
            infoTypeForm.setAddress(commonservice.createAddress(infoTypeForm.getShNo(),infoTypeForm.getShCabNo(),infoTypeForm.getShFloorNo()));
        }*/
        infoTypeForm.setOperator(shiroUserService.getLoginUser().getUsername());
        infoTypeForm.setCreatetime(new Date());


        recordViewMapper.insertSelective(infoTypeForm, tableName, keys, values);

        if (!documents.isEmpty()) {
            for (Document document : documents) {
                /*try {
                    luceneIndex.index(infoTypeForm.getSubject(),infoTypeForm.getId(),infoTypeForm.getRecordtype(),type,ROOT_PATH+ document.getPath());
                } catch (Exception e) {
                    e.printStackTrace();
                }*/
                documentService.insert(document, documentName);
            }
        }

     /*   Record record = new Record();
        record.setId(infoTypeForm.getRecordId());
        record.setSubject(infoTypeForm.getSubject());
        record.setPeople(infoTypeForm.getPeople());
        record.setTableid(infoTypeForm.getTableId());
        record.setCheckstatus(RecordUtil.SUBMIT_CHECK);*/

        //recordViewMapper.updateByPrimaryKeySelective(record, tablePrefix + RecordUtil.RECORD);

        if (!StringUtils.isEmpty(tableid) && infoTypeForm.getListSize() != null) {
            if (infoTypeForm.getListSize() == 1) {
                StringBuffer sb = new StringBuffer();
                for (String dd : infoTypeForm.getLists()) {
                    sb.append(dd).append(",");
                }
                String all = sb.toString();
                infoTypeForm.getLists().clear();
                infoTypeForm.getLists().add(all.substring(0, all.length() - 1));
            }
            danymicService.insertInfo(infoTypeForm.getLists(), infoTypeForm.getColSize(), tableid, infoTypeForm.getId());
        }
    }

    private String createAddress(String shId, String shCabNo, String shFloorNo) {
        StringBuffer sb = new StringBuffer();
        sb.append(shId).append("-").append(shCabNo).append("-").append(shFloorNo);
        return sb.toString();
    }

    @Override
    public Map selectVolumeAndRecordContent(ColSearchForm colSearchForm) {
        String tableid = colSearchForm.getTableid();

        List<String> ids = danymicService.selectRecordIdsByRecordContent(colSearchForm);

        RecordExample example = null;
        Map result = new HashMap<>();
        if (ids != null && !ids.isEmpty()) {
            result.put("hasresult", true);
            example = new RecordExample();
            RecordExample.Criteria criteria = example.createCriteria();
            example.setStart((colSearchForm.getPage() - 1) * colSearchForm.getSize());
            example.setLimit(colSearchForm.getSize());

            String suffix = "";
            String prefix = tableid.substring(0, tableid.lastIndexOf("_"));
            List<TableField> tableFields = recordTypeService.getCustomIndexFields(colSearchForm.getTypeid(), RecordUtil.VOLUME);

            if ("0".equals(colSearchForm.getPattern())) {
                suffix = RecordUtil.RECORD;
                String tableName = prefix + suffix;
                criteria.andThisIdIn(ids);
                criteria.andVolumeidIsNotNull();

                Map mapvalue = danymicService.getColMapValue(colSearchForm.getTypeid(), RecordUtil.RECORD);

                List<String> innercols = new ArrayList<>(mapvalue.keySet());

                SearchPage searchPage = new SearchPage();
                searchPage.setPage(colSearchForm.getPage());
                searchPage.setSize(colSearchForm.getSize());
                selectVolumeAndRecord(tableName, example, searchPage);
                Map<String, ?> volumeInnerMaps = searchPage.getItems();

                result.put("totalpage", searchPage.getTotalpage());
                result.put("pages", searchPage.getPages());
                result.put("page", searchPage.getPage());
                result.put("size", searchPage.getSize());
                result.put("total", searchPage.getTotal());
                result.put("innercolmap", mapvalue);
                innercols.remove("recordNo");
                innercols.remove("sequencNo");
                result.put("innercols", innercols);
                result.put("innermaps", volumeInnerMaps);
                //get volumes
                Set volumeids = volumeInnerMaps.keySet();
                List<String> volumeList = new ArrayList<>(volumeids);
                result.put("volumeids", volumeids);

                mapvalue = danymicService.getColMapValue(colSearchForm.getTypeid(), RecordUtil.VOLUME);

                mapvalue.remove("timerange");
                List<String> volumecols = new ArrayList<>(mapvalue.keySet());

                Map idvalue = new HashMap<>();
                for (String volumeid : volumeList) {
                    RecordExample volumeExample = new RecordExample();
                    RecordExample.Criteria criteria1 = volumeExample.createCriteria();
                    criteria1.andTargetIdEqualTo(volumeid);

                    criteria1.andCheckstatusEqualTo("1");
                    Iterator it = tableFields.iterator();
                    while (it.hasNext()) {
                        TableField tableField = (TableField) it.next();
                        if (volumecols.contains(tableField.getFieldName())) {
                            volumecols.remove(tableField.getFieldName());
                        }
                    }
                    JSONArray jsonArray = new JSONArray();
                    List<Object> records = danymicService.selectByCols(volumecols, tableFields, prefix + RecordUtil.VOLUME, volumeExample);
                    jsonArray.addAll(records);

                    idvalue.put(volumeid, records);
                    logService.insert("在模板字段-案卷查询－此次查询显示"+records.size()+"条");
                }
                volumecols = new ArrayList<>(mapvalue.keySet());
                volumecols.remove("volumeNo");
                //result.put("volumenames",mapvalue.values());
                result.put("volumecolmap", mapvalue);
                result.put("volumecols", volumecols);
                result.put("idvalue", idvalue);
            } else if ("1".equals(colSearchForm.getPattern())) {
                suffix = RecordUtil.PIECE;

                Map mapvalue = danymicService.getColMapValue(colSearchForm.getTypeid(), suffix);
                mapvalue.remove("timerange");
                List<String> cols = new ArrayList<>(mapvalue.keySet());


                RecordExample pieceExample = new RecordExample();
                RecordExample.Criteria criteria1 = pieceExample.createCriteria();
                criteria1.andThisIdIn(ids);
                criteria1.andCheckstatusEqualTo("1");
                Iterator it = tableFields.iterator();
                while (it.hasNext()) {
                    TableField tableField = (TableField) it.next();
                    if (cols.contains(tableField.getFieldName())) {
                        cols.remove(tableField.getFieldName());
                    }
                }
                //JSONArray jsonArray = new JSONArray();
                Page pageObject = new Page(null, 0, colSearchForm.getPage(), colSearchForm.getSize());
                danymicService.selectPageByCols(cols, tableFields, prefix + suffix, pieceExample, pageObject);
                //jsonArray.addAll(records);
                cols.remove("recordno");
                cols.remove("sequencNo");

                result.put("piececolmap", mapvalue);
                result.put("pieceecols", cols);
                result.put("pieces", new PageView(pageObject));
                logService.insert("在模板字段-按件查询－此次查询显示"+pageObject.getTotalCount()+"条");
            }

        } else {
            result.put("hasresult", false);
        }
        return result;
    }

    @Override
    public List<PageView> selectRecordContent(ColSearchForm colSearchForm) {
        String tableid = colSearchForm.getTableid();
        Page pageObject = null;
        List<PageView> allpage = new ArrayList<>();
        if (StringUtils.isEmpty(tableid)) {
            List<Column> cols = colSearchForm.getCols();
            Column column = cols.get(0);
            List<Info> infos = infoService.selectByColName(column.getColname());
            ColSearchForm copy1 = new ColSearchForm();
            for (Info info : infos) {
                pageObject = new Page(null, 0, colSearchForm.getPage(), colSearchForm.getSize());
                if ("0".equals(colSearchForm.getPattern())) {
                    tableid = info.getTableid();
                } else if ("1".equals(colSearchForm.getPattern())) {
                    tableid = info.getPiecetableid();
                }
                colSearchForm.setTableid(tableid);
                String fondsNo = tableid.substring(0, tableid.indexOf("_"));
                String recordTypeNo = tableid.substring(tableid.indexOf("_") + 1, tableid.lastIndexOf("_"));
                Fonds fonds = fondsService.selectByFondsNo(fondsNo);
                RecordType recordType = recordTypeService.selectByNo(recordTypeNo);
                column.setColid(info.getColumnid());
                PageView pageView = new PageView(selectContent(colSearchForm));
                if (pageView.getPage().getTotalCount() != 0) {
                    pageView.setTITLE(fonds.getName() + "(" + recordType.getName() + ")");
                    pageView.setRecordTypeId(recordType.getId());
                    allpage.add(pageView);
                }
            }
        } else {
            allpage.add(new PageView(selectContent(colSearchForm)));
        }

        return allpage;
    }

    @Override
    public List<Record> getByVolumeId(String volumeId, String fondsId, String recordTypeId) {

        String prefix = danymicService.getTablePrefix(fondsId, recordTypeId);

        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();
        example.setTableName(prefix + RecordUtil.RECORD);
        criteria.andVolumeidEqualTo(volumeId);
        example.setOrderByClause("createtime asc");

        return recordViewMapper.selectByExample(example);
    }

    @Override
    public List<Record> getByVolumeIds(List<String> volumeIds, String tablename) {

        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();
        example.setTableName(tablename);
        criteria.andVolumeidIn(volumeIds);
        example.setOrderByClause("createtime asc");

        return recordViewMapper.selectByExample(example);
    }
    

    @Override
    public List<Record> getByVolumeNo(String volumeId, String tablePrefix) {


        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();
        example.setTableName(tablePrefix + RecordUtil.RECORD);
        criteria.andVolumeidEqualTo(volumeId);

        return recordViewMapper.selectByExample(example);
    }
    @Override
    public List<Record> getRecordByVolumeNo(String volumeNo, String tablePrefix) {


        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();
        example.setTableName(tablePrefix + RecordUtil.RECORD);
        criteria.andVolumenoEqualTo(volumeNo);

        return recordViewMapper.selectByExample(example);
    }

    Page selectContent(ColSearchForm colSearchForm) {
        String tableid = colSearchForm.getTableid();
        Page pageObject = new Page(null, 0, colSearchForm.getPage(), colSearchForm.getSize());
        List<String> ids = danymicService.selectRecordIdsByRecordContent(colSearchForm);

        RecordExample example = null;

        if (ids.size() != 0) {
            example = new RecordExample();
            RecordExample.Criteria criteria = example.createCriteria();

            String suffix = "";
            if ("0".equals(colSearchForm.getPattern())) {
                suffix = RecordUtil.RECORD;
            } else if ("1".equals(colSearchForm.getPattern())) {
                suffix = RecordUtil.PIECE;
            }
            example.setTableName(tableid.substring(0, tableid.lastIndexOf("_")) + suffix);
            criteria.andIdIn(ids);
            recordService.selectByExample(example, pageObject);
        }
        return pageObject;
    }

    @Override
    public String getFailReason(String recordid) {
        return recordViewMapper.getFailReason(recordid);
    }

    @Override
    public void updateInfo(InfoTypeForm infoTypeForm) throws IOException {
        String tableid = infoTypeForm.getTableid();
        String tablePrefix = danymicService.getTablePrefix(infoTypeForm.getFonds(), infoTypeForm.getRecordtype());
        String tableName = "";
        String documentName = "";
        String type = RecordUtil.PIECE;
        if (RecordUtil.MODE_VOLUMEPIECE.equals(infoTypeForm.getMode())) {
        	type = RecordUtil.RECORD;
            tableName = tablePrefix + RecordUtil.RECORD;
            documentName = tablePrefix + RecordUtil.DOCUMENT;
        } else if (RecordUtil.MODE_PIECE.equals(infoTypeForm.getMode())) {
            tableName = tablePrefix + RecordUtil.PIECE;
            documentName = tablePrefix + RecordUtil.PIECEDOCUMENT;
        }
        //save record info into database
        String fonds = infoTypeForm.getFonds();
        String recordtype = infoTypeForm.getRecordtype();
        //infoTypeForm.setYear(String.valueOf(yearService.checkAndCreate(infoTypeForm.getYear())));
        //infoTypeForm.setDepartment(String.valueOf(departmentService.checkAndCreate(infoTypeForm.getDepartment())));
        //infoTypeForm.setDeadline(String.valueOf(deadlineService.checkAndCreate(infoTypeForm.getDeadline())));

        //record.setYear(Integer.valueOf(infoTypeForm.getYear()));
        //record.setDepartment(Integer.valueOf(infoTypeForm.getDepartment()));
        //record.setDeadline(Integer.valueOf(infoTypeForm.getDeadline()));
        //infoTypeForm.setPeople(infoTypeForm.getPeople());
        //infoTypeForm.setSubject(infoTypeForm.getSubject());
        //record.setSequencno(String.valueOf(recordViewMapper.countAll(tableName)));
        //record.setRecordno(ruleService.getRecordRuleorder(infoTypeForm,record.getSequencno()));

        Record oldRecord = recordService.selectByPrimaryKey(infoTypeForm.getId(), tableName);

        if (RecordUtil.CHECK_NOTPASS.equals(oldRecord.getCheckstatus())) {
            infoTypeForm.setCheckstatus(RecordUtil.SUBMIT_CHECK);
        }
        //record.setAddress(infoTypeForm.getAddress());
        infoTypeForm.setOperator(shiroUserService.getLoginUser().getUsername());
        infoTypeForm.setUpdatetime(new Date());
        infoTypeForm.setUpdatetime(new Date());

        //Map<String, String> customFields = infoTypeForm.getCustomFields();
        //List<String> keys = new ArrayList<>(customFields.keySet());
        //List<String> values = new ArrayList<>(customFields.values());

        //customfields
        Map<String, String> customIndexFields = infoTypeForm.getCustomIndexFields();
        Map<String, String> customFields = infoTypeForm.getCustomFields();
        List<String> keys = new ArrayList<>();

        if (customFields == null) {
            customFields = new HashMap<>();
        }
        if (customIndexFields != null) {
            customFields.putAll(customIndexFields);
        }
        keys.addAll(customFields.keySet());

        for(String key:keys){
            String value = (String)customFields.get(key);
            if(StringUtils.isEmpty(value)){
                customFields.remove(key);
            }
        }
        keys = new ArrayList<>(customFields.keySet());
        recordViewMapper.updateByPrimaryKeySelective(infoTypeForm, tableName, keys, customFields);

     /*   Record record = new Record();
        record.setId(infoTypeForm.getRecordI d());
        record.setSubject(infoTypeForm.getSubject());
        record.setPeople(infoTypeForm.getPeople());
        record.setTableid(infoTypeForm.getTableId());
        record.setCheckstatus(RecordUtil.SUBMIT_CHECK);*/


        //recordViewMapper.updateByPrimaryKeySelective(record, tablePrefix + RecordUtil.RECORD);

        //put file to filebase
        String prePath = tablePrefix + "/" + infoTypeForm.getId() + "/";
        for (MultipartFile file : infoTypeForm.getResFile()) {
            if (file.getSize() != 0) {
                String relativePath = prePath + file.getOriginalFilename();
                fileService.writeFile(file.getInputStream(), ROOT_PATH + relativePath);
                //save document info into database
                Document document = new Document();
                document.setRecordid(infoTypeForm.getId());
                String documentid = IDGenerator.generator();
                document.setId(documentid);
                document.setPath(relativePath);
                document.setUploadtime(new Date());
                documentService.insert(document, documentName);
                luceneIndex.index(oldRecord.getSubject(), oldRecord.getId(), recordtype, type,ROOT_PATH + relativePath, oldRecord.getRecordno(),documentid);
            }
        }
        //delete document file
        if(infoTypeForm.getDeleteDocIds().size()>0){
        	for(String documentid:infoTypeForm.getDeleteDocIds()){
        		luceneIndex.deleteByDocumentId(documentid, type, recordtype);
                Document doc = documentService.selectByPrimaryKey(documentid,documentName);
                File file= new File(ROOT_PATH+doc.getPath());
                if(file.exists())
                	file.delete();
        	}
            documentService.deleteByIds(documentName,infoTypeForm.getDeleteDocIds());
        }

        if (!StringUtils.isEmpty(tableid)) {
        	try{
                danymicService.deleteOldInfo(tableid, infoTypeForm.getId());
        	}catch(Exception e){
        		
        	}
            if (infoTypeForm.getLists() != null && !infoTypeForm.getLists().isEmpty()) {
                if (infoTypeForm.getListSize() == 1) {
                    StringBuffer sb = new StringBuffer();
                    for (String dd : infoTypeForm.getLists()) {
                        sb.append(dd).append(",");
                    }
                    String all = sb.toString();
                    infoTypeForm.getLists().clear();
                    infoTypeForm.getLists().add(all.substring(0, all.length() - 1));
                }
                danymicService.insertInfo(infoTypeForm.getLists(), infoTypeForm.getColSize(), tableid, infoTypeForm.getId());
            }
        }

        logService.insert(shiroUserService.getLoginUser().getUsername()+"更新了档案--"+oldRecord.getRecordno()+"。");
    }

    @Override
    public int updateByPrimaryKeySelective(Record recordForm, String tableName) {
        return recordViewMapper.updateByPrimaryKeySelective(recordForm, tableName, null, null);
    }

    @Override
    public int updateAddress(RecordForm intoHouseForm, String tableName) {
        intoHouseForm.setAddress(commonservice.createAddress(intoHouseForm.getShNo(), intoHouseForm.getShCabNo(), intoHouseForm.getShFloorNo()));
        logService.insert(shiroUserService.getLoginUser().getUsername()+"更新了库房--"+intoHouseForm.getShCabNo()+"。");
        return updateByPrimaryKeySelective(intoHouseForm, tableName);
    }

    @Override
    public Map selectRecordByContent(ColSearchForm colSearchForm) {
        String tableid = colSearchForm.getTableid();
        List<PageView> allpage = new ArrayList<>();

        Map result = new HashMap<>();
        Map map = new HashMap<>();
        String prefix = tableid.substring(0, tableid.lastIndexOf("_"));
        map.put("tableName", colSearchForm.getTableid());
        map.put("cols", colSearchForm.getCols());
        map.put("checkstatus", 1);
        int count = recordViewMapper.selectRecordCountsByContent(map);
        
        map.put("start", (colSearchForm.getPage() - 1) * colSearchForm.getSize());
        map.put("end", colSearchForm.getPage() * colSearchForm.getSize());
        
        List<String> ids = recordViewMapper.selectRecordidsByContent(map);
        Page pageObject = new Page(null, count, colSearchForm.getPage(), colSearchForm.getSize());

        String suffix = RecordUtil.PIECE;

        Map mapvalue = danymicService.getColMapValue(colSearchForm.getTypeid(), suffix);

        List<String> cols = new ArrayList<>(mapvalue.keySet());

        RecordExample pieceExample = new RecordExample();
        RecordExample.Criteria criteria1 = pieceExample.createCriteria();
        if (ids.size() > 0)
            criteria1.andThisIdIn(ids);
        /*String order = "";
        for(String o:ruleService.getRule(colSearchForm.getTypeid(), RecordUtil.PIECE).replace(".", "-").split("-")){
        	order +=",thistable."+o;
        };
        order = order.substring(1);
        pieceExample.setOrderByClause(order);*/
        pieceExample.setOrderByClause("SUBSTRING_INDEX(thistable.recordNo, '-', 1) asc,	SUBSTRING(SUBSTRING_INDEX(thistable.recordNo, '-' ,2),INSTR(thistable.recordNo,'-')+1,3) + 1 ASC,"
        		+ "SUBSTRING(SUBSTRING_INDEX(thistable.recordNo,'-',-3),1,3)+1 asc ,SUBSTRING(SUBSTRING_INDEX(thistable.recordNo,'-',-2),1,3)+1 asc , SUBSTRING(SUBSTRING_INDEX(thistable.recordNo,'-',-1),1,4)+1 asc,"
        		+ " SUBSTRING(SUBSTRING_INDEX(thistable.recordNo,'-',-1),1,5)+1 asc, SUBSTRING(SUBSTRING_INDEX(thistable.recordNo,'-',-1),1,6)+1 asc,thistable.recordNo asc,thistable.recordNo");
        criteria1.andCheckstatusEqualTo("1");
        List<TableField> tableFields = recordTypeService.getCustomIndexFields(colSearchForm.getTypeid(), suffix);
        Iterator it = tableFields.iterator();
        while (it.hasNext()) {
            TableField tableField = (TableField) it.next();
            if (cols.contains(tableField.getFieldName())) {
                cols.remove(tableField.getFieldName());
            }
        }
        criteria1.andLIkeByCol(colSearchForm.getCols());
        danymicService.selectPageByCols(cols, tableFields, prefix + suffix, pieceExample, pageObject);
        result.put("piececolmap", mapvalue);
        result.put("pieceecols", cols);
        result.put("pieces", new PageView(pageObject));

        return result;
    }

    @Override
    public List<Map<String, Object>> selectVolumeByContent(VolumeSearchForm volumeSearchForm, List<TableField> tableField, Page pageObject) {

        String tableprefix = volumeSearchForm.getTableprefix();
        HashMap<String, Object> map = new HashMap<>();
        map.put("volumeFields", tableField);
        map.put("volumeTable", tableprefix + RecordUtil.VOLUME);
        map.put("recordTable", tableprefix + RecordUtil.RECORD);
        map.put("recordcols", volumeSearchForm.getRecord());
        map.put("volumecols", volumeSearchForm.getVolume());

        
        int count = recordViewMapper.selectVolumeCountByContent(map);
        pageObject.retrievePage(count);


        /*String order = "";
        for(String o:ruleService.getRule(volumeSearchForm.getTypeid(), RecordUtil.VOLUME).replace(".", "-").split("-")){
        	order +=",V."+o;
        };
        order = order.substring(1);
        map.put("order",order);*/
        
        map.put("start", (pageObject.getPageNum() - Page.ONE) * pageObject.getPageSize());
        map.put("end", pageObject.getPageSize());

        return recordViewMapper.selectVolumeByContent(map);
    }

    @Override
    public PageView selectRecordByVolumeId(String tableprefix, String volumeid, String volumeSubject, List<TableField> recordField) {
        //String tableprefix = volumeSearchForm.getTableprefix();
        //List<PageView> recordpage = new ArrayList<>();
        for (TableField tf : recordField) {
            if (tf.getFieldName().equals(RecordUtil.FONDSID)) {
                tf.setName("顺序号");
                tf.setFieldName(RecordUtil.SEQUENCNO);
            	recordField.remove(tf);
            	break;
            }
        }
        
        //for(Volume volume:volumes){
        Page pageObject = new Page(null, 0, 1, 30);

        HashMap<String, Object> map = new HashMap<>();
        map.put("tableName", tableprefix + RecordUtil.RECORD);
        //map.put("volumeid",volumeSearchForm.getId() );
        map.put("volumeid", volumeid);
        map.put("tableFields", recordField);
        PageView pageView = new PageView(recordService.selectRecordByExample(map, pageObject, recordField));
        pageView.setTITLE(volumeSubject == null ? "无题名" : volumeSubject);
        //recordpage.add(pageView);
        //}
        return pageView;
	}
	
	@Override
	public PageView selectRecordByVolumeId(VolumeSearchForm volumeSearchForm,String volumeid,String volumeSubject,List<TableField> recordField) {
		String tableprefix = volumeSearchForm.getTableprefix();
        //List<PageView> recordpage = new ArrayList<>();

        for (TableField tf : recordField) {
            if (tf.getFieldName().equals(RecordUtil.FONDSID)) {
                /*tf.setName("顺序号");
                tf.setFieldName(RecordUtil.SEQUENCNO);*/
            	recordField.remove(tf);
            	break;
            }
        }
        /*for(Volume volume:volumes){*/
        Page pageObject = new Page(null, 0, 1, 30);

        HashMap<String, Object> map = new HashMap<>();
        map.put("tableName",tableprefix+RecordUtil.RECORD );
        //map.put("volumeid",volumeSearchForm.getId() );
        map.put("volumeid",volumeid );
        //List<Column> cols = volumeSearchForm.getRecord();
        List<Column> cols = volumeSearchForm.getRecord();
        List<Column> indexcols = new ArrayList<Column>();
        for(int i=cols.size()-1;i>=0;i--){
        	if(cols.get(i).getColid()==null){
        		cols.remove(i);
        		continue;
        	}
        	String colid = cols.get(i).getColid();
        	if(colid.contains("index")||colid.equals(RecordUtil.YEAR)||colid.equals(RecordUtil.DEADLINE)||colid.equals(RecordUtil.DEPARTMENT)){
        		indexcols.add(cols.get(i));
        		cols.remove(i);
        	}
        }
        map.put("cols",cols);
        map.put("indexcols",indexcols);
        map.put("tableFields",recordField );	

        /*String order = "";
        for(String o:ruleService.getRule(volumeSearchForm.getTypeid(), RecordUtil.VOLUME).replace(".", "-").split("-")){
        	order +=",V."+o;
        };
        order = order.substring(1);
        map.put("order",order);*/
        
        PageView pageView = new PageView(recordService.selectRecordByExample(map, pageObject,recordField));
        pageView.setTITLE(volumeSubject==null?"无题名":volumeSubject);
        //recordpage.add(pageView);
        //}
        return pageView;
	}

    @Override
    public SearchPage selectVolumeAndRecord(String tableName, RecordExample example, SearchPage searchPage) {
        return danymicService.selectVolumeRecord(tableName, example, searchPage);
    }

    @Override
    public Page selectRecordByExample(HashMap<String, Object> map, Page page, List<TableField> recordField) {
        page.retrievePage(30);
        page.setItems(new Records(recordViewMapper.selectRecordByVolumeId(map), recordField, (String) map.get("volumeid")).getRecords());
        return page;
    }

    @Override
    public List<Record> selectByNo(String recordno, String tableName) {

        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();
        example.setTableName(tableName);

        criteria.andRecordnoEqualTo(recordno);

        return mapper.selectByExample(example);
    }

    @Override
    public Map<String,Object> getAllById(SelectImformation si) {
		return recordViewMapper.getAllById(si);
    	
    }
    @Override
    public boolean isExistByNo(String recordno) {
    	List<RecordType> recordtypes = recordTypeService.selectAll();
    	for(RecordType recordtype:recordtypes){
            String tableName =  recordtype.getRecordtable().replace(RecordUtil.RECORD, "")+ RecordUtil.PIECE;
            List<Record> records = selectByNo(recordno, tableName);
            if(records != null && !records.isEmpty())
            	return true;

            tableName =  recordtype.getRecordtable();
            records = selectByNo(recordno, tableName);
            if(records != null && !records.isEmpty())
            	return true;
    	}
        return false;
    }

    @Override
    public String getRecordNo(List<TableField> tfs,  SelectImformation si, String fondsno, String recordtypeid, String type, String tablename, String recordid) {
        List<String> ids = new ArrayList<String>();
        Map zeronums = new HashMap();
        for (TableField tf : tfs) {
            if (tf.getIdorvalue().equals("1"))
                ids.add(tf.getFieldName());
            if (tf.getZeronum() != null && !tf.getZeronum().equals("0") && !tf.getZeronum().equals("")) {
                zeronums.put(tf.getFieldName(), tf.getZeronum());
            }
        }
        
        Map<String, Object> record = recordService.getImformation(si);
        Map<String, Object> record2 = recordService.getRecordNoMapData(si);
        Map<String, Object> record3 = recordService.getAllById(si);

        List<Condition> countpieces = new ArrayList<Condition>();
        /*List<String> rs = new ArrayList<String>(record3.keySet());
        for(String r:rs){
            Condition condition = new Condition(r,(String) record3.get(r));
            countpieces.add(condition);
        }*/
        
        List<String> keys = new ArrayList<String>(record.keySet());
        String rule = ruleService.selectByRecordType(recordtypeid, type).getRuleorder();
        List<Condition> rulepieces = new ArrayList<Condition>();
        for (int i = keys.size() - 1; i >= 0; i--) {
            String key = keys.get(i);
            if (key.equals(RecordUtil.ID) || key.equals(RecordUtil.SEQUENCNO)) continue;
            if (record.get(key) instanceof java.sql.Timestamp) {
            } else {
                String new_rule = rule;
                String keyValue = "";
                if (ids.contains(key))
                    keyValue = (String) record2.get(key);
                else
                    keyValue = (String) record.get(key);
                if (zeronums.containsKey(key)) {
                    int num = Integer.parseInt(zeronums.get(key) + "");
                    if (keyValue.length() < num)
                        for (int j = 0; j < num - keyValue.length(); j++)
                            keyValue = "0" + keyValue;
                }
                rule = rule.replace(key, keyValue);
                if (!new_rule.equals(rule)) {
                	String fieldname = (String) record2.get(key);
                	if(key.contains("index")){
                		fieldname = recordViewMapper.getIndexByValue(key, fieldname)+"";
                	}
                    Condition condition = new Condition(key, fieldname);
                    rulepieces.add(condition);
                    condition = new Condition(key, (String) record3.get(key));
                    countpieces.add(condition);
                }
            }
        }
        rule = rule.replace(RecordUtil.FONDSID, fondsno);
        int count = recordViewMapper.getSequencNo(tablename, countpieces);
        String countStr = (++count) + "";
        int countNum = 0;
        if (zeronums.containsKey(RecordUtil.SEQUENCNO))
            countNum = Integer.parseInt("" + zeronums.get(RecordUtil.SEQUENCNO));
        if (countStr.length() < countNum) {
            int index = countNum - countStr.length();
            while (index-- > 0)
                countStr = "0" + countStr;
        }
        return rule.replace(RecordUtil.SEQUENCNO, countStr);
    }

    @Override
    public String selectSubjectByRecordOrVolumeId(String tableName, String id) {
        //String tableprefix = volumeSearchForm.getTableprefix();
        HashMap<String, Object> map = new HashMap<>();
        map.put("tableName", tableName);
        //map.put("volumeid",volumeSearchForm.getId() );
        map.put("id", id);
        return recordViewMapper.selectVolumeSubjectByVolumeId(map);
    }

    @Override
    public String selectVolumeNoByRecordOrVolumeId(String tableName, String id) {
        //String tableprefix = volumeSearchForm.getTableprefix();
        HashMap<String, Object> map = new HashMap<>();
        map.put("tableName", tableName);
        //map.put("volumeid",volumeSearchForm.getId() );
        map.put("id", id);
        return recordViewMapper.selectVolumeNoByVolumeId(map);
    }

    @Override
    public Page searchRecord(String key, String type,
                                                  String recordTypeId,int page) {

        RecordType recordType = recordTypeService.selectByPrimaryKey(recordTypeId);
        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();
        /*if (type.equals(RecordUtil.VOLUME)) {
            criteria.andVolumeNoOrSubjectEqualsTo(key);
        } else {*/
            criteria.andRecordNoOrSubjectEqualsTo(key);
        /*}*/
        example.setTableName(recordType.getRecordtable().replace(RecordUtil.RECORD, type));
        int count = recordViewMapper.selectCountByExample(example);
        example.setStart((page-1)*5);
        example.setLimit(5);
         
        return new Page(recordViewMapper.selectAllByExample(example),count,page,5);
    }

    @Override
    public List<Record> selectIdsByNos (List<String> recordNos, String prePath) {
        RecordExample example = new RecordExample();
        example.setTableName(prePath);

        RecordExample.Criteria criteria = example.createCriteria();
        criteria.andRecordnoIn(recordNos);

        return mapper.selectByExample(example);
    }

    @Override
    public Map<String, String> getValueMap (String recordId, List<String> fields, String tablePrefix) {
        return mapper.selectFields(recordId,fields,tablePrefix);
    }

    @Override
    public void updatePageNum (String recordId, int page, String tableName) {
        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();
        example.setTableName(tableName);
        criteria.andIdEqualTo(recordId);

        Record record = new Record();
        record.setPagenum(page);

        mapper.updateByExampleSelective(record,example);
    }

    @Override
    public List<String> selectIdsByExample (RecordExample example) {
        return mapper.selectIdsByExample(example);
    }

	@Override
	public int delete(String recordid, String tableName) {
		return mapper.delete(recordid,tableName);
	}


	/*@Override
    public Map selectRecordVolumeByContent(VolumeSearchForm volumeSearchForm) {
        Page pageObject = new Page(null, 0, volumeSearchForm.getPage(), volumeSearchForm.getSize());

		String prefix = volumeSearchForm.getTableprefix();

        HashMap<String, Object> map = new HashMap<>();
        map.put("volumeTable", prefix+RecordUtil.VOLUME);
        map.put("recordTable", prefix+RecordUtil.RECORD);
        map.put("recordcols", volumeSearchForm.getRecord());
        map.put("volumecols", volumeSearchForm.getVolume());
       // List<String> ids = recordViewMapper.selectVolumeByContent(map);

        RecordExample example = null;
        Map  result = new HashMap<>();
        example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();

        String suffix = "";
        //String prefix = tableid.substring(0, tableid.lastIndexOf("_"));
        
        suffix = RecordUtil.RECORD;
        String tableName = prefix + suffix;
      //  criteria.andThisIdIn(ids);
        criteria.andVolumeidIsNotNull();

        Map mapvalue = danymicService.getColMapValue(volumeSearchForm.getTypeid(),RecordUtil.RECORD);

        List<String> cols =  new ArrayList<>(mapvalue.keySet());

        Map volumeInnerMaps = selectVolumeAndRecord(tableName,example);
        result.put("innercolmap",mapvalue);
        result.put("innercols",cols);
        result.put("innermaps",volumeInnerMaps);
        //get volumes
        Set volumeids = volumeInnerMaps.keySet();
        List<String> volumeList = new ArrayList<>(volumeids);
        result.put("volumeids",volumeids);

        mapvalue = danymicService.getColMapValue(volumeSearchForm.getTypeid(),RecordUtil.VOLUME);

        cols =  new ArrayList<>(mapvalue.keySet());

        Map idvalue = new HashMap<>();
        for(String volumeid:volumeList){
            RecordExample volumeExample =  new RecordExample();
            RecordExample.Criteria criteria1 = volumeExample.createCriteria();
            criteria1.andTargetIdEqualTo(volumeid);
            JSONArray jsonArray = new JSONArray();
            List<Object> records = danymicService.selectByCols(cols,prefix+RecordUtil.VOLUME,volumeExample);
            jsonArray.addAll(records);

            idvalue.put(volumeid,records);
        }

        //result.put("volumenames",mapvalue.values());
        result.put("volumecolmap",mapvalue);
        result.put("volumecols",cols);
        result.put("idvalue",idvalue);
		return null;
	}*/

}
