package cn.com.jtang.web.controller.json;

import cn.com.jtang.po.*;
import cn.com.jtang.po.custom.RecordTree;
import cn.com.jtang.po.custom.RecordTypeTree;
import cn.com.jtang.service.*;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.CreateVolumeForm;
import cn.com.jtang.web.controller.form.LogSearchForm;
import cn.com.jtang.web.controller.form.RecordSearchForm;
import cn.com.jtang.web.controller.form.StationForm;
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
@Controller("jsonStationController")
@RequestMapping("/json/station")
public class StationController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private StationService stationService;
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
            method = RequestMethod.POST
    )
    public Map<String, Object> logSearchForm(
    		@ModelAttribute("stationForm") StationForm stationForm) {

        Map<String, Object> result = new HashMap<>();
        PageView stations = new PageView(stationService.selectByStationForm(stationForm));
        result.put("stations",stations );
        result.put("pages",stations.showPages() );
        return result;

    }
    /**
     * Method description userManage
     *
     * @param n
     * @param page
     * @param size
     */
    @RequiresAuthentication
    @ResponseBody
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/add",
            method = RequestMethod.POST
    )
    public Map<String, Object> add(
    		@ModelAttribute("title") String  title,
    		@ModelAttribute("content") String  content) {

        Map<String, Object> result = new HashMap<>();
        stationService.insert(title,content);
        logService.insert("发布了通知---"+title);
        result.put("status",1 );
        return result;

    }
    /**
     * Method description userManage
     *
     * @param n
     * @param page
     * @param size
     */
    @RequiresAuthentication
    @ResponseBody
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/delete",
            method = RequestMethod.POST
    )
    public Map<String, Object> delete(
    		@ModelAttribute("id") String  id) {

        Map<String, Object> result = new HashMap<>();
        try{
            logService.insert("撤销了通知---"+stationService.deleteByPrimaryKey(id));
            result.put("status",1 );
        }catch(Exception e){
        	e.printStackTrace();
        }
        return result;

    }
    /**
     * Method description userManage
     *
     * @param n
     * @param page
     * @param size
     */
    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/getOneStation",
            method = RequestMethod.POST
    )
    public Map<String, Object> getOneStation(
    		@ModelAttribute("id") String  id) {

        Map<String, Object> result = new HashMap<>();
        try{
            result.put("station",stationService.getOneStation(id) );
        }catch(Exception e){
        	e.printStackTrace();
        }
        return result;

    }
}


//~ Formatted by Jindent --- http://www.jindent.com
