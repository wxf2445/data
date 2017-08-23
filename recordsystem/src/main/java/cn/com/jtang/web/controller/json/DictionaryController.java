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

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
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
@Controller("jsonDictionaryController")
@RequestMapping("/json/dictionary")
public class DictionaryController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private DictionaryService dictionaryService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private GeneralDataService generalDataService;
    @Resource
    private RuleService ruleService;

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
    @ResponseBody
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/manage",
            method = RequestMethod.GET
    )
    public Map<String, Object> userManage(@RequestParam(
            value = "recordtypeid",
            required = true
    ) String recordtypeid, @RequestParam(
            value = "tabletype",
            required = true
    ) String tabletype, ModelMap model) {


        Map<String, Object> result = new HashMap<>();
        List<TableField> list = new ArrayList<>();
        list = dictionaryService.getDictionary(recordtypeid,tabletype);
/*        list.add(new TableField(RecordUtil.PEOPLE,RecordUtil.CHINESE_PEOPLE,RecordUtil.PEOPLE_LENGTH));
        list.add(new TableField(RecordUtil.SUBJECT,RecordUtil.CHINESE_SUBJECT,RecordUtil.SUBJECT_LENGTH));
        list.add(new TableField(RecordUtil.YEAR,RecordUtil.CHINESE_YEAR,RecordUtil.YEAR_LENGTH));
        list.add(new TableField(RecordUtil.DEPARTMENT,RecordUtil.CHINESE_DEPARTMENT,RecordUtil.DEPARTMENT_LENGTH));
        list.add(new TableField(RecordUtil.DEADLINE,RecordUtil.CHINESE_DEADLINE,RecordUtil.DEADLINE_LENGTH));*/
        result.put("tablefields",list );
        result.put("rule",ruleService.getChineseRule(recordtypeid,tabletype) );
        return result;

    }
    @RequiresAuthentication
    @ResponseBody
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/addField",
            method = RequestMethod.POST
    )
    public Map<String, Object> addField(@RequestParam(
            value = "recordtypeid",
            required = true
    ) String recordtypeid, @RequestParam(
            value = "tabletype",
            required = true
    ) String tabletype,@RequestParam(
            value = "fieldName",
            required = true
    ) String fieldName,@RequestParam(
            value = "length",
            required = true
    ) String length, ModelMap model) {

        Map<String, Object> result = new HashMap<>();
        List<TableField> list = new ArrayList<>();
        String tableName = recordTypeService.selectByPrimaryKey(recordtypeid).getRecordtable().replace(RecordUtil.RECORD, tabletype);
        list = dictionaryService.addField(recordtypeid,tabletype,fieldName,length,tableName);
        result.put("tablefields",list );
        result.put("rule",ruleService.getChineseRule(recordtypeid,tabletype) );
        return result;

    }
    
    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/indextables",
            method = RequestMethod.GET
    )
    public Map<String, Object> getField(ModelMap model) {

        Map<String, Object> result = new HashMap<>();
        result.put("indextables",generalDataService.getIndexTables() );
        return result;

    }
}


//~ Formatted by Jindent --- http://www.jindent.com
