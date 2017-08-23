package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.UserGroupExample;
import cn.com.jtang.service.UserGroupService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.common.SearchForm;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
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
@RequestMapping("/usergroup")
@SessionAttributes({
        "deviceSearchForm"
})
public class UserGroupController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private UserGroupService userGroupService;

    /**
     * Method description delete
     *
     * @param usergroupid
     * @param redirectAttributes
     * @param model
     * @return String
     */
    @RequiresPermissions(value = {"deleteusergroup"})
    @RequestMapping(
            value = "/delete",
            method = RequestMethod.GET
    )
    public String delete(@RequestParam(
            value = "usergroupid",
            required = true
    ) String usergroupid, RedirectAttributes redirectAttributes, ModelMap model) {

        // ���Ի����³���ɾ��
        redirectAttributes.addFlashAttribute("deletestatus", userGroupService.deleteByPrimaryKey(usergroupid));

        // ��ʵ��������־λ
        // redirectAttributes.addFlashAttribute("deletestatus", usergroupService.delete(usergroupid));

        return "redirect:/usergroup/manage";
    }

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
    @RequiresPermissions(value = {"deleteusergroup","createusergroup","editusergroup"},logical = Logical.OR)
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

        return "redirect:/usergroup/manage?n=true" + pageParam;
    }






    /**
     * Method description usergroupManage
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
    @RequiresPermissions(value = {"deleteusergroup","createusergroup","editusergroup"},logical = Logical.OR)
    @RequestMapping(
            value = "/manage",
            method = RequestMethod.GET
    )
    public String usergroupManage(@RequestParam(
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

        UserGroupExample usergroupExample = new UserGroupExample();
        UserGroupExample.Criteria criteria = usergroupExample.createCriteria();
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

            if ((key != null) && !"".equals(key)) {
                criteria.andGroupnameLike("%" + key + "%");
            }

            if ((orderByClause != null) && !"".equals(orderByClause)) {
                usergroupExample.setOrderByClause(orderByClause);
            }
        } else {
            searchForm = new SearchForm();

            String orderByClause = "createtime desc";

            usergroupExample.setOrderByClause(orderByClause);
            searchForm.setOrderByClause(orderByClause);
            model.addAttribute("searchForm", searchForm);
        }

        Page pageObject = new Page(null, 0, (page != null)
                ? page
                : 1, (size != null)
                ? size
                : PAGE_SIZE);

        model.addAttribute("usergrouppages", new PageView(userGroupService.selectByExample(usergroupExample, pageObject)));

        return "index/usergroup/manage";
    }

    /**
     * Method description view
     *
     * @param usergroupid
     * @return usergroupView
     */
/*    @RequestMapping(
            value = "/create_table",
            method = RequestMethod.GET
    )
    public String  createTable(@RequestParam(
            value = "str",
            required = true
    ) String str,@RequestParam(
            value = "fondNo",
            required = true
    ) String fondNo,@RequestParam(
            value = "recordType",
            required = true
    ) String recordType,final RedirectAttributes redirectAttributes, ModelMap model) {

    	CreateTable ct = new CreateTable(fondNo,recordType,str);
    	if(usergroupService.createTable(ct)==1)
    		redirectAttributes.addFlashAttribute("info", "success");
    	else
    		redirectAttributes.addFlashAttribute("info", "fail");
        return "redirect:/usergroup/manage?n=true";
    }*/
}


//~ Formatted by Jindent --- http://www.jindent.com
