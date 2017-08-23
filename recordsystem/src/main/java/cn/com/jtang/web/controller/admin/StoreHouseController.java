package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.StoreHouseExample;
import cn.com.jtang.service.*;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.common.SearchForm;
import org.apache.shiro.authz.annotation.Logical;
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
import java.util.Date;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller
@RequestMapping("/storehouse")
@SessionAttributes({
        "searchForm"
})
public class StoreHouseController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private StoreHouseService storeHouseService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private RecordCategoryService recordCategoryService;
    @Resource
    private YearService yearService;

    /**
     * Method description delete
     *
     * @param storehouseid
     * @param redirectAttributes
     * @param model
     * @return String
     */
    @RequiresAuthentication
    @RequiresPermissions(value = {"deletestorehouse"})
    @RequestMapping(
            value = "/delete",
            method = RequestMethod.GET
    )
    public String delete(@RequestParam(
            value = "storehouseid",
            required = true
    ) String storehouseid, RedirectAttributes redirectAttributes, ModelMap model) {

        // ���Ի����³���ɾ��
        redirectAttributes.addFlashAttribute("deletestatus", storeHouseService.deleteByPrimaryKey(storehouseid));

        // ��ʵ��������־λ
        // redirectAttributes.addFlashAttribute("deletestatus", storehouseService.delete(storehouseid));

        return "redirect:/storehouse/manage";
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
    @RequiresAuthentication
    @RequiresPermissions(value = {"createstorehouse","editstorehouse","deletestorehouse"},logical = Logical.OR)
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

        return "redirect:/StoreHouse/manage?n=true" + pageParam;
    }

    /**
     * Method description storehouseCreate
     *
     * @param storehouseCreateForm
     * @param sn
     * @param page
     * @param size
     * @param typeId
     * @param mode
     * @param redirectAttributes
     * @param model
     * @return String
     */
    @RequiresPermissions(value = {"createstorehouse"})
    @RequestMapping(
            value = "/create",
            method = RequestMethod.POST
    )
    public String storehouseCreate(@ModelAttribute("storehouseCreateForm") SearchForm storehouseCreateForm, @RequestParam(
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
        //redirectAttributes.addFlashAttribute("createstatus", storeHouseService(storehouseCreateForm, true));

        return "redirect:/storehouse/manage?n=true";
    }



    @RequiresPermissions(value = {"editstorehouse"})
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String storehouseEdit(
            @ModelAttribute("storehouseCreateForm") SearchForm storehouseCreateForm,
            @RequestParam(value = "storehouseid", required = false) String storehouseid,
            @RequestParam(value = "mode", required = false) String mode,
            final RedirectAttributes redirectAttributes, ModelMap model) {

           // redirectAttributes.addFlashAttribute("editSuccess", storehouseService.editstorehouse(storehouseid, storehouseCreateForm));

        return "redirect:/storehouse/manage?n=true";

    }


    /**
     * Method description storehouseManage
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
    @RequiresPermissions(value = {"createstorehouse","editstorehouse","deletestorehouse"},logical = Logical.OR)
    @RequestMapping(
            value = "/manage",
            method = RequestMethod.GET
    )
    public String storehouseManage(@RequestParam(
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

        StoreHouseExample example = new StoreHouseExample();
        StoreHouseExample.Criteria criteria = example.createCriteria();
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
                criteria.andNameLike("%" + key + "%");
            }

            if ((orderByClause != null) && !"".equals(orderByClause)) {
                example.setOrderByClause(orderByClause);
            }
        } else {
            searchForm = new SearchForm();

            String orderByClause = "createtime desc";

            example.setOrderByClause(orderByClause);
            searchForm.setOrderByClause(orderByClause);
            model.addAttribute("searchForm", searchForm);
        }


        Page pageObject = new Page(null, 0, (page != null)
                ? page
                : 1, (size != null)
                ? size
                : PAGE_SIZE);

        model.addAttribute("StoreHousepages", new PageView(storeHouseService.selectByExample(example, pageObject)));

        return "index/storehouse/manage";
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
