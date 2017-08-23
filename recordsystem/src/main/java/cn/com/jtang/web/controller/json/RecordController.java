package cn.com.jtang.web.controller.json;

import cn.com.jtang.lucene.LuceneIndex;
import cn.com.jtang.lucene.LuceneSearch;
import cn.com.jtang.po.*;
import cn.com.jtang.po.custom.BatchUploadSequence;
import cn.com.jtang.po.custom.RecordTree;
import cn.com.jtang.po.custom.RecordTypeTree;
import cn.com.jtang.service.*;
import cn.com.jtang.service.impl.ExportServiceImpl.CountAndNums;
import cn.com.jtang.util.*;
import cn.com.jtang.web.controller.form.CreateVolumeForm;
import cn.com.jtang.web.controller.form.RecordForm;
import cn.com.jtang.web.controller.form.RecordSearchForm;
import cn.com.jtang.web.controller.form.RecordVolumeForm;
import cn.com.jtang.web.controller.form.common.SearchForm;

import com.alibaba.fastjson.JSONObject;
import com.itextpdf.text.pdf.PdfReader;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("jsonRecordController")
@RequestMapping("/json/record")
@SessionAttributes({"recordSearchForm", "buildRecordSearchForm"})
public class RecordController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Value("${fileserverpath}")
    private String ROOT_PATH;
    @Resource
    private RuleService ruleService;
    @Resource
    private DocumentService ducomentService;
    @Resource
    private LuceneSearch luceneSearch;
    @Resource
    private LuceneIndex luceneIndex;
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private DanymicService danymicService;
    @Resource
    private DocumentService documentService;
    @Resource
    private FondsService fondsService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private RecordCategoryService recordCategoryService;
    @Resource
    private RecordService recordService;
    @Resource
    private RecordVolumeService recordVolumeService;
    @Resource
    private YearService yearService;
    @Resource
    private DeadlineService deadlineService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    private PendingService pendingService;
    @Resource
    private OutputOrderService outputOrderService;
    @Resource
    private FileService fileService;
    @Resource
    private ArchivesService archivesService;
    @Resource
    private ExportService exportService;
    @Resource
    private InfoService infoService;
    @Resource
    private LogService logService;

    @RequiresPermissions(value = {"buildvolume"})
    @RequestMapping(
            value = "/getRule",
            method = RequestMethod.GET
    )
    @ResponseBody
    public Map<String,Object> getRule(@RequestParam(
            value = "recordtypeid",
            required = true
    ) String recordtypeid, ModelMap model) {

        Map<String,Object> result = new HashMap<>();

        Rule rule = ruleService.selectByRecordType(recordtypeid,RecordUtil.VOLUME);
        result.put("rule",rule);

        return result;
    }

    @RequiresPermissions(value = {"buildvolume"})
    @RequestMapping(
            value = "/checkno",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map<String,Object> checkno(@RequestParam(
            value = "volumeno",
            required = true
    ) String volumeno, @RequestParam(
            value = "fondsid",
            required = true
    ) String fondsid, @RequestParam(
            value = "recordtypeid",
            required = true
    ) String recordtypeid, RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String,Object> result = recordVolumeService.checkVolumeNo(volumeno,recordtypeid);
        /*if (recordVolumeService.isExistByNo(volumeno)) {
            status = false;
            result.put("message","该档号已存在！请换一个！");
        } else if(recordVolumeService.isStopNo(volumeno,recordtypeid)){
            status = false;
            result.put("message","该档号属于断号，请将最后一位换为较大的数字！");
        }*/
        return result;
    }
    @RequestMapping(
            value = "/getVolumeSequence",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map<String,Object> getVolumeSequence(@ModelAttribute("volumeCreateForm") CreateVolumeForm volumeCreateForm, RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String,Object> result = new HashMap<>();

        int sequence = recordVolumeService.getSequence(volumeCreateForm);
        result.put("sequence",sequence);
        return result;
    }

    @RequiresPermissions(value = {"buildvolume"})
    @RequestMapping(
            value = "/uncoverVolume",
            method = RequestMethod.POST
    )
    @ResponseBody
    public boolean uncoverVolume(@RequestParam(
            value = "volumeId",
            required = true
    ) String volumeId, @RequestParam(
            value = "fondsId",
            required = true
    ) String fondsId, @RequestParam(
            value = "recordTypeId",
            required = true
    ) String recordTypeId, RedirectAttributes redirectAttributes, ModelMap model) {
        boolean status = true;
        recordVolumeService.uncoverVolume(volumeId,fondsId,recordTypeId);
        return status;
    }

    @RequestMapping(
            value = "/checkrecordno",
            method = RequestMethod.POST
    )
    @ResponseBody
    public boolean checkrecordno(@RequestParam(
            value = "recordno",
            required = true
    ) String recordno, @RequestParam(
            value = "fondsid",
            required = true
    ) String fondsid, @RequestParam(
            value = "recordtypeid",
            required = true
    ) String recordtypeid, RedirectAttributes redirectAttributes, ModelMap model) {

        boolean status = true;

        if (recordService.isExistByNo(recordno)) {
            status = false;
        }

        return status;
    }

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/getRecordPath",
            method = RequestMethod.GET
    )
    public Map<String, Object> getRecordPath(@RequestParam(
            value = "fondsid",
            required = false
    ) String fondsid, ModelMap model, HttpSession session) {

        Map<String, Object> result = new HashMap<>();

        result.put("fonds", fondsService.selectHasRecordType());
        if (!StringUtils.isEmpty(fondsid)) {
            result.put("recordtypes", recordTypeService.selectByFondsId(fondsid));
        } else {
            result.put("recordtypes", recordTypeService.selectByFondsId(fondsService.selectAll().get(0).getId()));
        }
        return result;
    }

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/buildvolume",
            method = RequestMethod.POST
    )
    public Map<String, Object> buildvolume(@RequestParam(
            value = "fondsid",
            required = true
    ) String fondsid, @RequestParam(
            value = "recordtype",
            required = true
    ) String recordtype, @RequestParam(
            value = "volumeid",
            required = true
    ) String volumeid, @RequestParam(
            value = "recordids",
            required = true
    ) String recordids, ModelMap model, HttpSession session) {

        Map<String, Object> result = new HashMap<>();
        result.put("status", pendingService.create(fondsid, recordtype, volumeid, recordids));
        return result;
    }

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/getMaintainValues",
            method = RequestMethod.POST
    )
    public Map<String, Object> getMaintainValues(HttpSession session) {

        Map<String, Object> result = new HashMap<>();
        result.put("years", yearService.selectAll());
        result.put("deadlines", deadlineService.selectAll());
        result.put("departments", departmentService.selectAll());
        return result;
    }

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/getVolumeCreateInitial",
            method = RequestMethod.POST
    )
    public Map<String, Object> getVolumeCreateInitial(@ModelAttribute("volumeCreateForm") CreateVolumeForm volumeCreateForm) {

        Map<String, Object> result = new HashMap<>();

        String tablePrefix = danymicService.getTablePrefix(volumeCreateForm.getFonds(), volumeCreateForm.getRecordtype());
        result.put("ruleOrder", ruleService.getVolumeRuleorder(volumeCreateForm, tablePrefix));
        //result.put("sequence", recordVolumeService.getSequence(volumeCreateForm));
        int sequence = recordVolumeService.getSequence(volumeCreateForm);
        result.put("sequence",sequence);

        return result;
    }

    @RequiresPermissions(value = {"buildvolume"})
    @ResponseBody
    @RequestMapping(
            value = "/getCanBuildRecord",
            method = RequestMethod.GET
    )
    public Map<String, Object> getCanBuildRecord(@ModelAttribute("buildRecordSearchForm") RecordSearchForm buildRecordSearchForm, ModelMap model, HttpSession session) {

        Map<String, Object> result = new HashMap<>();

        //get categorys
        result.put("years", yearService.selectAll());
        result.put("deadlines", deadlineService.selectAll());
        result.put("departments", departmentService.selectAll());

        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();

        Fonds fonds = fondsService.selectByPrimaryKey(buildRecordSearchForm.getFondsId());
        RecordType recordType = recordTypeService.selectByPrimaryKey(buildRecordSearchForm.getRtId());
        if(recordType==null){
            Page pageObject = new Page(null, 0, 0, 0);
            result.put("records", new PageView(pageObject));
            return result;
        }
        example.setTableName((fonds.getFondsno() + "_" + recordType.getTypeno() + RecordUtil.RECORD).toLowerCase());
        //criteria.andRecordtypeEqualTo(buildRecordSearchForm.getRtId());
        String all = "0";
        if (!StringUtils.isEmpty(buildRecordSearchForm.getDeadline()) && !all.equals(buildRecordSearchForm.getDeadline())) {
            criteria.andDeadlineEqualTo(Integer.valueOf(buildRecordSearchForm.getDeadline()));
        }
        if (!StringUtils.isEmpty(buildRecordSearchForm.getDepartment()) && !all.equals(buildRecordSearchForm.getDepartment())) {
            criteria.andDepartmentEqualTo(Integer.valueOf(buildRecordSearchForm.getDepartment()));
        }
        if (!StringUtils.isEmpty(buildRecordSearchForm.getYear()) && !all.equals(buildRecordSearchForm.getYear())) {
            criteria.andYearEqualTo(Integer.valueOf(buildRecordSearchForm.getYear()));
        }
        criteria.andCheckstatusEqualTo(RecordUtil.CHECK_PASS);

        if (!StringUtils.isEmpty(buildRecordSearchForm.getOrderByClause())) {
            example.setOrderByClause(buildRecordSearchForm.getOrderByClause());
        }
        /*if (RecordUtil.YEAR.equals(buildRecordSearchForm.getRecordCatogory())) {
            criteria.andYearEqualTo(buildRecordSearchForm.getRccId());
        } else if (RecordUtil.DEADLINE.equals(buildRecordSearchForm.getRecordCatogory())) {
            criteria.andDeadlineEqualTo(buildRecordSearchForm.getRccId());
        } else if (RecordUtil.DEPARTMENT.equals(buildRecordSearchForm.getRecordCatogory())) {
            criteria.andDepartmentEqualTo(buildRecordSearchForm.getRccId());
        }*/


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
        result.put("records", new PageView(recordService.selectByExample(example, pageObject)));

        return result;
    }

    @RequiresPermissions(value = {"viewtree"})
    @ResponseBody
    @RequestMapping(
            value = "/manage",
            method = RequestMethod.POST
    )
    public Map<String, Object> deviceManage(@ModelAttribute("recordSearchForm") RecordSearchForm recordSearchForm, ModelMap model, HttpSession session) {

        Map<String, Object> result = new HashMap<>();

        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();

        Fonds fonds = fondsService.selectByPrimaryKey(recordSearchForm.getFondsId());
        RecordType recordType = recordTypeService.selectByPrimaryKey(recordSearchForm.getRtId());
        example.setTableName((fonds.getFondsno() + "_" + recordType.getTypeno() + RecordUtil.RECORD).toLowerCase());
        example.setOrderByClause("createtime asc");

        criteria.andCheckstatusEqualTo(recordSearchForm.getStatus());

        List<Year> years = yearService.selectAll();
        if (!StringUtils.isEmpty(recordSearchForm.getYear())) {
            criteria.andYearEqualTo(Integer.valueOf(recordSearchForm.getYear()));
        }
        List<Department> departments = departmentService.selectAll();
        if (!StringUtils.isEmpty(recordSearchForm.getDepartment())) {
            criteria.andDepartmentEqualTo(Integer.valueOf(recordSearchForm.getDepartment()));
        }
        List<Deadline> deadlines = deadlineService.selectAll();
        if (!StringUtils.isEmpty(recordSearchForm.getDeadline())) {
            criteria.andDeadlineEqualTo(Integer.valueOf(recordSearchForm.getDeadline()));
        }

        if (!StringUtils.isEmpty(recordSearchForm.getKey())) {
            criteria.andSubjectLike("%" + recordSearchForm.getKey() + "%");
        }

        if (recordSearchForm.getStarttime() != null) {
            criteria.andCreatetimeGreaterThan(recordSearchForm.getStarttime());
        }

        if (recordSearchForm.getEndtime() != null) {
            criteria.andCreatetimeLessThan(recordSearchForm.getEndtime());
        }

        criteria.andVolumeidIsNull();

        int page = (recordSearchForm.getPage() == null)
                ? 0
                : recordSearchForm.getPage();
        int size = (recordSearchForm.getSize() == null)
                ? 0
                : recordSearchForm.getSize();
        Page pageObject = new Page(null, 0, page, size);
        PageView records = new PageView(recordService.selectByExample(example, pageObject));

        result.put("years", years);
        result.put("deadlines", deadlines);
        result.put("departments", departments);

        result.put("records", records);
        result.put("pages", records.showPages());

        return result;
    }


    
    @ResponseBody
    @RequestMapping(
            value = "/getRecord",
            method = RequestMethod.POST
    )
    public Map<String, Object> getRecord(@RequestParam(
            value = "volumeId",
            required = true
    ) String volumeId, @RequestParam(
            value = "fondsId",
            required = true
    ) String fondsId, @RequestParam(
            value = "recordTypeId",
            required = true
    ) String recordTypeId, final RedirectAttributes redirectAttributes, ModelMap model) {

        Map<String, Object> result = new HashMap<>();
        result.put("records", recordService.getByVolumeId(volumeId, fondsId, recordTypeId));
        List<TableField> recordField = recordTypeService.getTableFieldAllImf(recordTypeId, RecordUtil.RECORD);
        result.put("recordField", recordField);
        TableField recordfield = new TableField();
        recordfield.setFieldName("id");
        recordField.add(recordfield);
        String tableprefix = recordTypeService.selectByPrimaryKey(recordTypeId).getRecordtable().replace(RecordUtil.RECORD, "");
        String subject = recordService.selectSubjectByRecordOrVolumeId(tableprefix+RecordUtil.VOLUME, volumeId);
        PageView list = recordService.selectRecordByVolumeId(tableprefix, volumeId, subject, recordField);
        result.put("records", list);

        return result;
    }

    @RequiresRoles(value = {"SUPER ADMIN"})
    @ResponseBody
    @RequestMapping(
            value = "/getRecordColumns",
            method = RequestMethod.POST
    )
    public Map<String, Object> getRecordColumns(@RequestParam(
            value = "recordTypeId",
            required = true
    ) String recordTypeId, @RequestParam(
            value = "tablesuffix",
            required = true
    ) String tablesuffix, @RequestParam(
            value = "isInner",
            required = true
    ) Boolean isInner) {

        Map<String, Object> result = new HashMap<>();
        result.put("isOutPutSettingExist", false);
        //String tableFieldType = RecordUtil.VOLUME.equals(tablesuffix)?RecordUtil.RECORD:tablesuffix;
        Map colmap = danymicService.getColMapValue(recordTypeId, tablesuffix);
        result.put("colMap", colmap);
        result.put("cols", colmap.keySet());
        /*String outputOrderType = tableFieldType;
        if(!isInner){
            outputOrderType = RecordUtil.VOLUME;
        }*/
        if (outputOrderService.isExist(recordTypeId, tablesuffix)) {
            result.put("isOutPutSettingExist", true);
            result.put("outPutSetting", outputOrderService.selectByTypeIdAndCategory(recordTypeId, tablesuffix));
        }
        //result.put("recordcolumns",recordTypeService.getAllTableField(recordTypeId,tableFieldType));

        return result;
    }

    /**
     * Method description userInfo
     *
     * @param n
     * @param page
     * @param size
     * @param typeId
     * @param sn
     * @param mode
     * @param navid
     * @param model
     * @return String
     */
    @RequestMapping(
            value = "/info",
            method = RequestMethod.GET
    )
    public String userInfo(@RequestParam(
            value = "n",
            required = false
    ) Boolean n, @RequestParam(
            value = "page",
            required = false
    ) Integer page, @RequestParam(
            value = "size",
            required = false
    ) Integer size, @RequestParam(
            value = "typeId",
            required = false
    ) String typeId, @RequestParam(
            value = "sn",
            required = false
    ) Boolean sn, @RequestParam(
            value = "mode",
            required = false
    ) String mode, @RequestParam(
            value = "navid",
            required = false
    ) String navid, ModelMap model) {
        if (model.get("searchForm") == null) {
            model.addAttribute("searchForm", new SearchForm());
        }

        User user = shiroUserService.getLoginUser();
        model.addAttribute("user", user);
        // Subject currentUser = SecurityUtils.getSubject();
        return "index/user/info";
    }


    @RequiresRoles(value = {"SUPER ADMIN"})
    @ResponseBody
    @RequestMapping(value = "/volumeedit", method = RequestMethod.POST)
    public Map<String, Object> userEdit(
            @ModelAttribute("intoHouseForm") RecordVolumeForm intoHouseForm) {

        Map<String, Object> result = new HashMap<>();
        String tablePrefix = danymicService.getTablePrefix(intoHouseForm.getFonds(), intoHouseForm.getRecordtype());

        result.put("status", recordVolumeService.updateAddress(intoHouseForm, tablePrefix + RecordUtil.VOLUME));


        return result;

    }

    @RequiresRoles(value = {"SUPER ADMIN"})
    @ResponseBody
    @RequestMapping(value = "/pieceedit", method = RequestMethod.POST)
    public Map<String, Object> userEdit(
            @ModelAttribute("intoHouseForm") RecordForm intoHouseForm) {

        Map<String, Object> result = new HashMap<>();
        String tablePrefix = danymicService.getTablePrefix(intoHouseForm.getFonds(), intoHouseForm.getRecordtype());

        result.put("status", recordService.updateAddress(intoHouseForm, tablePrefix + RecordUtil.PIECE));

        return result;

    }


    /**
     * Method description userManage
     *
     * @param n
     * @param page
     * @param size
     * @param typeId
     * @param sn
     * @param mode
     * @param navid
     * @param model
     * @return String
     */
    @RequiresAuthentication
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/manage",
            method = RequestMethod.GET
    )
    public String userManage(@RequestParam(
            value = "n",
            required = false
    ) Boolean n, @RequestParam(
            value = "page",
            required = false
    ) Integer page, @RequestParam(
            value = "size",
            required = false
    ) Integer size, @RequestParam(
            value = "typeId",
            required = false
    ) String typeId, @RequestParam(
            value = "sn",
            required = false
    ) Boolean sn, @RequestParam(
            value = "mode",
            required = false
    ) String mode, @RequestParam(
            value = "navid",
            required = false
    ) String navid, ModelMap model) {
        List<Fonds> fondsList = fondsService.selectAll();
        List<RecordType> recordTypes = recordTypeService.selectAll();
        List<RecordCategory> recordCategories = recordCategoryService.selectAll();
        RecordTypeTree recordTypeTree;
        RecordTree recordTree;

        List<RecordTypeTree> recordCategoryTrees = new ArrayList<>();
        List<RecordTree> recordTrees = new ArrayList<>();


        for (RecordCategory recordCategory : recordCategories) {
            recordTypeTree = new RecordTypeTree();
            recordTypeTree.setRecordCategory(recordCategory);
            //recordTypeTree.setRecordCategoryContents(recordCategoryContentService.selectContentByType(recordCategory.getId()));
            recordCategoryTrees.add(recordTypeTree);
        }

        model.addAttribute("fondsList", fondsList);
        model.addAttribute("recordTypes", recordTypes);
        model.addAttribute("recordCategoryTrees", recordCategoryTrees);

        return "index/record/manage";
    }

    @ResponseBody
    @RequestMapping(value = "/checkdetail", method = RequestMethod.GET)
    public Map<String, Object> checkdetail(
            @RequestParam(value = "recordid", required = false) String recordid,
            @RequestParam(value = "recordtypeid", required = false) String recordtypeid,
            @RequestParam(value = "type", required = false) String type,
            final RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        try {
            String recordtable = recordTypeService.selectByPrimaryKey(recordtypeid).getRecordtable();
            String table_prefix = recordtable.substring(0, recordtable.lastIndexOf(RecordUtil.RECORD));

            DocumentExample example = new DocumentExample();
            DocumentExample.Criteria criteria = example.createCriteria();
            criteria.andRecordIdEqualTo(recordid);
            if (type.equals(RecordUtil.RECORD))
                result.put("documents", documentService.selectByExample(example, table_prefix + RecordUtil.DOCUMENT));
            else if (type.equals(RecordUtil.PIECE))
                result.put("documents", documentService.selectByExample(example, table_prefix + RecordUtil.PIECEDOCUMENT));

            String content = "点击查看了";
            try{
                //右侧档案基本信息---
                SelectImformation si = new SelectImformation(table_prefix + type, recordid, recordTypeService.getAllTableField(recordtypeid, type));
                
                if (si.getField() != null && si.getField().size() > 0)
                    result.put("information", si.setFieldByMap(recordService.getImformation(si)));
                else
                    result.put("information", null);
                
                if (type.equals(RecordUtil.RECORD))
                	content += "（"+si.getRecordNo()+"）卷内（"+si.getTitle()+"）";
                else if (type.equals(RecordUtil.PIECE))
                	content += "（"+si.getRecordNo()+"）按件（"+si.getTitle()+"）";
            }catch(Exception e){
            	e.printStackTrace();
                result.put("information", null);
            }

            //档案内容信息---
            try{
	            result.put("filecontent", danymicService.selectInfoByRecordId(table_prefix + type, type, recordid));
            }catch(Exception e){
            	e.printStackTrace();
            }


            //权限
            List<String> codes = shiroUserService.getCode(shiroUserService.getLoginUser().getUserid(), recordtypeid);
            //System.out.println(codes.toString());
            
            List<String> archivesaudits = archivesService.getArchivesOrder(recordtypeid,type,recordid);
            if(archivesaudits.size()>0)
            	archivesaudits.add("accessrecord");
            //System.out.println(archivesaudits.toString());
            
            for(String archivesaudit:archivesaudits)
            	if(!codes.contains(archivesaudit))
            		codes.add(archivesaudit);
            	
            result.put("codes", codes);

            logService.insertCheck(content+"的详情页面");
            //danymicServiceImpl.selectInfoByRecordId("", "", recordid);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;

    }

    @ResponseBody
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public Map<String, Object> detail(
            @RequestParam(value = "recordid", required = false) String recordid,
            @RequestParam(value = "recordtypeid", required = false) String recordtypeid,
            @RequestParam(value = "type", required = false) String type,
            final RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        try {
            String recordtable = recordTypeService.selectByPrimaryKey(recordtypeid).getRecordtable();
            String table_prefix = recordtable.substring(0, recordtable.lastIndexOf(RecordUtil.RECORD));

            DocumentExample example = new DocumentExample();
            DocumentExample.Criteria criteria = example.createCriteria();
            criteria.andRecordIdEqualTo(recordid);
            if (type.equals(RecordUtil.RECORD))
                result.put("documents", documentService.selectByExample(example, table_prefix + RecordUtil.DOCUMENT));
            else if (type.equals(RecordUtil.PIECE))
                result.put("documents", documentService.selectByExample(example, table_prefix + RecordUtil.PIECEDOCUMENT));
            //右侧档案基本信息---
            SelectImformation si = new SelectImformation(table_prefix + type, recordid, recordTypeService.getAllTableField(recordtypeid, type));
            if (si.getField() != null && si.getField().size() > 0)
                result.put("information", si.setFieldByMap(recordService.getImformation(si)));
            else
                result.put("information", null);

            //档案内容信息---
            try{
                result.put("filecontent", danymicService.selectInfoByRecordId(table_prefix + type, type, recordid));
            }catch(Exception e){
            	//e.printStackTrace();
            }

            //danymicServiceImpl.selectInfoByRecordId("", "", recordid);
        } catch (Exception e) {
            //e.printStackTrace();
        }

        return result;

    }

    @RequiresRoles(value = {"SUPER ADMIN"})
    @ResponseBody
    @RequestMapping(value = "/checkPass", method = RequestMethod.POST)
    public Map<String, Object> checkPass(
            @RequestParam(value = "recordid", required = false) String recordid,
            @RequestParam(value = "recordtypeid", required = false) String recordtypeid,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "recordno", required = false) String recordno,
            final RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        try {
            RecordType recordType = recordTypeService.selectByPrimaryKey(recordtypeid);
            String recordtable = recordType.getRecordtable();
            String tablename = recordtable.replace(RecordUtil.RECORD, type);

            result.put("status", recordService.checkPass(tablename, recordid, recordno));

            Record record = recordService.selectByPrimaryKey(recordid, tablename);
            String suffix = RecordUtil.PIECEDOCUMENT;
            if (type.equals(RecordUtil.RECORD))
                suffix = RecordUtil.DOCUMENT;
            List<Document> docs = ducomentService.selectByRecord(recordid, recordtable.replace(RecordUtil.RECORD, suffix));
            //System.out.println(ROOT_PATH);
            for (Document doc : docs) {
                //luceneIndex.index(record.getSubject(), recordid, recordtypeid, type, ROOT_PATH+doc.getPath(),recordno);
                luceneIndex.index(record.getSubject(), recordid, recordtypeid, type, ROOT_PATH + doc.getPath(), recordno ,doc.getId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;

    }

    @RequiresRoles(value = {"SUPER ADMIN"})
    @ResponseBody
    @RequestMapping(value = "/getrecordno", method = RequestMethod.GET)
    public Map<String, Object> getrecordno(
            @RequestParam(value = "recordid", required = false) String recordid,
            @RequestParam(value = "recordtypeid", required = false) String recordtypeid,
            @RequestParam(value = "type", required = false) String type,
            final RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        try {

            RecordType recordType = recordTypeService.selectByPrimaryKey(recordtypeid);
            String recordtable = recordType.getRecordtable();
            String table_prefix = recordtable.replace(RecordUtil.RECORD, "");

            List<TableField> tfs = recordTypeService.getAllTableField(recordtypeid, type);
            SelectImformation si = new SelectImformation(table_prefix + type, recordid, tfs);
            
            String tablename = recordtable.replace(RecordUtil.RECORD, type);
            String fondsno = fondsService.selectByPrimaryKey(recordType.getFondsid()).getFondsno();
            result.put("recordno", recordService.getRecordNo(tfs, si, fondsno, recordtypeid, type, tablename, recordid));
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;

    }

    @RequiresRoles(value = {"SUPER ADMIN"})
    @ResponseBody
    @RequestMapping(value = "/refusePass", method = RequestMethod.POST)
    public Map<String, Object> refusePass(
            @RequestParam(value = "recordid", required = false) String recordid,
            @RequestParam(value = "recordtypeid", required = false) String recordtypeid,
            @RequestParam(value = "failReason", required = false) String failReason,
            @RequestParam(value = "type", required = false) String type,
            final RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        try {
            String recordtable = recordTypeService.selectByPrimaryKey(recordtypeid).getRecordtable();
            result.put("status", recordService.refusePass(recordtable.replace(RecordUtil.RECORD, type), recordid, failReason));
        } catch (Exception e) {
            e.printStackTrace();
            result.put("status", 0);
        }

        return result;

    }

    @ResponseBody
    @RequestMapping(value = "/indexsearch", method = RequestMethod.POST)
    public Map<String, Object> indexsearchKey(
            @RequestParam(value = "indexsearchKey", required = false) String indexsearchKey,
            @RequestParam(value = "pagenum", required = false) String pagenum,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "recordtypeid", required = false) String recordtypeid,
            final RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        try {
        	
            //System.out.println(indexsearchKey+" "+pagenum);
            Page page = luceneSearch.search(indexsearchKey, type, pagenum == null ? 1 : Integer.parseInt(pagenum),recordtypeid);
            result.put("searchResults", page);
            result.put("pages", new PageView(page).showPages());
        } catch (Exception e) {
            e.printStackTrace();
            result.put("status", 0);
        }

        return result;

    }

    @ResponseBody
    @RequestMapping(value = "/volumeinnerbatchupload", method = RequestMethod.POST)
    public Map<String, Object> batchupload(
            @RequestParam(value = "recordfile", required = false) List<MultipartFile> recordfile,
            final RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        Map<String, List<Document>> volumeDocumentMap = new HashMap<>();
        Map<String, RecordType> pathMap = new HashMap<>();
        Map<String, BatchUploadSequence> sequenceMap = new HashMap<>();
        /*Map<String, List<String>> failureInners = new HashMap<>();*/
        List<String> volumenos = new ArrayList<>();
        List<String> failureNos = new ArrayList<>();
        String volumeno = "";

        for (MultipartFile file : recordfile) {
            String filename = file.getOriginalFilename();
            String currentRecordNo = filename.substring(0,filename.lastIndexOf("."));
            String temp = filename.substring(0, filename.lastIndexOf("-"));
            String sequence = filename.substring(filename.lastIndexOf("-") + 1, filename.lastIndexOf("."));
            if (!volumeno.equals(temp)) {
                volumeno = temp;
            }
            RecordType recordType = null;
            if (!pathMap.containsKey(temp)) {
                recordType = danymicService.getPrePath(volumeno);
            } else {
                recordType = pathMap.get(volumeno);
            }
            if (recordType != null) {
                if (!volumenos.contains(volumeno)) {
                    volumenos.add(volumeno);
                }
                pathMap.put(volumeno, recordType);

                String prePath = recordType.getVolumetable().substring(0, recordType.getVolumetable().lastIndexOf("_"));
                String recordTable = prePath + RecordUtil.RECORD;
                String recordId = danymicService.selectByRecordNo(recordTable, currentRecordNo);
                BatchUploadSequence batchUploadSequence = sequenceMap.get(volumeno);
                if (batchUploadSequence == null) {
                    batchUploadSequence = new BatchUploadSequence();
                    batchUploadSequence.setFailureSequence(new ArrayList<String>());
                    batchUploadSequence.setSuccessSequence(new ArrayList<String>());
                    sequenceMap.put(volumeno, batchUploadSequence);
                }
                if (StringUtils.isEmpty(recordId)) {
                    /*List<String> sequenceList = failureInners.containsKey(volumeno) ? failureInners.get(volumeno) : new ArrayList<String>();
                    sequenceList.add(sequence);
                    failureInners.put(volumeno, sequenceList);*/
                    //volumenos.remove(volumeno);
                    batchUploadSequence.getFailureSequence().add(sequence);
                    continue;
                }
                batchUploadSequence.getSuccessSequence().add(sequence);
                /*List<String> sequenceList = sequenceMap.containsKey(volumeno) ? sequenceMap.get(volumeno) : new ArrayList<String>();
                sequenceList.add(sequence);
                sequenceMap.put(volumeno, sequenceList);*/
                //String volumeid = prePath.substring(prePath.lastIndexOf("/") + 1);
                String relativePath = prePath + "/" + recordId + "/" + file.getOriginalFilename();

                List<Document> documents = volumeDocumentMap.get(volumeno);
                if (documents == null) {
                    documents = new ArrayList<>();
                    volumeDocumentMap.put(volumeno, documents);
                }
                try {
                	String path = ROOT_PATH + relativePath;
                	String suffix = relativePath.substring(relativePath.lastIndexOf(".") + 1);//.toLowerCase()
              	String prefix = path.substring(0,path.lastIndexOf("."));//.toLowerCase()
                    fileService.writeAllFile(file.getInputStream(), prefix,suffix);
                } catch (IOException e) {
                    e.printStackTrace();
                }

                //save document info into database
                Document document = new Document();
                String documentid = IDGenerator.generator();
                document.setId(documentid);
                document.setRecordid(recordId);
                document.setPath(relativePath);
                document.setUploadtime(new Date());
                documents.add(document);
                
                try {
					luceneIndex.index(recordService.selectByPrimaryKey(recordId, recordTable).getSubject(), 
							recordId, recordType.getId(), RecordUtil.RECORD, ROOT_PATH + relativePath, volumeno + "-" + sequence,documentid);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            } else {
                if (!failureNos.contains(volumeno)) {
                    failureNos.add(volumeno);
                }
            }
        }


        for (String no : volumenos) {
            List<Document> documents = volumeDocumentMap.get(no);
            RecordType recordType = pathMap.get(no);
            String prePath = recordType.getVolumetable().substring(0, recordType.getVolumetable().lastIndexOf("_"));
            String documentTable = prePath + RecordUtil.DOCUMENT;
            danymicService.insertBatchDocuments(documents, documentTable.toLowerCase());
        }

        result.put("successNos", sequenceMap);
        result.put("failureNos", failureNos);
        /*result.put("failureInners", failureInners);*/
        return result;

    }


    @ResponseBody
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public Map<String, Object> delete( ModelMap model,HttpSession session,
            @RequestParam(value = "recordtypeid", required = false) String recordtypeid,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "recordid", required = false) String recordid
            ) {
        Map<String, Object> result = new HashMap<>();
        try {
        	String tablesufix = recordTypeService.selectByPrimaryKey(recordtypeid).getRecordtable().replace(RecordUtil.RECORD, "");
            String documenttable = "";
        	if(type.endsWith(RecordUtil.PIECE))
        		documenttable= tablesufix+RecordUtil.PIECEDOCUMENT;
        	else
        		documenttable= tablesufix+RecordUtil.DOCUMENT;
        	for(Document document:documentService.selectByRecord(recordid, documenttable)){
        		new File(ROOT_PATH+document.getPath()).delete();
        	}
        	if(type.endsWith(RecordUtil.PIECE))
        		documentService.deleteByRecordId(recordid, tablesufix+RecordUtil.PIECEDOCUMENT);
        	else
        		documentService.deleteByRecordId(recordid, tablesufix+RecordUtil.DOCUMENT);
    		luceneIndex.deleteByRecordId(recordid, type, recordtypeid);
    		recordService.delete(recordid, tablesufix+type);
    		result.put("status", 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return result;
    }

    /*@ResponseBody*/
    @RequestMapping(value = "/batchupload", method = RequestMethod.POST,produces = "text/html;charset=utf-8")
    public void batchupload2(
            @RequestParam(value = "recordfile", required = false) List<MultipartFile> recordfile,
            @RequestParam(value = "recordTypeId", required = false) String recordTypeId,
            final RedirectAttributes redirectAttributes, ModelMap model, HttpServletRequest request,HttpServletResponse response) {
        Map<String, Object> result = new HashMap<>();

        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = new HashMap<>();
        List<String> recordNos = new ArrayList<>();
        List<String> successNos = new ArrayList<>();

        for (MultipartFile file :recordfile) {
            String filename = file.getOriginalFilename();
            String currentRecordNo = filename.substring(0,filename.lastIndexOf("."));
            recordNos.add(currentRecordNo);
            fileMap.put(currentRecordNo,file);
        }

        String tablePrefix = danymicService.getTablePrefix(recordTypeId);
        String  recordSuffix = RecordUtil.RECORD;
        String  docementSuffix = RecordUtil.DOCUMENT;
        List<Record> records = recordService.selectIdsByNos(recordNos,tablePrefix+recordSuffix);
        List<Document> documents = new ArrayList<>();

        String documentTable = tablePrefix+docementSuffix;
        PdfReader pdfReader = null;
        List<String> deleteIds = new ArrayList<>();
        for(Record record:records){
            successNos.add(record.getRecordno());
            MultipartFile file = fileMap.get(record.getRecordno());
            String recordId = record.getId();
            String relativePath = tablePrefix + recordSuffix + "/" + record.getId() + "/" + file.getOriginalFilename();
            String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
            List<String> ids = documentService.getDocuments(recordId,relativePath,documentTable);
            if(ids.size()>0){
            	 
                //save document info into database
                deleteIds.addAll(ids);
            }
            Document document = new Document();
            String documentid = IDGenerator.generator();
            document.setId(documentid);
            document.setRecordid(recordId);
            document.setPath(relativePath);
            document.setUploadtime(new Date());
            documents.add(document);
            try {
                //count pagenum
                int page = record.getPagenum()!=null?record.getPagenum():0;
                if ("pdf".equalsIgnoreCase(suffix)) {
                    pdfReader = new PdfReader(file.getInputStream());
                    page += pdfReader.getNumberOfPages();
                    recordService.updatePageNum(recordId,page,tablePrefix+RecordUtil.RECORD);
                }

            	String path = ROOT_PATH + relativePath;
            	String prefix = path.substring(0,path.lastIndexOf("."));//.toLowerCase()
                fileService.writeAllFile(file.getInputStream(), prefix,suffix);
                
                luceneIndex.index(record.getSubject(),
                        recordId, recordTypeId, RecordUtil.RECORD, ROOT_PATH + relativePath, record.getRecordno(),documentid);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }


        if(!documents.isEmpty()){
            if(deleteIds.size()>0){
                documentService.deleteByIds(documentTable.toLowerCase(),deleteIds);
            }
            danymicService.insertBatchDocuments(documents, documentTable.toLowerCase());
        }
        recordNos.removeAll(successNos);
        result.put("successNos", successNos);
        result.put("failureNos", recordNos);

        WebUtils.returnJson(response, result);
        /*return result;*/

    }
    /*@ResponseBody*/
    @RequestMapping(value = "/piecebatchupload", method = RequestMethod.POST,produces = "text/html;charset=utf-8")
    public void piecebatchupload(
            @RequestParam(value = "recordfile", required = false) List<MultipartFile> recordfile,
            @RequestParam(value = "recordTypeId", required = false) String recordTypeId,
            final RedirectAttributes redirectAttributes, ModelMap model,HttpServletResponse response) {
        Map<String, Object> result = new HashMap<>();
        Map<String, MultipartFile> fileMap = new HashMap<>();
        List<String> recordNos = new ArrayList<>();
        List<String> successNos = new ArrayList<>();
        List<String> deleteIds = new ArrayList<>();
        for (MultipartFile file : recordfile) {
            String filename = file.getOriginalFilename();
            String currentRecordNo = filename.substring(0,filename.lastIndexOf("."));
            recordNos.add(currentRecordNo);
            fileMap.put(currentRecordNo,file);
        }

        String tablePrefix = danymicService.getTablePrefix(recordTypeId);
        String  recordSuffix = RecordUtil.PIECE;
        String  docementSuffix = RecordUtil.PIECEDOCUMENT;
        List<Record> records = recordService.selectIdsByNos(recordNos,tablePrefix+recordSuffix);
        List<Document> addDocuments = new ArrayList<>();

        String documentTable = tablePrefix + docementSuffix;
        PdfReader pdfReader = null;
        for(Record record:records){
            successNos.add(record.getRecordno());
            MultipartFile file = fileMap.get(record.getRecordno());
            String recordId = record.getId();
            String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
            String relativePath = tablePrefix + recordSuffix + "/" + record.getId() + "/" + file.getOriginalFilename();

            List<String> ids = documentService.getDocuments(recordId,relativePath,documentTable);
            if(ids.size()>0){
                //save document info into database
                deleteIds.addAll(ids);
            }

            Document document = new Document();
            String documentid = IDGenerator.generator();
            document.setId(documentid);
            document.setRecordid(recordId);
            document.setPath(relativePath);
            document.setUploadtime(new Date());
            addDocuments.add(document);

            try {
                //count pagenum
                int page = record.getPagenum()!=null?record.getPagenum():0;
                if ("pdf".equalsIgnoreCase(suffix)) {
                    pdfReader = new PdfReader(file.getInputStream());
                    page += pdfReader.getNumberOfPages();
                    recordService.updatePageNum(recordId,page,tablePrefix+RecordUtil.PIECE);
                }

            	String path = ROOT_PATH + relativePath;
            	String prefix = path.substring(0,path.lastIndexOf("."));//.toLowerCase()
                fileService.writeAllFile(file.getInputStream(), prefix,suffix);
                luceneIndex.index(record.getSubject(),
                        recordId, recordTypeId, RecordUtil.PIECE, ROOT_PATH + relativePath, record.getRecordno(),documentid);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        if(!addDocuments.isEmpty()) {
            if(deleteIds.size()>0){
                documentService.deleteByIds(documentTable.toLowerCase(),deleteIds);
            }
            danymicService.insertBatchDocuments(addDocuments, documentTable.toLowerCase());
        }
        recordNos.removeAll(successNos);

        result.put("successNos", successNos);
        result.put("failureNos", recordNos);
        WebUtils.returnJson(response, result);
        /*return result;*/

    }




   /* @ResponseBody
    @RequestMapping(value = "/createIndex", method = RequestMethod.POST)
    public Map<String, Object> createIndex(
            @RequestParam(value = "indexsearchKey", required = false) String indexsearchKey,
            @RequestParam(value = "pageNum", required = false) String pageNum,
            final RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        try {

        	luceneIndex.updateRecordNo("1","3IYanr0E50Ro0NpEk5VBdb");
        	//new LuceneIndex().index("subject","recordid","recordtypeid","record","D:\\file\\11.pdf","1-2016-1");
            result.put("status", 1);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("status", 0);
        }

        return result;

    }*/
    

    @ResponseBody
    @RequestMapping(value = "/uploadexcel", method = RequestMethod.POST)
    public Map<String, Object> uploadexcel(
            @RequestParam(value = "file", required = false) MultipartFile file,
            @RequestParam(value = "recordtypeid", required = false) String recordtypeid,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "cover", required = false) String cover,
            final RedirectAttributes redirectAttributes, ModelMap model,HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        
        try {
        	CountAndNums countAndNums = null;
        	if(file.getOriginalFilename().toLowerCase().endsWith("xls"))
        		countAndNums = exportService.uploadXls(file.getInputStream(),recordtypeid,type,cover,session);
        	else if(file.getOriginalFilename().toLowerCase().endsWith("xlsx")){
        		countAndNums = exportService.uploadSlsx(file.getInputStream(),recordtypeid,type,cover,session);
        	}else{
        		result.put("type", "-1");
        	}
        	if(countAndNums==null)
        		result.put("count", -1);
            else{
                result.put("errornums", countAndNums.getErrornums());
                result.put("successnums", countAndNums.getSuccessnums());
                result.put("isexcist", countAndNums.getIsexcist());
                result.put("novolumeno", countAndNums.getNovolumeno());
                result.put("nogeneraldata", countAndNums.getNogeneraldata());
                
                result.put("count", countAndNums.getCount());
            }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return result;
    }


    @ResponseBody
    @RequestMapping(value = "/checkuploadrecord", method = RequestMethod.POST)
    public Map<String, Object> checkuploadrecord( ModelMap model,HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        
        try {
        	UploadRecordSession uploadRecordSession = (UploadRecordSession)session.getAttribute("uploadRecordSession");
        	if(uploadRecordSession!=null)
        		result.put("uploadRecordSession", uploadRecordSession);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return result;
    }
    @ResponseBody
    @RequestMapping(value = "/deleteApply", method = RequestMethod.POST)
    public Map<String, Object> deleteApply( ModelMap model,
            @RequestParam(value = "recordid", required = false) String recordid,
            @RequestParam(value = "recordtypeid", required = false) String recordtypeid,
            @RequestParam(value = "type", required = false) String type) {
        Map<String, Object> result = new HashMap<>();
        
        try {
        	String table_prefix = recordTypeService.selectByPrimaryKey(recordtypeid).getRecordtable().replace(RecordUtil.RECORD, "");
        	String tableName = table_prefix+type;
        	String documentName = table_prefix+RecordUtil.DOCUMENT;
        	if(type.equals(RecordUtil.PIECE))
        		documentName = table_prefix+RecordUtil.PIECEDOCUMENT;
        	
    		documentService.deleteByRecordId(recordid,documentName);
    		luceneIndex.deleteByRecordId(recordid, type, recordtypeid);
        	result.put("status", recordService.delete(recordid,tableName));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/uploadexcelinfo", method = RequestMethod.POST)
    public Map<String, Object> uploadexcelinfo(@RequestParam(
            value = "templateid",
            required = true
    		) String templateid, 
            @RequestParam(value = "file", required = false) MultipartFile file,
            final RedirectAttributes redirectAttributes, ModelMap model,HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        
        try {

            List<Info> infos = null;
            if (templateid.contains(RecordUtil.RECORD)) {
                infos = infoService.selectByTempleId(templateid);
            } else if (templateid.contains(RecordUtil.PIECE)) {
                infos = infoService.selectByPieceId(templateid);
            }

            result.put("infos", infos);
            
        	List<Map> dataMap = new ArrayList<Map>();
        	if(file.getOriginalFilename().toLowerCase().endsWith("xls"))
        		dataMap = exportService.uploadXlsInfo(file.getInputStream(),infos);
        	else if(file.getOriginalFilename().toLowerCase().endsWith("xlsx")){
        		dataMap = exportService.uploadXlsxInfo(file.getInputStream(),infos);
        	}else{
        		result.put("status", "-1");
        	}
        	if(dataMap == null)
                result.put("status", -1);

            result.put("dataMap", dataMap);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return result;
    }
    
    @ResponseBody
    @RequestMapping(value = "/batchdelete", method = RequestMethod.POST)
    public Map<String, Object> batchDelete( ModelMap model,HttpSession session,@RequestParam(
            value = "recordTypeId",
            required = true
    ) String recordTypeId,@RequestParam(
            value = "recordCategory",
            required = true
    ) String recordCategory,@RequestParam(
            value = "selectids",
            required = false
    ) List<String> selectids) {
        Map<String, Object> result = new HashMap<>();
        String tablePrefix = recordTypeService.selectByPrimaryKey(recordTypeId).getRecordtable().replace(RecordUtil.RECORD, "");
        try {
        	if(RecordUtil.VOLUME.equals(recordCategory)){
        		for(String volumeId:selectids){
        			List<Record> records = recordService.getByVolumeNo(volumeId, tablePrefix);
            		for(Record record:records){
            			List<Document> docs = documentService.selectByRecord(record.getId(), tablePrefix+RecordUtil.DOCUMENT);
            			for(Document doc :docs){
            				File file = new File(ROOT_PATH+doc.getPath());
            				if(file.exists())
            					file.delete();
            			}
            			documentService.deleteByRecordId(record.getId(), tablePrefix+RecordUtil.DOCUMENT);
            			luceneIndex.deleteByRecordId(record.getId(), RecordUtil.RECORD, recordTypeId);
            			recordService.delete(record.getId(), tablePrefix+RecordUtil.RECORD);
            		}
        			recordService.delete(volumeId, tablePrefix+RecordUtil.VOLUME);
        		}
    			result.put("status", 1);
        	}else{
        		for(String pieceId:selectids){
        			List<Document> docs = documentService.selectByRecord(pieceId, tablePrefix+RecordUtil.PIECEDOCUMENT);
        			for(Document doc :docs){
        				File file = new File(ROOT_PATH+doc.getPath());
        				if(file.exists())
        					file.delete();
        			}
        			documentService.deleteByRecordId(pieceId, tablePrefix+RecordUtil.PIECEDOCUMENT);
        			luceneIndex.deleteByRecordId(pieceId, RecordUtil.PIECE, recordTypeId);
        			recordService.delete(pieceId, tablePrefix+RecordUtil.PIECE);
        		}
    			result.put("status", 1);
        	}
		} catch (Exception e) {
			result.put("status", 0);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return result;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
