package cn.com.jtang.web.controller.json;

import cn.com.jtang.po.Info;
import cn.com.jtang.po.RecordType;
import cn.com.jtang.po.Template;
import cn.com.jtang.service.*;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.ColSearchForm;
import cn.com.jtang.web.controller.form.template.TemplateCreateForm;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("jsonTemplateController")
@RequestMapping("/json/template")
@SessionAttributes({
        "deviceSearchForm", "dataSearchForm", "userSearchForm", "stypeSearchForm", "ctypeSearchForm", "searchForm"
})
public class TemplateController {
    @Value("${page.size}")
    private int PAGE_SIZE;

    @Resource
    private TemplateService templateService;
    @Resource
    private InfoService infoService;
    @Resource
    private RecordService recordService;
    @Resource
    private FondsService fondsService;
    @Resource
    private RecordTypeService recordTypeService;


    @RequiresPermissions(value = {"createtemplate"})
    @ResponseBody
    @RequestMapping(
            value = "/checkname",
            method = RequestMethod.POST
    )
    public boolean checkname(@RequestParam(value = "templatename", required = true) String templatename, ModelMap model) {

        boolean status = true;

        if (templateService.isExistByName(templatename)) {
            status = false;
        }

        return status;
    }

    @RequiresPermissions(value = {"edittemplate"})
    @ResponseBody
    @RequestMapping(
            value = "/checkeditname",
            method = RequestMethod.POST
    )
    public boolean checkeditname(@RequestParam(value = "templatename", required = true) String templatename,
                                 @RequestParam(value = "originname", required = true) String originname,
                                 ModelMap model) {
        boolean status = true;

        if (!originname.equals(templatename) && templateService.isExistByName(templatename)) {
            status = false;
        }

        return status;
    }

    @RequiresPermissions(value = {"createtemplate"})
    @ResponseBody
    @RequestMapping(
            value = "/create",
            method = RequestMethod.POST
    )
    public Map<String, Object> create(@ModelAttribute("templateCreateForm") TemplateCreateForm templateCreateForm, ModelMap model) {

        Map<String, Object> result = new HashMap<>();

        templateService.createAndInfo(templateCreateForm);

        result.put("status", true);

        return result;
    }

    @RequiresPermissions(value = {"createtemplate", "edittemplate", "deletetemplate"}, logical = Logical.OR)
    @ResponseBody
    @RequestMapping(
            value = "/hasContent",
            method = RequestMethod.POST
    )
    public Map<String, Object> hasContent(@RequestParam(
            value = "contentTableId",
            required = false
    ) String contentTableId,
                                          ModelMap model) {

        Map<String, Object> result = new HashMap<>();

        result.put("status", templateService.hasContent(contentTableId));

        return result;
    }

    @RequiresPermissions(value = {"deletetemplate"})
    @ResponseBody
    @RequestMapping(
            value = "/delete",
            method = RequestMethod.POST
    )
    public Map<String, Object> delete(@RequestParam(
            value = "contentTableId",
            required = false
    ) String contentTableId,
                                      ModelMap model) {

        Map<String, Object> result = new HashMap<>();
        templateService.forceDeleteByPrimaryKey(contentTableId);
        result.put("status", true);

        return result;
    }

    @RequiresPermissions(value = {"edittemplate"})
    @ResponseBody
    @RequestMapping(
            value = "/edit",
            method = RequestMethod.GET
    )
    public Map<String, Object> edit(@RequestParam(
            value = "contentTableId",
            required = false
    ) String contentTableId,
                                    ModelMap model) {

        Map<String, Object> result = new HashMap<>();

        Template template = templateService.selectByPrimaryKey(contentTableId);
        RecordType recordType = recordTypeService.selectByPrimaryKey(template.getRecordtypeid());
        result.put("template", template);
        result.put("infos", infoService.selectRealByTempleId(template.getTableid()));
        result.put("recordtype", recordType);
        result.put("fonds", fondsService.selectByPrimaryKey(recordType.getFondsid()));

        return result;
    }

    @RequiresPermissions(value = {"edittemplate"})
    @ResponseBody
    @RequestMapping(
            value = "/edit",
            method = RequestMethod.POST
    )
    public Map<String, Object> editPost(@ModelAttribute("templateCreateForm") TemplateCreateForm templateCreateForm,
                                        @RequestParam(value = "tableid", required = true) String tableid, ModelMap model) {

        Map<String, Object> result = new HashMap<>();

        result.put("status", templateService.edit(templateCreateForm, tableid));

        return result;
    }

    @RequiresPermissions(value = {"viewteminfo"})
    @ResponseBody
    @RequestMapping(
            value = "/searchContent",
            method = RequestMethod.POST
    )
    public Map<String, Object> searchContent(@ModelAttribute("colSearchForm") ColSearchForm colSearchForm, RedirectAttributes redirectAttributes, ModelMap model) {

        Map<String, Object> result = recordService.selectVolumeAndRecordContent(colSearchForm);

        return result;
    }

    @RequiresPermissions(value = {"viewteminfo"})
    @ResponseBody
    @RequestMapping(
            value = "/searchContentByOneColumn",
            method = RequestMethod.POST
    )
    public Map<String, Object> searchContentByOneColumn(@ModelAttribute("colSearchForm") ColSearchForm colSearchForm, ModelMap model) {

        Map<String, Object> result = new HashMap<>();

        result.put("recordPage", recordService.selectRecordContent(colSearchForm));


        return result;
    }

    @RequiresPermissions(value = {"viewteminfo"})
    @ResponseBody
    @RequestMapping(
            value = "/getColumnAll",
            method = RequestMethod.GET
    )
    public Map<String, Object> getColumnAll(@RequestParam(
            value = "templateid",
            required = true
    ) String templateid, ModelMap model) {

        Map<String, Object> result = new HashMap<>();

        List<Info> infos = null;
        if (templateid.contains(RecordUtil.RECORD)) {
            infos = infoService.selectByTempleId(templateid);
        } else if (templateid.contains(RecordUtil.PIECE)) {
            infos = infoService.selectByPieceId(templateid);
        }

        result.put("infos", infos);
        return result;
    }

    @RequiresPermissions(value = {"viewteminfo"})
    @ResponseBody
    @RequestMapping(
            value = "/getcolumn",
            method = RequestMethod.GET
    )
    public Map<String, Object> manage(@RequestParam(
            value = "templateid",
            required = true
    ) String templateid, ModelMap model) {

        Map<String, Object> result = new HashMap<>();

        List<Info> infos = null;
        if (templateid.contains(RecordUtil.RECORD)) {
            infos = infoService.selectRealByTempleId(templateid);
        } else if (templateid.contains(RecordUtil.PIECE)) {
            infos = infoService.selectRealByPieceId(templateid);
        }

        result.put("infos", infos);
        return result;
    }

    @RequiresPermissions(value = {"viewteminfo"})
    @ResponseBody
    @RequestMapping(
            value = "/getAllTemplate",
            method = RequestMethod.GET
    )
    public Map<String, Object> getAllcolumn() {

        Map<String, Object> result = new HashMap<>();

        result.put("templates", templateService.selectMultiSelectTemplate());

        return result;
    }

    @RequiresPermissions(value = {"viewteminfo"})
    @ResponseBody
    @RequestMapping(
            value = "/getUnionTemCol",
            method = RequestMethod.GET
    )
    public Map<String, Object> getUnionTemCol() {

        Map<String, Object> result = new HashMap<>();

        result.put("templates", infoService.selectAllTemCol());

        return result;
    }

}


//~ Formatted by Jindent --- http://www.jindent.com
