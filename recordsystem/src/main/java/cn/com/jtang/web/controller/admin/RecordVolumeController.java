package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.Fonds;
import cn.com.jtang.po.RecordVolumeExample;
import cn.com.jtang.po.User;
import cn.com.jtang.service.*;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.RecordSearchForm;
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
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller
@RequestMapping("/recordvolume")
@SessionAttributes({
        "searchForm", "buildRecordSearchForm"
})
public class RecordVolumeController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private UserService userService;
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private DanymicService danymicService;
    @Resource
    private RecordVolumeService recordVolumeService;
    @Resource
    private YearService yearService;
    @Resource
    private DeadlineService deadlineService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    private FondsService fondsService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private ExportService exportService;


    /*@RequestMapping(value = "/volume/export", method = RequestMethod.POST)
    public String export(
            @RequestParam(value = "type", required = true) String type,
            @RequestParam(value = "filename", required = true) String filename,
            @RequestParam(value = "format", required = true) String format,
            @RequestParam(value = "fonds", required = true) String fonds,
            @RequestParam(value = "recordTypeId", required = true) String recordTypeId,
            @RequestParam(value = "cols", required = true) List<String> cols,
            @RequestParam(value = "colnames", required = true) List<String> colnames,
            final RedirectAttributes redirectAttributes, ModelMap model, HttpServletResponse response) {

        String tablePrefix = danymicService.getTablePrefix(fonds,recordTypeId);

        String tableName = tablePrefix+ type;
        List<Object> recordVolumes = danymicService.selectByCols(cols,tableName, example);
        JSONArray jsonArray = new JSONArray();
        jsonArray.addAll(recordVolumes);
        System.out.println(jsonArray);
        //JSONArray datas = getDatas();
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        exportService.exportWord(byteArrayOutputStream,cols,colnames,jsonArray);

        // 设置为下载文件弹框,和文件名编码
        String fileName = null;
        try {
            fileName = URLEncoder.encode(filename + "." + format, "UTF-8");
            if (fileName.length() > 150) {
                fileName = new String(fileName.getBytes("gb2312"), "ISO8859-1");
            }

            response.setHeader("Content-Disposition", "attachment; filename="
                    + fileName);
            // 设置文件大小
            response.setContentLength(byteArrayOutputStream.size());
            ServletOutputStream outputStream = response.getOutputStream();
            // 6: 将PDF文件输出到流中去.
            byteArrayOutputStream.writeTo(outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        *//*model.addAttribute("years",yearService.selectAll());
        model.addAttribute("deadlines",deadlineService.selectAll());
        model.addAttribute("departments",departmentService.selectAll());*//*

        return "index/record/directory/output";

    }*/

    @RequiresAuthentication
    @RequiresPermissions(value = {"createvolume"})
    @RequestMapping(
            value = "/create",
            method = RequestMethod.GET
    )
    public String create(RedirectAttributes redirectAttributes, ModelMap model) {

        List<Fonds> fondsList = fondsService.selectAll();
        //List<Department> departments = departmentService.selectAll();
        String fondsid = fondsList.get(0).getId();
        model.addAttribute("fondsList", fondsList);
        model.addAttribute("recordTypes", recordTypeService.selectByFondsId(fondsid));

        RecordSearchForm recordSearchForm = new RecordSearchForm();
        model.addAttribute("buildRecordSearchForm", recordSearchForm);
        model.addAttribute("departments", departmentService.selectAll());
        model.addAttribute("years", yearService.selectAll());
        model.addAttribute("deadlines", deadlineService.selectAll());
        /*
        recordSearchForm.setFondsId(fondsid);
        recordSearchForm.setDepartment(departments.get(0).getId());
        model.addAttribute("ddd",recordService.getCanBuildRecord(recordSearchForm));
        */

        return "index/recordvolume/create";
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
    @RequiresPermissions(value = {"createvolume"})
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

        return "redirect:/recordvolume/manage?n=true" + pageParam;
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
    @RequiresPermissions(value = {"createvolume"})
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

        model.addAttribute("years", yearService.selectAll());
        model.addAttribute("deadlines", deadlineService.selectAll());
        model.addAttribute("departments", departmentService.selectAll());

        if (model.get("searchForm") == null) {
            model.addAttribute("searchForm", new SearchForm());
        }

        RecordVolumeExample example = new RecordVolumeExample();
        RecordVolumeExample.Criteria criteria = example.createCriteria();
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
                criteria.andSubjectLike("%" + key + "%");
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

        model.addAttribute("recordVolumePages", new PageView(recordVolumeService.selectByExample(example, pageObject)));

        return "index/recordvolume/manage";
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
