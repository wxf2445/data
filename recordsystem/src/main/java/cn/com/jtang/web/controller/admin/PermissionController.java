package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.InsertExample;
import cn.com.jtang.po.RoleExample;
import cn.com.jtang.po.User;
import cn.com.jtang.po.UserExample;
import cn.com.jtang.service.PermissionService;
import cn.com.jtang.service.RoleService;
import cn.com.jtang.service.ShiroUserService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.common.SearchForm;
import cn.com.jtang.web.controller.form.common.UserCreateForm;
import org.apache.shiro.SecurityUtils;
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
@RequestMapping("/permission")
@SessionAttributes({
        "searchForm"
})
public class PermissionController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private RoleService roleService;

    @RequiresAuthentication
    @RequiresPermissions(value={"permissionmanage"})
    @RequestMapping(
            value = "/manage",
            method = RequestMethod.GET
    )
    public String permissionManage(@RequestParam(
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
        RoleExample roleExample = new RoleExample();
        RoleExample.Criteria criteria = roleExample.createCriteria();
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

            if ((key != null) && !"".equals(key)) {
                criteria.andNameLike("%" + key + "%");
            }

            if ((orderByClause != null) && !"".equals(orderByClause)) {
                roleExample.setOrderByClause(orderByClause);
            }
        } else {
            searchForm = new SearchForm();

            String orderByClause = "name desc";

            roleExample.setOrderByClause(orderByClause);
            searchForm.setOrderByClause(orderByClause);
            model.addAttribute("searchForm", searchForm);
        }

        Page pageObject = new Page(null, 0, (page != null) ? page : 1, (size != null) ? size : PAGE_SIZE);

        model.addAttribute("rolepages", new PageView(roleService.selectByExample(roleExample, pageObject)));

        return "index/role/manage";
    }

    @RequiresPermissions(value={"permissionmanage"})
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

        searchForm.setPage(page);
        searchForm.setSize(size);

        String pageParam = "";

        if ((page != null) && (size != null)) {
            pageParam = "&page=" + page + "&size=" + size;
        }

        session.setAttribute("searchForm", searchForm);

        return "redirect:/permission/manage?n=true" + pageParam;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
