package cn.com.jtang.web.controller.json;

import cn.com.jtang.service.*;
import cn.com.jtang.web.controller.form.common.UserCreateForm;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("jsonDocumentController")
@RequestMapping("/json/document")
public class DocumentController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private UserService userService;
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private FondsService fondsService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private RecordCategoryService recordCategoryService;
    @Resource
    private RecordService recordService;
    @Resource
    private YearService yearService;
    @Resource
    private DeadlineService deadlineService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    private DocumentService documentService;

    @ResponseBody
    @RequestMapping(
            value = "/get",
            method = RequestMethod.GET
    )
    public Map<String, Object> get(@RequestParam(
            value = "recordId",
            required = true
    ) String recordId,@RequestParam(
            value = "fondsId",
            required = true
    ) String fondsId, @RequestParam(
            value = "recordTypeId",
            required = true
    ) String recordTypeId,  ModelMap model) {

        Map<String, Object> result = new HashMap<>();

        result.put("documents", documentService.selectByRecord(recordId,fondsId,recordTypeId));

        return result;
    }

    @RequestMapping(value = "/checkname", method = RequestMethod.POST)
    @ResponseBody
    public boolean checkname(
            @RequestParam(value = "typename", required = true) String typename) {

        boolean status = true;
        if (typename != null && !"".equals(typename)) {
            if (fondsService.isNameExist(typename)) {
                status = false;
            }
        }
        return status;

    }

    @RequestMapping(value = "/checkno", method = RequestMethod.POST)
    @ResponseBody
    public boolean checkno(
            @RequestParam(value = "fondsno", required = true) String fondsno) {

        boolean status = true;
        if (fondsno != null && !"".equals(fondsno)) {
            if (fondsService.isNoExist(fondsno)) {
                status = false;
            }
        }
        return status;

    }

/*    @RequestMapping(value = "/edit/checkname", method = RequestMethod.POST)
    @ResponseBody
    public boolean editcheckname(
            @RequestParam(value = "typename", required = true) String typename,
            @RequestParam(value = "originalname", required = true) String originalname) {

        boolean status = true;
        if (!StringUtils.isEmpty(originalname) && !originalname.equals(typename)) {
            if (recordTypeService.isExist(typename)) {
                status = false;
            }
        }
        return status;

    }*/






}


//~ Formatted by Jindent --- http://www.jindent.com
