package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.Authority;
import cn.com.jtang.po.RecordTypeExample;
import cn.com.jtang.po.User;
import cn.com.jtang.service.FondsService;
import cn.com.jtang.service.PermissionService;
import cn.com.jtang.service.RecordTypeService;
import cn.com.jtang.service.ShiroUserService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.common.SearchForm;
import cn.com.jtang.web.controller.form.common.UserCreateForm;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Date;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller
@RequestMapping("/recordtype")
@SessionAttributes({
        "dataSearchForm", "userSearchForm", "stypeSearchForm", "ctypeSearchForm", "searchForm",
        "companySearchForm", "sensorSearchForm", "ctypes", "stypes", "currentdeviceTypeSensor", "warningviews",
        "keySearchForm", "logSearchForm", "navid"
})
public class RecordTypeController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private UserService userService;
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private FondsService fondsService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private PermissionService permissionService;



    /**
     * Method description deviceManage
     *
     * @param searchForm
     * @param sn
     * @param page
     * @param size
     * @param typeId
     * @param mode
     * @param redirectAttributes
     * @param model
     * @return String
     */
    @RequiresPermissions(value = {"createrecordtype","editrecordtype","deleterecordtype"},logical = Logical.OR)
    @RequestMapping(
            value = "/manage",
            method = RequestMethod.POST
    )
    public String deviceManage(@ModelAttribute("searchForm") SearchForm searchForm, @RequestParam(
            value = "sn",
            required = false
    ) Boolean sn, @RequestParam(
            value = "page",
            required = false
    ) Integer page, @RequestParam(
            value = "size",
            required = false
    ) Integer size, @RequestParam(
            value = "typeId",
            required = false
    ) String typeId, @RequestParam(
            value = "mode",
            required = false
    ) String mode, final RedirectAttributes redirectAttributes, ModelMap model, HttpSession session) {

        /*
         * String orderByClause = searchForm.getOrderByClause();
         * if (orderByClause == null || "".equals(orderByClause))
         *       searchForm.setOrderByClause("deviceid desc");
         * if (sn == null)
         *       searchForm.setOrderByClause("deviceid desc");
         * searchForm.setPage(page);
         * searchForm.setSize(size);
         *
         * model.put("deviceSearchForm", searchForm);
         *
         * String pageParam = "";
         * if (page != null && size != null) {
         *       pageParam = "&page=" + page + "&size=" + size;
         * }
         * if (typeId != null) {
         *       pageParam += "&typeId=" + typeId;
         * }
         * if (mode != null) {
         *       pageParam += "&mode=" + mode;
         * }
         *
         * return "redirect:/admin/appserver/manage?n=true" + pageParam;
         */
        searchForm.setPage(page);
        searchForm.setSize(size);

        String pageParam = "";

        if ((page != null) && (size != null)) {
            pageParam = "&page=" + page + "&size=" + size;
        }

        session.setAttribute("searchForm", searchForm);

        return "redirect:/recordtype/manage?n=true" + pageParam;
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
    @RequiresPermissions(value = {"createrecordtype","editrecordtype","deleterecordtype"},logical = Logical.OR)
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
        if (model.get("searchForm") == null) {
            model.addAttribute("searchForm", new SearchForm());
        }

        Subject currentUser = SecurityUtils.getSubject();
        RecordTypeExample recordTypeExample = new RecordTypeExample();
        RecordTypeExample.Criteria criteria = recordTypeExample.createCriteria();
        SearchForm searchForm = (SearchForm) model.get("searchForm");

        if ((n != null) && (searchForm != null)) {
            Date start = searchForm.getStarttime();
            Date end = searchForm.getEndtime();
            Date current = new Date(System.currentTimeMillis());
            String key = searchForm.getKey();
            String orderByClause = searchForm.getOrderByClause();

            if ((page == null) && (size == null)) {
                page = searchForm.getPage();
                size = searchForm.getSize();
            }

            if (start != null) {
                if (end == null) {
                    end = current;
                } else if (end.after(current)) {
                    end = current;
                }

                if (start.before(end)) {
                    criteria.andCreatetimeBetween(start, end);
                } else if (start.equals(end)) {
                    criteria.andCreatetimeEqualTo(start);
                }

                searchForm.setStarttime(start);
                searchForm.setEndtime(end);
            }

            if (!StringUtils.isEmpty(key)) {
                criteria.andNameLike("%" + key + "%");
            }

            if ((orderByClause != null) && !"".equals(orderByClause)) {
                recordTypeExample.setOrderByClause(orderByClause);
            }
        } else {
            searchForm = new SearchForm();

            String orderByClause = "recordtype.createtime desc";

            recordTypeExample.setOrderByClause(orderByClause);
            searchForm.setOrderByClause(orderByClause);
            model.addAttribute("searchForm", searchForm);
        }


        Page pageObject = new Page(null, 0, (page != null)
                ? page
                : 1, (size != null)
                ? size
                : PAGE_SIZE);
        if(permissionService.checkPermission("createrecordtype")){
        	model.addAttribute("createrecordtype","1");
        }else{
        	model.addAttribute("createrecordtype","-1");
        }
        
        model.addAttribute("recordTypePages", new PageView(recordTypeService.selectByExample(recordTypeExample, pageObject)));
        model.addAttribute("fonds", fondsService.selectAll());

        return "index/recordtype/manage";
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
