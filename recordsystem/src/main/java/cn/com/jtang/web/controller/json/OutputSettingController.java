package cn.com.jtang.web.controller.json;

import cn.com.jtang.po.DefaultExport;
import cn.com.jtang.po.FondsExample;
import cn.com.jtang.po.OutputOrder;
import cn.com.jtang.service.*;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.OutputSettingForm;
import cn.com.jtang.web.controller.form.common.SearchForm;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("jsonOutPutController")
@RequestMapping("/json/outputsetting")
@SessionAttributes({
        "searchForm"
})
public class OutputSettingController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private OutputOrderService outputOrderService;
    @Resource
    private ExportService exportService;

    @ResponseBody
    @RequestMapping(
            value = "/isExist",
            method = RequestMethod.GET
    )
    public boolean getRecordColumns(@RequestParam(
            value = "recordType",
            required = true
    ) String recordType, @RequestParam(
            value = "category",
            required = true
    ) String category) {

        return outputOrderService.isExist(recordType,category);
    }
    @ResponseBody
    @RequestMapping(
            value = "/defaultStyle",
            method = RequestMethod.POST
    )
    public Map<String,Object> defaultStyle() {

        Map<String,Object> result = new HashMap<>();
        result.put("defaultStyle",exportService.getDefaultStyle());
        return result;
    }
    @ResponseBody
    @RequiresPermissions(value = {"outputsetting"})
    @RequestMapping(value = "/setting/modify", method = RequestMethod.POST)
    public Map<String,Object> settingmodify(
            @ModelAttribute(value = "outputSettingForm") OutputSettingForm setting,
            @RequestParam(value = "filename", required = true) String filename,
            @RequestParam(value = "format", required = true) String format,
            @RequestParam(value = "fonds", required = true) String fonds,
            @RequestParam(value = "cols", required = true) List<String> cols,
            @RequestParam(value = "colnames", required = true) List<String> colnames,
            final RedirectAttributes redirectAttributes, ModelMap model) {

        Map<String,Object> result = new HashMap<>();
         result.put("status",outputOrderService.modify(cols,setting));

        /*List<Object> recordVolumes = danymicService.selectByCols(cols,tableName);
        JSONArray jsonArray = new JSONArray();
        jsonArray.addAll(recordVolumes);
        System.out.println(jsonArray);*/

        return result;

    }
    @ResponseBody
    @RequiresPermissions(value = {"outputsetting"})
    @RequestMapping(value = "/setting/setDefault", method = RequestMethod.POST)
    public Map<String,Object> setDefault(
            @ModelAttribute(value = "outputSettingForm") DefaultExport setting,
            @RequestParam(value = "filename", required = true) String filename,
            @RequestParam(value = "format", required = true) String format,
            final RedirectAttributes redirectAttributes, ModelMap model) {

        Map<String,Object> result = new HashMap<>();

        boolean status = exportService.updateDefaultStyle(setting)==1?true:false;
        result.put("status",status);
        return result;

    }


}


//~ Formatted by Jindent --- http://www.jindent.com
