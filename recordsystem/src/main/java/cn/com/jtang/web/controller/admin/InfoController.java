package cn.com.jtang.web.controller.admin;

import cn.com.jtang.service.DanymicService;
import cn.com.jtang.service.InfoService;
import cn.com.jtang.service.RecordService;
import cn.com.jtang.web.controller.form.InfoTypeForm;
import cn.com.jtang.web.controller.form.RecordForm;
import cn.com.jtang.web.controller.form.common.SearchForm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("infoController")
@RequestMapping("/info")
@SessionAttributes({
        "recordForm","userSearchForm", "stypeSearchForm", "ctypeSearchForm", "searchForm"
})
public class InfoController {
    @Value("${page.size}")
    private int PAGE_SIZE;

    @Resource
    private InfoService infoService;
    @Resource
    private RecordService recordService;
    @Resource
    private DanymicService danymicService;

    @RequestMapping(
            value = "/create",
            method = RequestMethod.POST
    )
    public String userCreate(@ModelAttribute("recordForm") InfoTypeForm recordForm, ModelMap model, HttpServletRequest request) throws IOException {
        /*MultipartHttpServletRequest mhs = (MultipartHttpServletRequest) request;
        List<MultipartFile> files = mhs.getFiles("resFile");*/

        /*RecordForm recordForm = (RecordForm)model.get("recordForm");
        infoTypeForm.setFonds(recordForm.getFonds());
        infoTypeForm.setRecordtype(recordForm.getRecordtype());
        infoTypeForm.setYear(recordForm.getYear());
        infoTypeForm.setDeadline(recordForm.getDeadline());
        infoTypeForm.setDepartment(recordForm.getDepartment());
        infoTypeForm.setCustomFields(recordForm.getCustomFields());
        infoTypeForm.setMode(recordForm.getMode());*/
        recordService.typeInfo(recordForm);

        model.addAttribute("info", "您的信息录入申请已提交，请耐心等候！");

        return "redirect:/document/reupload";
    }

    @RequestMapping(
            value = "/update",
            method = RequestMethod.POST
    )
    public String update(@ModelAttribute("recordForm") InfoTypeForm recordForm, ModelMap model, HttpServletRequest request) throws IOException {
        /*MultipartHttpServletRequest mhs = (MultipartHttpServletRequest) request;
        List<MultipartFile> files = mhs.getFiles("resFile");*/

        recordService.updateInfo(recordForm);

        model.addAttribute("info", "您的信息录入申请已提交，请耐心等候！");

        return "redirect:/record/manage";
    }

    @RequestMapping(
            value = "/content/search",
            method = RequestMethod.GET
    )
    public String contentSearch(ModelMap model) {

        model.addAttribute("searchForm", new SearchForm());

        return "index/info/content/search";
    }


}


//~ Formatted by Jindent --- http://www.jindent.com
