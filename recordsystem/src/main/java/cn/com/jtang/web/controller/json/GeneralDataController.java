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
@Controller("jsonGeneralDataController")
@RequestMapping("/json/generaldata")
@SessionAttributes({"recordSearchForm"})
public class GeneralDataController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private GeneralDataService generalDataService;
    @Resource
    private LogService logService;

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
    public Map<String, Object> getGeneralData(@RequestParam(
            value = "tablename",
            required = false
    ) String tablename, ModelMap model) {


        Map<String, Object> result = new HashMap<>();
        result.put("generaldata",generalDataService.getGeneralData(tablename) );
        return result;

    }
    @RequiresAuthentication
    @ResponseBody
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/add",
            method = RequestMethod.POST
    )
    public Map<String, Object> addGeneralData(@RequestParam(
            value = "tablename",
            required = false
    ) String tablename,@RequestParam(
            value = "name",
            required = false
    ) String name, @RequestParam(
            value = "no",
            required = false
    ) String no,ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        result.put("generaldata",generalDataService.addGeneralData(tablename,name,no) );
    	logService.insert("在通用数据"+generalDataService.getIndexName(tablename)+"中添加了--"+name);
        return result;

    }

    @RequiresAuthentication
    @ResponseBody
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/delete",
            method = RequestMethod.POST
    )
    public Map<String, Object> deleteGeneralData(@RequestParam(
            value = "tablename",
            required = false
    ) String tablename,@RequestParam(
            value = "id",
            required = false
    ) int id, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        result.put("generaldata",generalDataService.deleteGeneralData(tablename,id) );
    	logService.insert("在通用数据"+generalDataService.getIndexName(tablename)+"中删除了--"+generalDataService.getGeneralDataById(tablename,id));
        return result;

    }

/*    @RequiresAuthentication
    @ResponseBody
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/sure",
            method = RequestMethod.POST
    )
    public Map<String, Object> sureGeneralData(@RequestParam(
            value = "tablename",
            required = false
    ) String tablename,@RequestParam(
            value = "id",
            required = false
    ) int id, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        result.put("generaldata",generalDataService.sureGeneralData(tablename,id) );
        //tablename =  tablename.substring(tablename.lastIndexOf("_"), tablename.length());
    	logService.insert("在通用数据"+RecordUtil.getChinese(tablename)+"中添加了"+generalDataService.getGeneralDataById(tablename,id));
        return result;

    }*/
    
    @RequestMapping(value = "/checkname", method = RequestMethod.POST)
    @ResponseBody
    public boolean checkname(
            @RequestParam(value = "name", required = true) String name) {

        boolean status = true;
        if (name != null && !"".equals(name)) {
        	if(name.equals("年度")||name.equals("部门")||name.equals("保管期限"))
        		return false;
            if (generalDataService.isNameExist(name)) {
                status = false;
            }
        }
        return status;

    }

    @RequiresAuthentication
    @ResponseBody
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/create",
            method = RequestMethod.POST
    )
    public Map<String, Object> createGeneralData(@RequestParam(
            value = "name",
            required = false
    ) String name, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        result.put("status",generalDataService.createGeneralData(name) );
        //tablename =  tablename.substring(tablename.lastIndexOf("_"), tablename.length());
        System.out.println(name);
    	logService.insert("创建了新的数据字典--"+name);
        return result;

    }
    @RequiresAuthentication
    @ResponseBody
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/deleteDictionary",
            method = RequestMethod.POST
    )
    public Map<String, Object> deleteGeneralData(@RequestParam(
            value = "indextable",
            required = false
    ) String indextable, ModelMap model) {
        Map<String, Object> result = new HashMap<>();
        String indextableName = generalDataService.deleteDictionary(indextable);
        if(indextableName!=null){
            result.put("status", 1);
            //tablename =  tablename.substring(tablename.lastIndexOf("_"), tablename.length());
        	logService.insert("创建了新的数据字典--"+indextableName);
        }
        return result;

    }
}


//~ Formatted by Jindent --- http://www.jindent.com
