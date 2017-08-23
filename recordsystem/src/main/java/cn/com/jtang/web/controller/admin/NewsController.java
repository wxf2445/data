package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.User;
import cn.com.jtang.po.UserExample;
import cn.com.jtang.service.ShiroUserService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.common.SearchForm;
import cn.com.jtang.web.controller.form.common.UserCreateForm;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
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
@RequestMapping("/news")
@SessionAttributes({
        "dataSearchForm", "userSearchForm", "stypeSearchForm", "ctypeSearchForm", "searchForm",
        "companySearchForm", "sensorSearchForm", "ctypes", "stypes", "currentdeviceTypeSensor", "warningviews",
        "keySearchForm", "logSearchForm", "navid"
})
public class NewsController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private UserService userService;
    @Resource
    private ShiroUserService shiroUserService;


    /**
     * Method description delete
     *
     * @param userid
     * @param redirectAttributes
     * @param model
     * @return String
     */
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/delete",
            method = RequestMethod.GET
    )
    public String delete(@RequestParam(
            value = "userid",
            required = true
    ) String userid, RedirectAttributes redirectAttributes, ModelMap model) {

        // ���Ի����³���ɾ��
        redirectAttributes.addFlashAttribute("deletestatus", userService.deleteByPrimaryKey(userid));

        // ��ʵ��������־λ
        // redirectAttributes.addFlashAttribute("deletestatus", userService.delete(userid));

        return "redirect:/user/manage";
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
    @RequiresRoles(value = {"SUPER ADMIN"})
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

        return "redirect:/user/manage?n=true" + pageParam;
    }

    /**
     * Method description userCreate
     *
     * @param userCreateForm
     * @param sn
     * @param page
     * @param size
     * @param typeId
     * @param mode
     * @param redirectAttributes
     * @param model
     * @return String
     */
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/create",
            method = RequestMethod.POST
    )
    public String userCreate(@ModelAttribute("userCreateForm") UserCreateForm userCreateForm, @RequestParam(
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
    ) String mode, final RedirectAttributes redirectAttributes, ModelMap model) {
        redirectAttributes.addFlashAttribute("createstatus", userService.createUser(userCreateForm, true));

        return "redirect:/user/manage?n=true";
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
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String userEdit(
            @ModelAttribute("userCreateForm") UserCreateForm userCreateForm,
            @RequestParam(value = "userid", required = false) String userid,
            @RequestParam(value = "mode", required = false) String mode,
            final RedirectAttributes redirectAttributes, ModelMap model) {

        try {
            redirectAttributes.addFlashAttribute("editSuccess", userService.editUser(userid, userCreateForm));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/user/manage?n=true";

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
        if (model.get("searchForm") == null) {
            model.addAttribute("searchForm", new SearchForm());
        }

        Subject currentUser = SecurityUtils.getSubject();
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        SearchForm searchForm = (SearchForm) model.get("searchForm");

        criteria.andIsdeleteEqualTo(false);

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
                criteria.andUsernameLike("%" + key + "%");
            }

            if ((orderByClause != null) && !"".equals(orderByClause)) {
                userExample.setOrderByClause(orderByClause);
            }
        } else {
            searchForm = new SearchForm();

            String orderByClause = "createtime desc";

            userExample.setOrderByClause(orderByClause);
            searchForm.setOrderByClause(orderByClause);
            model.addAttribute("searchForm", searchForm);
        }

        if (!currentUser.hasRole("SUPER ADMIN")) {
            return "redirect:/user/info";
        }

        Page pageObject = new Page(null, 0, (page != null)
                ? page
                : 1, (size != null)
                ? size
                : PAGE_SIZE);

        model.addAttribute("userpages", new PageView(userService.selectByExample(userExample, pageObject)));

        return "index/user/manage";
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
