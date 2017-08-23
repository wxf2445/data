package cn.com.jtang.web.controller.json;

import cn.com.jtang.po.*;
import cn.com.jtang.po.custom.RecordTree;
import cn.com.jtang.po.custom.RecordTypeTree;
import cn.com.jtang.service.*;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.CreateVolumeForm;
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
@Controller("jsonRecordVolumnController")
@RequestMapping("/json/recordvolume")
@SessionAttributes({"recordSearchForm","datalists"})
public class RecordVolumnController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private IndexTableService indexTableService;
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private FondsService fondsService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private RecordCategoryService recordCategoryService;
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


    @ResponseBody
    @RequestMapping(
            value = "/getBase",
            method = RequestMethod.POST
    )
    public Map<String, Object> getBase(@RequestParam(value = "volumeId",required = true) String volumeId,
                                       @RequestParam(value = "fondsId", required = false)String fondsId,
                                       @RequestParam(value = "recordTypeId", required = false)String recordTypeId,
                                       ModelMap model, HttpSession session) {
        Map<String,Object> result = new HashMap<>();

        result.put("volumebase",recordVolumeService.getMapValue(volumeId,fondsId,recordTypeId));

        result.put("customValueFields", recordTypeService.getCustomValueFields(recordTypeId, RecordUtil.RECORD));
        List<TableField> tableFields = recordTypeService.getCustomIndexFields(recordTypeId,RecordUtil.RECORD);
        if(tableFields!=null){
            result.put("customIndexFields", tableFields);
            for(TableField tableField : tableFields){
                Map<String,List<AddIndex>> map = new HashMap<>();
                map.put(tableField.getFieldName(),indexTableService.selectAllIndexValue(tableField.getFieldName()));
                result.put("indexMap",map);
            }
        }
        result.put("years", yearService.selectAll());
        result.put("deadlines", deadlineService.selectAll());
        result.put("departments", departmentService.selectAll());

        return result;
    }


        @RequiresPermissions(value = {"viewtree"})
    @ResponseBody
    @RequestMapping(
            value = "/manage",
            method = RequestMethod.POST
    )
    public Map<String, Object> deviceManage(@ModelAttribute("recordSearchForm") RecordSearchForm recordSearchForm,@RequestParam(value = "isStore", required = false)Boolean isStore, ModelMap model, HttpSession session) {

        Map<String, Object> result = new HashMap<>();

        RecordVolumeExample example = new RecordVolumeExample();
        RecordVolumeExample.Criteria criteria = example.createCriteria();
        if(recordSearchForm.getCols()!=null)
        	criteria.andLIkeByCol(recordSearchForm.getCols());

        criteria.andCheckstatusEqualTo(recordSearchForm.getStatus());
        Fonds fonds = fondsService.selectByPrimaryKey(recordSearchForm.getFondsId());
        RecordType recordType = recordTypeService.selectByPrimaryKey(recordSearchForm.getRtId());
        PageView records = null;
        if(recordType!=null){
        	example.setTableName((fonds.getFondsno() + "_" + recordType.getTypeno() + "_volume").toLowerCase());

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

            //criteria.andRecordtypeEqualTo(recordSearchForm.getRtId());
            /*if (RecordUtil.YEAR.equals(recordSearchForm.getRecordCatogory())) {
                criteria.andYearEqualTo(recordSearchForm.getRccId());
            } else if (RecordUtil.DEADLINE.equals(recordSearchForm.getRecordCatogory())) {
                criteria.andDeadlineEqualTo(recordSearchForm.getRccId());
            } else if (RecordUtil.DEPARTMENT.equals(recordSearchForm.getRecordCatogory())) {
                criteria.andDepartmentEqualTo(recordSearchForm.getRccId());
            }*/

            /*if (!StringUtils.isEmpty(recordSearchForm.getFondsId())) {
                criteria.andFontsidEqualTo(recordSearchForm.getFondsId());
            }*/

            if (!StringUtils.isEmpty(recordSearchForm.getKey())) {
                criteria.andSubjectLike("%" + recordSearchForm.getKey() + "%");
            }

            if (recordSearchForm.getStarttime() != null) {
                criteria.andCreatetimeGreaterThan(recordSearchForm.getStarttime());
            }

            if (recordSearchForm.getEndtime() != null) {
                criteria.andCreatetimeLessThan(recordSearchForm.getEndtime());
            }

            int page = (recordSearchForm.getPage() == null)
                    ? 0
                    : recordSearchForm.getPage();
            int size = (recordSearchForm.getSize() == null)
                    ? 0
                    : recordSearchForm.getSize();
            Page pageObject = new Page(null, 0, page, size);
            records = new PageView(recordVolumeService.selectByExample(example, pageObject));
        }else{
        	records = new PageView(new Page());
        }

        result.put("subject",recordTypeService.getTitle(recordSearchForm.getRtId(), "_volume"));

        result.put("years",  yearService.selectAll());
        result.put("deadlines", deadlineService.selectAll());
        result.put("departments", departmentService.selectAll());

        result.put("records", records);
        result.put("pages", records.showPages());

        if(isStore!=null&&isStore){
            model.addAttribute("datalists",recordVolumeService.selectIdsByExample(example));
        }

        return result;
    }


    /*@ResponseBod y
    @RequestMapping(
            value = "/create",
            method = RequestMethod.POST
    )
    public Map<String, Object> recordvolumecreate(@ModelAttribute("volumeCreateForm") RecordForm volumeCreateForm,
                                                  ModelMap model) {
        Map<String, Object> result = new HashMap<>();

        volumeCreateForm.setYear(yearService.checkAndCreate(volumeCreateForm.getYear()));
        volumeCreateForm.setDeadline(deadlineService.checkAndCreate(volumeCreateForm.getDeadline()));
        volumeCreateForm.setDepartment(departmentService.checkAndCreate(volumeCreateForm.getDepartment()));
        result.put("status", recordVolumeService.create(volumeCreateForm));

        return result;
    }*/

    @RequiresPermissions(value = {"buildvolume"})
    @ResponseBody
    @RequestMapping(
            value = "/apply",
            method = RequestMethod.POST
    )
    public Map<String, Object> apply(@ModelAttribute("volumeCreateForm") CreateVolumeForm volumeCreateForm,
                                     ModelMap model) {
        Map<String, Object> result = new HashMap<>();

        result.put("status", recordVolumeService.create(volumeCreateForm));

        return result;
    }
    @RequiresPermissions(value = {"buildvolume"})
    @ResponseBody
    @RequestMapping(
            value = "/edit",
            method = RequestMethod.POST
    )
    public Map<String, Object> edit(@ModelAttribute("volumeCreateForm") CreateVolumeForm volumeCreateForm,
                                     ModelMap model) {
        Map<String, Object> result = new HashMap<>();

        result.put("status", recordVolumeService.edit(volumeCreateForm));

        return result;
    }

    @RequiresPermissions(value = {"buildvolume"})
    @ResponseBody
    @RequestMapping(
            value = "/getFondsAndType",
            method = RequestMethod.GET
    )
    public Map<String, Object> getFondsAndType(@RequestParam(
            value = "fondsid",
            required = false
    ) String fondsid) {
        Map<String, Object> result = new HashMap<>();


        List<Fonds> fonds = fondsService.selectAll();
        result.put("fonds", fonds);
        if (StringUtils.isEmpty(fondsid)) {
            fondsid = fonds.get(0).getId();
        }
        result.put("recordtypes", recordTypeService.selectByFondsId(fondsid));

        return result;
    }

}


//~ Formatted by Jindent --- http://www.jindent.com
