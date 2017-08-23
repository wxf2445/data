package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.FondsExample;
import cn.com.jtang.po.OutputOrder;
import cn.com.jtang.po.User;
import cn.com.jtang.po.export.Setting;
import cn.com.jtang.service.*;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.OutputSettingForm;
import cn.com.jtang.web.controller.form.common.SearchForm;
import cn.com.jtang.web.controller.form.common.UserCreateForm;
import com.alibaba.fastjson.JSONArray;
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
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller
@RequestMapping("/output")
@SessionAttributes({
        "searchForm"
})
public class OutputSettingController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private OutputOrderService outputOrderService;
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private FondsService fondsService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private RecordCategoryService recordCategoryService;
    @Resource
    private DanymicService danymicService;

    /*@RequiresPermissions(value = {"outputsetting"})
    @RequestMapping(value = "/setting/modify", method = RequestMethod.POST)
    public String settingmodify(
            @ModelAttribute(value = "outputSettingForm") OutputSettingForm setting,
            @RequestParam(value = "filename", required = true) String filename,
            @RequestParam(value = "format", required = true) String format,
            @RequestParam(value = "fonds", required = true) String fonds,
            @RequestParam(value = "cols", required = true) List<String> cols,
            @RequestParam(value = "colnames", required = true) List<String> colnames,
            final RedirectAttributes redirectAttributes, ModelMap model) {

        outputOrderService.modify(cols,setting);

        *//*List<Object> recordVolumes = danymicService.selectByCols(cols,tableName);
        JSONArray jsonArray = new JSONArray();
        jsonArray.addAll(recordVolumes);
        System.out.println(jsonArray);*//*

        return "redirect:/record/directory/outputsetting";

    }*/


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
    @RequiresPermissions(value = {"outputsetting"})
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

        FondsExample example = new FondsExample();
        FondsExample.Criteria criteria = example.createCriteria();
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

        model.addAttribute("fondspages", new PageView(fondsService.selectByExample(example, pageObject)));

        return "index/fonds/manage";
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
