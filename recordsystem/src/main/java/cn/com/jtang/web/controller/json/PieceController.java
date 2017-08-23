package cn.com.jtang.web.controller.json;

import cn.com.jtang.po.*;
import cn.com.jtang.po.custom.RecordTree;
import cn.com.jtang.po.custom.RecordTypeTree;
import cn.com.jtang.service.*;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.RecordSearchForm;
import cn.com.jtang.web.controller.form.common.SearchForm;
import cn.com.jtang.web.controller.form.common.UserCreateForm;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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
@Controller("jsonPieceController")
@RequestMapping("/json/piece")
@SessionAttributes({ "buildRecordSearchForm","datalists"})
public class PieceController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private UserService userService;
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
    private YearService yearService;
    @Resource
    private DeadlineService deadlineService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    private PendingService pendingService;


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

        result.put("fonds", fondsService.selectAll());
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
        example.setTableName((fonds.getFondsno() + "_" + recordType.getTypeno() + RecordUtil.RECORD).toLowerCase());
        //criteria.andRecordtypeEqualTo(buildRecordSearchForm.getRtId());
        int yearid = !StringUtils.isEmpty(buildRecordSearchForm.getYear()) ? Integer.valueOf(buildRecordSearchForm.getYear()) : ((List<Year>) result.get("years")).get(0).getId();
        int departmentid = !StringUtils.isEmpty(buildRecordSearchForm.getDepartment()) ? Integer.valueOf(buildRecordSearchForm.getDepartment()) : ((List<Department>) result.get("departments")).get(0).getId();
        criteria.andYearEqualTo(yearid);
        if (!StringUtils.isEmpty(buildRecordSearchForm.getDeadline())) {
            criteria.andDeadlineEqualTo(Integer.valueOf(buildRecordSearchForm.getDeadline()));
        }
        criteria.andDepartmentEqualTo(departmentid);
        criteria.andCheckstatusEqualTo(RecordUtil.CHECK_PASS);
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
    public Map<String, Object> deviceManage(@ModelAttribute("recordSearchForm") RecordSearchForm recordSearchForm,@RequestParam(value = "isStore", required = false)Boolean isStore,  ModelMap model, HttpSession session) {

        Map<String, Object> result = new HashMap<>();

        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();
        if(recordSearchForm.getCols()!=null)
        	criteria.andLIkeByCol(recordSearchForm.getCols());
        Fonds fonds = fondsService.selectByPrimaryKey(recordSearchForm.getFondsId());
        RecordType recordType = recordTypeService.selectByPrimaryKey(recordSearchForm.getRtId());
        example.setTableName((fonds.getFondsno() + "_" + recordType.getTypeno() + RecordUtil.PIECE).toLowerCase());
        example.setOrderByClause("createtime asc");

        criteria.andCheckstatusEqualTo(recordSearchForm.getStatus());

        String all = "0";
        if (!StringUtils.isEmpty(recordSearchForm.getDeadline())&&!all.equals(recordSearchForm.getDeadline())) {
            criteria.andDeadlineEqualTo(Integer.valueOf(recordSearchForm.getDeadline()));
        }
        if (!StringUtils.isEmpty(recordSearchForm.getDepartment())&&!all.equals(recordSearchForm.getDepartment())) {
            criteria.andDepartmentEqualTo(Integer.valueOf(recordSearchForm.getDepartment()));
        }
        if (!StringUtils.isEmpty(recordSearchForm.getYear())&&!all.equals(recordSearchForm.getYear())) {
            criteria.andYearEqualTo(Integer.valueOf(recordSearchForm.getYear()));
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

        result.put("years", yearService.selectAll());
        result.put("deadlines", deadlineService.selectAll());
        result.put("departments", departmentService.selectAll());

        result.put("subject",recordTypeService.getTitle(recordSearchForm.getRtId(), "_piece"));
        result.put("records", records);
        result.put("pages", records.showPages());
        if(isStore!=null&&isStore){
            model.addAttribute("datalists",recordService.selectIdsByExample(example));
        }
        return result;
    }


    @RequiresPermissions(value = {"viewvolumeinner"})
    @ResponseBody
    @RequestMapping(
            value = "/getRecord",
            method = RequestMethod.POST
    )
    public Map<String,Object> getRecord( @RequestParam(
            value = "volumeId",
            required = true
    ) String volumeId,  @RequestParam(
            value = "fondsId",
            required = true
    ) String fondsId,@RequestParam(
            value = "recordTypeId",
            required = true
    ) String recordTypeId,final RedirectAttributes redirectAttributes, ModelMap model) {

        Map<String,Object> result = new HashMap<>();
        result.put("records",recordService.getByVolumeId(volumeId,fondsId,recordTypeId));

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
    @RequiresPermissions(value = {"viewtree"})
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


   /* @RequiresRoles(value = {"SUPER ADMIN"})
    @ResponseBody
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public Map<String, Object> detail(
            @RequestParam(value = "recordid", required = false) String recordid,
            @RequestParam(value = "recordtypeid", required = false) String recordtypeid,
            final RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        try {
        	String recordtable = recordTypeService.selectByPrimaryKey(recordtypeid).getRecordtable();
        	String table_prefix = recordtable.substring(0, recordtable.lastIndexOf(RecordUtil.RECORD));
            DocumentExample example = new DocumentExample();
            DocumentExample.Criteria criteria = example.createCriteria();
            criteria.andRecordIdEqualTo(recordid);

            result.put("documents", documentService.selectByExample(example, table_prefix + RecordUtil.DOCUMENT));

            SelectImformation si = new SelectImformation(table_prefix + RecordUtil.RECORD, recordid, recordTypeService.getTableField(recordtypeid));
            result.put("information", si.setFieldByMap(recordService.getImformation(si)));

            result.put("filecontent", danymicService.selectInfoByRecordId(table_prefix, recordid));

            //danymicServiceImpl.selectInfoByRecordId("", "", recordid);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;

    }

    @RequiresRoles(value = {"SUPER ADMIN"})
    @ResponseBody
    @RequestMapping(value = "/checkPass", method = RequestMethod.GET)
    public Map<String, Object> checkPass(
            @RequestParam(value = "recordid", required = false) String recordid,
            @RequestParam(value = "table_prefix", required = false) String table_prefix,
            final RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        try {
            result.put("status", recordService.checkPass(table_prefix + RecordUtil.RECORD, recordid));
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
            @RequestParam(value = "table_prefix", required = false) String table_prefix,
            @RequestParam(value = "failReason", required = false) String failReason,
            final RedirectAttributes redirectAttributes, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        try {
            System.out.println(failReason);
            result.put("status", recordService.refusePass(table_prefix + RecordUtil.RECORD, recordid, failReason));
        } catch (Exception e) {
            e.printStackTrace();
            result.put("status", 0);
        }

        return result;

    }*/
}


//~ Formatted by Jindent --- http://www.jindent.com
