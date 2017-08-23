package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.Fonds;
import cn.com.jtang.po.RecordType;
import cn.com.jtang.po.User;
import cn.com.jtang.po.custom.FondsTree;
import cn.com.jtang.po.custom.RecordTree;
import cn.com.jtang.service.*;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.RecordForm;
import cn.com.jtang.web.controller.form.RecordSearchForm;
import cn.com.jtang.web.controller.form.common.SearchForm;
import cn.com.jtang.web.controller.form.common.UserCreateForm;

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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller
@RequestMapping("/generaldata")
@SessionAttributes({
        "recordSearchForm", "buildRecordSearchForm","recordForm"
})
public class GeneralDataController {

    @Resource
    private GeneralDataService	generalDataService;

    @Resource
    private FondsService	fondsService;
    @Resource
    private RecordTypeService	recordTypeService;
    

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


        searchForm.setPage(page);
        searchForm.setSize(size);

        String pageParam = "";

        if ((page != null) && (size != null)) {
            pageParam = "&page=" + page + "&size=" + size;
        }

        session.setAttribute("searchForm", searchForm);

        return "redirect:/generaldata/manage?n=true" + pageParam;
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
    @RequestMapping(
            value = "/manage",
            method = RequestMethod.GET
    )
    public String userManage( /*@RequestParam(
            value = "tablename",
            required = false
    ) String tablename,*/ModelMap model) {
    	
        List<Fonds> fondsList = fondsService.selectAll();

        RecordTree tree = new RecordTree();
        List<FondsTree> fondsTrees = new ArrayList<>();
        FondsTree fondsTree = null;
        for (Fonds fonds : fondsList) {
            fondsTree = new FondsTree();
            fondsTree.setFonds(fonds);
            fondsTree.setRecordTypes(recordTypeService.selectByFondsId(fonds.getId()));
            fondsTrees.add(fondsTree);
        }

        tree.setFondss(fondsTrees);
        model.addAttribute("recordTree", tree);


        return "index/generaldata/manage";
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
