package cn.com.jtang.web.controller.json;

import cn.com.jtang.po.*;
import cn.com.jtang.po.Volumes.Volume;
import cn.com.jtang.service.*;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.ColSearchForm;
import cn.com.jtang.web.controller.form.VolumeSearchForm;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("jsonRecordTypeController")
@RequestMapping("/json/recordtype")
public class RecordTypeController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private IndexTableService indexTableService;
    @Resource
    private GeneralDataService generalDataService;
    @Resource
    private FondsService fondsService;
    @Resource
    private RuleService ruleService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private DanymicService danymicService;
    @Resource
    private RecordService recordService;
    @Resource
    private YearService yearService;
    @Resource
    private DeadlineService deadlineService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    private LogService logService;

    @RequiresPermissions(value = {"deleterecordtype"})
    @ResponseBody
    @RequestMapping(
            value = "/delete",
            method = RequestMethod.GET
    )
    public Map<String, Object> delete(@RequestParam(
            value = "typeid",
            required = true
    ) String typeid, ModelMap model) {

        Map<String, Object> result = new HashMap<>();

        result.put("status", recordTypeService.deleteByPrimaryKey(typeid));

        return result;
    }

    @RequestMapping(value = "/checkname", method = RequestMethod.POST)
    @ResponseBody
    public boolean checkname(
            @RequestParam(value = "fondsid", required = true) String fondsid,
            @RequestParam(value = "typename", required = true) String typename) {

        boolean status = true;
        if (typename != null && !"".equals(typename)) {
            if (recordTypeService.isExist(typename,fondsid)) {
                status = false;
            }
        }
        return status;

    }


    @RequestMapping(value = "/edit/checkname", method = RequestMethod.POST)
    @ResponseBody
    public boolean editcheckname(
            @RequestParam(value = "typename", required = true) String typename,
            @RequestParam(value = "fondsid", required = true) String fondsid,
            @RequestParam(value = "originalname", required = true) String originalname) {

        boolean status = true;
        if (!StringUtils.isEmpty(originalname) && !originalname.equals(typename)) {
            if (recordTypeService.isExist(typename,fondsid)) {
                status = false;
            }
        }
        return status;

    }

    @RequestMapping(value = "/getCustomField", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getCustomField(
            @RequestParam(value = "recordId", required = false) String recordId,
            @RequestParam(value = "recordTypeId", required = true) String recordTypeId,
            @RequestParam(value = "type", required = true) String type) {
    	
        Map<String, Object> result = new HashMap<>();
        String tablePrefix = danymicService.getTablePrefix(recordTypeId);
        List<TableField> customValueFields =  recordTypeService.getCustomValueFields(recordTypeId,type);
        result.put("customValueFields",customValueFields);
        result.put("title",recordTypeService.getTitle(recordTypeId, type));
        List<TableField> tableFields = recordTypeService.getCustomIndexFields(recordTypeId,type);
        
        if(customValueFields!=null&&!customValueFields.isEmpty()&&!StringUtils.isEmpty(recordId)){
            List<String> fields = new ArrayList<>();
            for(TableField tableField : customValueFields){
                    fields.add(tableField.getFieldName());
            }
            for(TableField tableField : tableFields){
                fields.add(tableField.getFieldName());
            }
            fields.add("description");
            
            result.put("valueMap",recordService.getValueMap(recordId,fields,tablePrefix+type));
            //map.put("",recordService);
            //result.put("valueMap",map);
        }else if(customValueFields==null||customValueFields.isEmpty()){
        	result.put("customValueFields",new ArrayList<TableField>());
            result.put("valueMap",new HashMap<String, String>());
        }
        if(tableFields!=null){
            result.put("customIndexFields", tableFields);
            Map<String,List<AddIndex>> map = new HashMap<>();
            for(TableField tableField : tableFields){
                map.put(tableField.getFieldName(),indexTableService.selectAllIndexValue(tableField.getFieldName()));
            }
            result.put("indexMap",map);
        }else{
        	result.put("customIndexFields",new ArrayList<TableField>());
            result.put("indexMap",new HashMap<String,List<AddIndex>>());
        }

        return result;

    }
    @RequestMapping(value = "/getAllTableField", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getAllTableField(
            @RequestParam(value = "recordTypeId", required = true) String recordTypeId,
            @RequestParam(value = "type", required = true) String type) {

        Map<String, Object> result = new HashMap<>();

        RecordType recordType = recordTypeService.selectByPrimaryKey(recordTypeId);
        if(type.equals(RecordUtil.PIECE)){
        	List<TableField> list =  recordTypeService.getTableFieldAllImf(recordTypeId,type);
            for(TableField tf:list){
            	if(tf.getValueorindex()!=null&&tf.getValueorindex().equals(1+""))
            		tf.setDatas(generalDataService.getGeneralData(tf.getFieldName()));
            }
            result.put("tableFields",list);
            result.put("tableid", (fondsService.selectByPrimaryKey(recordType.getFondsid()).getFondsno()+"_"+recordType.getTypeno()+type).toLowerCase());
        }else{
        	List<TableField> volumeFields =  recordTypeService.getTableFieldAllImf(recordTypeId,type);
            for(TableField tf:volumeFields){
            	if(tf.getValueorindex()!=null&&tf.getValueorindex().equals(1+""))
            		tf.setDatas(generalDataService.getGeneralData(tf.getFieldName()));
            }
            result.put("volumeFields", recordTypeService.getTableFieldAllImf(recordTypeId,RecordUtil.VOLUME));
            
        	List<TableField> recordFields =  recordTypeService.getTableFieldAllImf(recordTypeId,type);
            for(TableField tf:recordFields){
            	if(tf.getValueorindex()!=null&&tf.getValueorindex().equals(1+""))
            		tf.setDatas(generalDataService.getGeneralData(tf.getFieldName()));
            }
            result.put("recordFields", recordTypeService.getTableFieldAllImf(recordTypeId,RecordUtil.RECORD));
            result.put("tableprefix", (fondsService.selectByPrimaryKey(recordType.getFondsid()).getFondsno()+"_"+recordType.getTypeno()).toLowerCase());
        }
        

        result.put("years", yearService.selectAll());
        result.put("departments", departmentService.selectAll());
        result.put("deadlines", deadlineService.selectAll());
        
        return result;


    }
    @RequestMapping(value = "/getEditTableField", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getEditTableField(
            @RequestParam(value = "recordTypeId", required = true) String recordTypeId,
            @RequestParam(value = "type", required = true) String type) {

        Map<String, Object> result = new HashMap<>();

    	List<TableField> list =  recordTypeService.getTableFieldAllImf(recordTypeId,type);
        for(TableField tf:list){
        	String fieldname = tf.getFieldName();
        	if(tf.getValueorindex()!=null&&tf.getValueorindex().equals(1+""))
        		tf.setDatas(generalDataService.getGeneralData(tf.getFieldName()));
        	else if(fieldname.equals(RecordUtil.YEAR)||fieldname.equals(RecordUtil.DEADLINE)||fieldname.equals(RecordUtil.DEPARTMENT))
        		list.remove(fieldname);
        }
        result.put("tableFields",list);
        return result;


    }


    @RequiresPermissions(value = {"createrecordtype"})
    @ResponseBody
    @RequestMapping(
            value = "/create",
            method = RequestMethod.POST
    )
    public Map<String, Object> userCreate(@RequestParam(
            value = "typename",
            required = true
    ) String typename, @RequestParam(
            value = "typedes",
            required = true
    ) String typedes, @RequestParam(
            value = "typeno",
            required = true
    ) String typeno, @RequestParam(
            value = "recordFields",
            required = false
    ) String recordFields,@RequestParam(
            value = "pieceFields",
            required = false
    ) String pieceFields, @RequestParam(
            value = "recordRule",
            required = false
    ) String recordRule,@RequestParam(
            value = "pieceRule",
            required = false
    ) String pieceRule, @RequestParam(
            value = "recordCRule",
            required = false
    ) String recordCRule,@RequestParam(
            value = "pieceCRule",
            required = false
    ) String pieceCRule, @RequestParam(
            value = "volumeFields",
            required = false
    ) String volumeFields, @RequestParam(
            value = "fondsid",
            required = true
    ) String fondsid, ModelMap model) {

        Map<String, Object> result = new HashMap<>();
        try {

            recordTypeService.create(fondsid,typename,typedes,typeno,recordRule,pieceRule,recordCRule,pieceCRule,recordFields,pieceFields,volumeFields);
            result.put("status", 1);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("status", 0);
        }

        return result;


    }


    @RequiresPermissions(value = {"editrecordtype"})
    @ResponseBody
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public Map<String, Object> recordTypeEdit(@RequestParam(
            value = "id",
            required = true
    ) String id, @RequestParam(
            value = "typename",
            required = true
    ) String typename, @RequestParam(
            value = "typedes",
            required = true
    ) String typedes, ModelMap model) {

        Map<String, Object> result = new HashMap<>();

        result.put("status", recordTypeService.edit(id, typename, typedes));

        return result;

    }
    


    @RequestMapping(value = "/checkFirstno", method = RequestMethod.POST)
    @ResponseBody
    public boolean checkFirstno(
            @RequestParam(value = "firstno", required = true) String firstno,
            @RequestParam(value = "fondsid", required = true) String fondsid) {

        boolean status = true;
        if (firstno != null && !"".equals(firstno)) {
            if (recordTypeService.isExistFirstno(firstno,fondsid)) {
                status = false;
            }
        }
        return status;

    }

   //@RequiresPermissions(value = {"templatemanage"})
    @ResponseBody
    @RequestMapping(
            value = "/getAllBasicField",
            method = RequestMethod.GET
    )
    public Map<String, Object> getAllcolumn() {

        Map<String, Object> result = new HashMap<>();
        result.put("fondsTrees", recordTypeService.getAllBasicField());

        return result;
    }
    @ResponseBody
    @RequestMapping(
            value = "/selectAccessTree",
            method = RequestMethod.GET
    )
    public Map<String, Object> selectAccessTree() {

        Map<String, Object> result = new HashMap<>();
        result.put("fondsTrees", recordTypeService.selectAccessTree());

        return result;
    }

    @ResponseBody
    @RequestMapping(
            value = "/getByFondsId",
            method = RequestMethod.GET
    )
    public Map<String, Object> getByFondsId(@RequestParam("fondsId") String fondsId, ModelMap model) {

        Map<String,Object> result = new HashMap<>();

        result.put("recordtypes",recordTypeService.selectByFondsId(fondsId));

        return result;
    }
    @ResponseBody
    @RequestMapping(
            value = "/searchContent",
            method = RequestMethod.POST
    )
    public Map<String, Object> searchContent(@ModelAttribute("colSearchForm") ColSearchForm colSearchForm, ModelMap model) {

        return recordService.selectRecordByContent(colSearchForm);
    }

    @ResponseBody
    @RequestMapping(
            value = "/searchVolumeContent",
            method = RequestMethod.POST
    )
    public Map<String, Object> searchVolumeContent(@ModelAttribute("volumeSearchForm") VolumeSearchForm volumeSearchForm, ModelMap model) {

        Map<String, Object> result = new HashMap<>();
        List<TableField> tableFields = recordTypeService.getTableFieldAllImf(volumeSearchForm.getTypeid(),RecordUtil.VOLUME);
        TableField tableField = new TableField();
        tableField.setFieldName("id");
        tableFields.add(tableField);
        Page pageObject = new Page(null, 0, volumeSearchForm.getPage(), volumeSearchForm.getSize());
        Volumes volumes = new Volumes(recordService.selectVolumeByContent(volumeSearchForm,tableFields,pageObject),volumeSearchForm.getTypeid(),tableFields);
        tableFields.remove(tableField);
        result.put("tableFields",  tableFields);
        pageObject.setItems(volumes.getVolumes());
        result.put("volumes",  new PageView(pageObject));
        /*String content = "在按卷查询－此次查询显示"+volumes.getVolumes().size()+"条案卷:";
        for(Volume v:volumes.getVolumes())
        	content+=v.getVolumeSubject()+";";
        logService.insertCheck(content);*/


        List<TableField> recordField = recordTypeService.getTableFieldAllImf(volumeSearchForm.getTypeid(),RecordUtil.RECORD);
        result.put("recordField",  recordField);
        TableField recordfield = new TableField();
        recordfield.setFieldName("id");
        recordField.add(recordfield);
        if(volumes.getVolumes().size()>0){
        	String volumeid = volumes.getVolumes().get(0).getVolumeId();
            PageView list = recordService.selectRecordByVolumeId(volumeSearchForm,volumeid,volumes.getVolumes().get(0).getVolumeSubject(),recordField);
            result.put("records", list);
        }/*else{
        	result.put("records", null);
        }*/

        return result;
    }
    @ResponseBody
    @RequestMapping(
            value = "/searchRecordContent",
            method = RequestMethod.POST
    )
    public Map<String, Object> searchRecordContent(@ModelAttribute("volumeSearchForm") VolumeSearchForm volumeSearchForm, ModelMap model) {

        Map<String, Object> result = new HashMap<>();
        List<TableField> recordField = recordTypeService.getTableFieldAllImf(volumeSearchForm.getTypeid(),RecordUtil.RECORD);
        result.put("recordField",  recordField);
        TableField recordfield = new TableField();
        recordfield.setFieldName("id");
        recordField.add(recordfield);
    	String volumeid = volumeSearchForm.getId();
    	String tablename = volumeSearchForm.getTableprefix()+RecordUtil.VOLUME;
    	String subject = recordService.selectSubjectByRecordOrVolumeId(tablename,volumeid);
    	String volimeNo = recordService.selectVolumeNoByRecordOrVolumeId(tablename,volumeid);
        PageView list = recordService.selectRecordByVolumeId(volumeSearchForm,volumeid,subject,recordField);
        result.put("records", list);

        logService.insertCheck("在按卷查询－此次查询显示（"+volimeNo+"）案卷（"+subject+"）的"+list.getPage().getItems().size()+"条卷内");
        return result;
    }
    

    @ResponseBody
    @RequestMapping(
            value = "/searchResultRecord",
            method = RequestMethod.POST
    )
    public Map<String, Object> searchResultRecord(@ModelAttribute("volumeSearchForm") VolumeSearchForm volumeSearchForm, ModelMap model) {

        Map<String, Object> result = new HashMap<>();
        List<TableField> recordField = recordTypeService.getTableFieldAllImf(volumeSearchForm.getTypeid(),RecordUtil.RECORD);
        result.put("recordField",  recordField);
        TableField recordfield = new TableField();
        recordfield.setFieldName("id");
        recordField.add(recordfield);
    	String volumeid = volumeSearchForm.getId();
    	String tablename = volumeSearchForm.getTableprefix()+RecordUtil.VOLUME;
    	String subject = recordService.selectSubjectByRecordOrVolumeId(tablename,volumeid);
    	String volimeNo = recordService.selectVolumeNoByRecordOrVolumeId(tablename,volumeid);
        PageView list = recordService.selectRecordByVolumeId(volumeSearchForm,volumeid,subject,recordField);
        result.put("records", list);

        logService.insertCheck("在按卷查询－此次查询显示（"+volimeNo+"）案卷（"+subject+"）的"+list.getPage().getItems().size()+"条卷内");
        return result;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
