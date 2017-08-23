package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.*;
import cn.com.jtang.service.*;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.RecordSearchForm;
import cn.com.jtang.web.controller.form.common.SearchForm;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("templateController")
@RequestMapping("/template")
@SessionAttributes({
        "recordSearchForm"
})
public class TemplateController {
    @Value("${page.size}")
    private int PAGE_SIZE;

    @Resource
    private TemplateService templateService;
    @Resource
    private FondsService fondsService;
    @Resource
    private RecordTypeService recordTypeService;


    @RequiresPermissions(value = {"createtemplate","edittemplate","deletetemplate"},logical = Logical.OR)
    @RequestMapping(
            value = "/manage",
            method = RequestMethod.GET
    )
    public String manage(@RequestParam(
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
        if (model.get("recordSearchForm") == null) {
            model.addAttribute("recordSearchForm", new RecordSearchForm());
        }

        TemplateExample example = new TemplateExample();
        TemplateExample.Criteria criteria = example.createCriteria();

        RecordSearchForm searchForm = (RecordSearchForm) model.get("recordSearchForm");



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
            searchForm = new RecordSearchForm();

            String orderByClause = "createtime desc";

            example.setOrderByClause(orderByClause);
            searchForm.setOrderByClause(orderByClause);

            model.addAttribute("recordSearchForm", searchForm);
        }

        Page pageObject = new Page(null, 0, (page != null)
                ? page
                : 1, (size != null)
                ? size
                : PAGE_SIZE);
        List<Fonds> fondss = fondsService.selectHasRecordType();
        if(!fondss.isEmpty()){
            String fondsId = !StringUtils.isEmpty(searchForm.getFondsId())?searchForm.getFondsId():fondss.get(0).getId();
            searchForm.setFondsId(fondsId);
            List<RecordType> recordTypes = recordTypeService.selectByFondsId(fondsId);

            String recordTypeId = !StringUtils.isEmpty(searchForm.getRtId())?searchForm.getRtId():recordTypes.isEmpty()?"":recordTypes.get(0).getId();
            searchForm.setRtId(recordTypeId);
            criteria.andRecordtypeidEqualTo(recordTypeId);



            model.addAttribute("fondss",fondss);
            model.addAttribute("recordTypes",recordTypes);

            model.addAttribute("templatePages", new PageView(templateService.selectByExample(example, pageObject)));
        }else{
            model.addAttribute("templatePages", new PageView(pageObject));
            model.addAttribute("canCreateTemplate",false);
        }


        return "/index/template/manage";
    }
    @RequiresPermissions(value = {"createtemplate","edittemplate","deletetemplate"},logical = Logical.OR)
    @RequestMapping(
            value = "/manage",
            method = RequestMethod.POST
    )
    public String managePost(@ModelAttribute("recordSearchForm")RecordSearchForm recordSearchForm, ModelMap model) {
        return "redirect:/template/manage?n=true";
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
