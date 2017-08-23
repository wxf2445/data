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
@Controller("jsonLogController")
@RequestMapping("/json/log")
public class LogController {
    @Value("${page.size}")
    private int PAGE_SIZE;
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
    		@ModelAttribute("logSearchForm") LogSearchForm logSearchForm) {

        Map<String, Object> result = new HashMap<>();
        PageView logs = new PageView(logService.selectByLogSearchForm(logSearchForm));
        result.put("logs",logs );
        result.put("pages",logs.showPages() );
        return result;

    }
    

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/checklogin",
            method = RequestMethod.POST
    )
    public Map<String, Object> checklogin() {

        Map<String, Object> result = new HashMap<>();
        return result;

    }
}


//~ Formatted by Jindent --- http://www.jindent.com
