package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.Fonds;
import cn.com.jtang.po.RecordType;
import cn.com.jtang.service.*;
import cn.com.jtang.service.impl.ExportServiceImpl.CountAndNums;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.web.controller.form.InfoTypeForm;

import com.alibaba.fastjson.JSONObject;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller
@RequestMapping("/document")
@SessionAttributes({
        "dataSearchForm", "userSearchForm", "stypeSearchForm", "ctypeSearchForm", "searchForm",
        "companySearchForm", "sensorSearchForm", "ctypes", "stypes", "currentdeviceTypeSensor", "warningviews",
        "keySearchForm", "logSearchForm", "navid", "recordForm"
})
public class DocumentController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Value("${fileserverpath}")
    private String ROOT_PATH;
    @Resource
    private RuleService ruleService;
    @Resource
    private DanymicService danymicService;
    @Resource
    private FondsService fondsService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private FileService fileService;
    @Resource
    private RecordService recordService;
    @Resource
    private DocumentService documentService;
    @Resource
    private YearService yearService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    private DeadlineService deadlineService;

    private Map<String, Map<String, String>> pathMap = new HashMap<>();

    /*@ResponseBody
    @RequiresAuthentication
    @RequestMapping(
            value = "/previewupload",
            method = RequestMethod.POST
    )
    public Map userManage(*//*@RequestParam(
            value = "temppath",
            required = true
    ) String temppath,*//* *//*@RequestParam(
            value = "filename",
            required = true
    ) String filename, *//*HttpServletRequest request, ModelMap model, HttpSession session) throws IOException {
        MultipartHttpServletRequest mhs = (MultipartHttpServletRequest) request;
        List<MultipartFile> files = mhs.getFiles("Filedata");

        String rHost = request.getRemoteHost();
        System.out.println(rHost);

        Map<String,Object> result = new HashMap<>();
        if (files != null && files.size() > 0) {
            for (MultipartFile file : files) {
                    String filename = file.getOriginalFilename();
                    String suffix = filename.substring(filename.lastIndexOf(".") + 1);
                    String resourcePath = "";
                    String path = "";
                    if (pathMap.containsKey(rHost)) {
                        Map map = pathMap.get(rHost);
                        boolean status = true;
                        if (map.containsKey(filename)) {
                            status = false;
                            resourcePath = (String) map.get(filename);
                            path = ROOT_PATH + resourcePath;
                            if (!new File(ROOT_PATH + resourcePath).exists()) {
                                map.remove(filename);
                            }
                        }
                        if (status) {
                            path = ROOT_PATH + "tempfile/" + IDGenerator.generator() + "/pretemp";
                            resourcePath = fileService.writeAllFile(file.getInputStream(), path, suffix).substring(ROOT_PATH.length());
                            map.put(filename, resourcePath);
                        }
                    } else {
                        System.out.println(file.getOriginalFilename());
                        Map<String, String> map = new HashMap<>();
                        pathMap.put(request.getRemoteHost(), map);

                        path = ROOT_PATH +"tempfile/" + IDGenerator.generator() + "/pretemp";
                        resourcePath = fileService.writeAllFile(file.getInputStream(), path, suffix).substring(ROOT_PATH.length());
                        map.put(filename, resourcePath);
                    }

                    result.put("resourcePath", resourcePath);
                    result.put("localpath", path);
                    result.put("filesuffix", suffix);
*//*
                    model.addAttribute("test", "test");
                    model.addAttribute("resourcePath", resourcePath);
                    model.addAttribute("localpath", path);
                    model.addAttribute("filesuffix", suffix);
*//*
                    break;
            }
        }

        return result;
        *//*return "index/document/finish";*//*
    }*/

    @RequiresAuthentication
    @RequestMapping(
            value = "/previewupload",
            method = RequestMethod.POST
    )
    public String userManage(
@RequestParam(
            value = "filename",
            required = true
    ) String filename,
HttpServletRequest request, ModelMap model, HttpSession session) throws IOException {
        MultipartHttpServletRequest mhs = (MultipartHttpServletRequest) request;
        List<MultipartFile> files = mhs.getFiles("resFile");

        String rHost = request.getRemoteHost();
        System.out.println(rHost);

        Map<String,Object> result = new HashMap<>();
        if (files != null && files.size() > 0) {
            for (MultipartFile file : files) {
                if (file.getOriginalFilename().equals(filename)) {
                    String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
                    String resourcePath = "";
                    String path = "";
                    if (pathMap.containsKey(rHost)) {
                        Map map = pathMap.get(rHost);
                        boolean status = true;
                        if (map.containsKey(filename)) {
                            status = false;
                            resourcePath = (String) map.get(filename);
                            path = ROOT_PATH + resourcePath;
                            if (!new File(ROOT_PATH + resourcePath).exists()) {
                                map.remove(filename);
                            }
                        }
                        if (status) {
                            path = ROOT_PATH + "tempfile/" + IDGenerator.generator() + "/pretemp";
                            resourcePath = fileService.writeAllFile(file.getInputStream(), path, suffix).substring(ROOT_PATH.length());
                            map.put(filename, resourcePath);
                        }
                    } else {
                        System.out.println(file.getOriginalFilename());
                        Map<String, String> map = new HashMap<>();
                        pathMap.put(request.getRemoteHost(), map);

                        path = ROOT_PATH +"tempfile/" + IDGenerator.generator() + "/pretemp";
                        resourcePath = fileService.writeAllFile(file.getInputStream(), path, suffix).substring(ROOT_PATH.length());
                        map.put(filename, resourcePath);
                    }
                    if(path.toLowerCase().endsWith(".mov")||path.toLowerCase().endsWith(".avi"))
                    	if(new File(ROOT_PATH+resourcePath.substring(0,resourcePath.lastIndexOf("."))+".mp4").exists())
                            model.addAttribute("ready", "true");

                    model.addAttribute("test", "test");
                    model.addAttribute("resourcePath", resourcePath);
                    model.addAttribute("localpath", path);
                    model.addAttribute("filesuffix", suffix);

                    break;
                }
            }
        }

        return "index/document/finish";

    }

    @ResponseBody
    @RequestMapping(value = "/checkavi", method = RequestMethod.POST)
    public Map<String, Object> checkavi(
            @RequestParam(value = "path", required = false) String path) {
        Map<String, Object> result = new HashMap<>();
        try {
        	File file = new File(ROOT_PATH+path.substring(0,path.lastIndexOf("."))+".mp4");
        	result.put("file_size", file.length());
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return result;
    }


    @RequiresAuthentication
    @RequestMapping(
            value = "/upload",
            method = RequestMethod.POST
    )
    public String deviceManage(@ModelAttribute("recordForm") InfoTypeForm recordForm,/*@RequestParam(
            value = "uploadFileAndInfo",
            required = false
    ) RecordForm uploadFileAndInfo,*/ final RedirectAttributes redirectAttributes, HttpServletRequest request, ModelMap model, HttpSession session) throws IOException {

       /* MultipartHttpServletRequest mhs = (MultipartHttpServletRequest) request;
        List<MultipartFile> files = mhs.getFiles("resFile");*/

        /*String year = URLEncoder.encode(recordForm.getYearStr(), "utf-8");
        String deadline = URLEncoder.encode(recordForm.getDeadlineStr(), "utf-8");
        String department = URLEncoder.encode(recordForm.getDepartmentStr(), "utf-8");*/

        //String recordId = recordService.createAndUploadFile(recordForm, files);

       /* recordCategoryContentService.checkAndCreate(year, RecordUtil.YEAR);
        recordCategoryContentService.checkAndCreate(department, RecordUtil.DEPARTMENT);
        recordCategoryContentService.checkAndCreate(deadline, RecordUtil.DEADLINE);*/


        //remove tempfile
        /*Map<String, String> map = pathMap.get(request.getRemoteHost());
        if (map != null) {
            Collection<String> values = map.values();
            for (String value : values) {
                File file = new File(WebUtils.getRootPath() + value);
                if (file.exists()) {
                    file.delete();
                }
            }
            pathMap.remove(request.getRemoteHost());
        }*/

        StringBuffer sb = new StringBuffer();
        sb.append("&fondsId=").append(recordForm.getFonds()).append("&recordTypeId=").append(recordForm.getRecordtype()).append("&year=").append(recordForm.getYear()).append("&deadline=").append(recordForm.getDeadline()).append("&department=").append(recordForm.getDepartment());


        return "redirect:/record/import?" + sb.toString();
    }

    @RequiresAuthentication
    @RequestMapping(
            value = "/reupload",
            method = RequestMethod.POST
    )
    public String reupload(@ModelAttribute("recordForm") InfoTypeForm recordForm,/*@RequestParam(
            value = "uploadFileAndInfo",
            required = false
    ) RecordForm uploadFileAndInfo,*/ final RedirectAttributes redirectAttributes, HttpServletRequest request, ModelMap model, HttpSession session) throws IOException {

        return "redirect:/record/reimport?recordId=" + recordForm.getId() + "&pattern=" + recordForm.getMode() + "&fondsId=" + recordForm.getFonds() + "&recordTypeId=" + recordForm.getRecordtype();
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
    /*@RequiresRoles(value = {"USER"})*/
    @RequestMapping(
            value = "/upload",
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

        List<Fonds> fonds = fondsService.selectHasRecordType();
        List<RecordType> recordTypes = new ArrayList<>();
        if (fonds.size() > 0)
            recordTypes = recordTypeService.selectByFondsId(fonds.get(0).getId());

        model.addAttribute("recordForm", new InfoTypeForm());

        model.addAttribute("fonds", fonds);
        model.addAttribute("recordTypes", recordTypes);
        model.addAttribute("departments", departmentService.selectAll());
        model.addAttribute("deadlines", deadlineService.selectAll());
        model.addAttribute("years", yearService.selectAll());

        return "index/document/upload";
    }

    @RequiresAuthentication
    /*@RequiresRoles(value = {"USER"})*/
    @RequestMapping(
            value = "/reupload",
            method = RequestMethod.GET
    )
    public String reupload(@ModelAttribute("recordForm") InfoTypeForm recordForm, ModelMap model) {

        List<Fonds> fonds = fondsService.selectAll();
        List<RecordType> recordTypes = recordTypeService.selectByFondsId(recordForm.getFonds());

        recordForm.setCustomFields(new HashMap<String, String>());
        recordForm.setCustomIndexFields(new HashMap<String, String>());

        model.addAttribute("recordForm", recordForm);
        model.addAttribute("customFields", JSONObject.toJSONString(recordForm.getCustomFields()));
        model.addAttribute("customIndexFields", JSONObject.toJSONString(recordForm.getCustomIndexFields()));

        model.addAttribute("fonds", fonds);
        model.addAttribute("recordTypes", recordTypes);
        model.addAttribute("departments", departmentService.selectAll());
        model.addAttribute("deadlines", deadlineService.selectAll());
        model.addAttribute("years", yearService.selectAll());

        return "index/document/reupload";
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
