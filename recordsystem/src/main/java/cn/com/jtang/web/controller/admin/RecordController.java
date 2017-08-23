package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.Fonds;
import cn.com.jtang.po.Info;
import cn.com.jtang.po.custom.FondsTree;
import cn.com.jtang.po.custom.RecordTree;
import cn.com.jtang.po.custom.RecordView;
import cn.com.jtang.service.*;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.InfoTypeForm;
import cn.com.jtang.web.controller.form.RecordSearchForm;
import cn.com.jtang.web.controller.form.common.SearchForm;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller
@RequestMapping("/record")
@SessionAttributes({
        "recordSearchForm", "buildRecordSearchForm", "recordForm"
})
public class RecordController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private RuleService ruleService;
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private FondsService fondsService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private InfoService infoService;
    @Resource
    private YearService yearService;
    @Resource
    private DeadlineService deadlineService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    private TemplateService templateService;
    @Resource
    private DocumentService documentService;
    @Resource
    private RecordService recordService;
    @Resource
    private DanymicService danymicService;
    @Resource
    private StoreHouseService storeHouseService;


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
    @RequiresPermissions(value = {"viewtree"})
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

        return "redirect:/record/manage?n=true" + pageParam;
    }


    @RequiresPermissions(value = {"recordinfo"})
    @RequestMapping(value = "/import", method = RequestMethod.POST)
    public String importInfo(@ModelAttribute("recordForm") InfoTypeForm recordForm,
            /*@RequestParam(value = "recordId", required = false) String recordId,*/
           /* @RequestParam(value = "fondsId", required = false) String fondsId,
            @RequestParam(value = "fondsName", required = false) String fondsName,
            @RequestParam(value = "recordTypeName", required = false) String recordTypeName,
            @RequestParam(value = "recordTypeId", required = false) String recordTypeId,
            @RequestParam(value = "year", required = false) Integer year,
            @RequestParam(value = "deadline", required = false) Integer deadline,
            @RequestParam(value = "department", required = false) Integer department,*/
            final RedirectAttributes redirectAttributes, ModelMap model) {

        //model.addAttribute("recordId", recordId);
        //InfoTypeForm recordForm = (InfoTypeForm) model.get("recordForm");

        /*List<FondsView> fonds = fondsService.selectAll();
        List<RecordType> recordTypes = recordTypeService.selectByFondsId(fonds.get(0).getId());
        model.addAttribute("fondss",fonds);
        model.addAttribute("recordTypes",recordTypes);*/

        /*StringBuffer sb = new StringBuffer();
        sb.append(fonds.getFondsno()).append("_").append(recordType.getTypeno()).append(RecordUtil.DOCUMENT);

        model.addAttribute("documents", documentService.selectByRecord(recordId, sb.toString().toLowerCase()));*/


        //model.addAttribute("mode",recordForm.getMode());
        String fondsId = recordForm.getFonds();
        String recordTypeId = recordForm.getRecordtype();
        model.addAttribute("fondsId", fondsId);
        model.addAttribute("recordTypeId", recordTypeId);
        model.addAttribute("fondsName", fondsService.selectByPrimaryKey(fondsId).getName());
        model.addAttribute("recordTypeName", recordTypeService.selectByPrimaryKey(recordTypeId).getName());
        model.addAttribute("year", yearService.selectByPrimaryKey(recordForm.getYear()).getName());
        model.addAttribute("deadline", deadlineService.selectByPrimaryKey(recordForm.getDeadline()).getName());
        model.addAttribute("department", departmentService.selectByPrimaryKey(recordForm.getDepartment()).getName());
        model.addAttribute("templates", templateService.selectByTypeId(recordTypeId));
        model.addAttribute("storeHouses", storeHouseService.selectAll());

        //String tablePrefix = danymicService.getTablePrefix(recordForm.getFonds(), recordForm.getRecordtype());
         /*if(RecordUtil.MODE_PIECE.equals(recordForm.getMode())){
             String tableName = tablePrefix + RecordUtil.PIECE;

             recordForm.setSequencno(String.valueOf(recordService.countAll(tableName)));
             recordForm.setRecordno(ruleService.createRecordRuleorder(recordForm,recordForm.getSequencno()));
             model.put("recordForm",recordForm);
         }*/
        return "index/record/importinfo";
    }

    @RequiresPermissions(value = {"intohouse"})
    @RequestMapping(value = "/intohouse", method = RequestMethod.GET)
    public String intohouse(
            /*@RequestParam(value = "recordId", required = false) String recordId,*/
            final RedirectAttributes redirectAttributes, ModelMap model) {
        model.put("recordSearchForm", new RecordSearchForm());
        model.put("buildRecordSearchForm", new RecordSearchForm());

        List<Fonds> fondsList = fondsService.selectAll();

        RecordTree tree = new RecordTree();
       /* List<FondsTree> fondsTrees = new ArrayList<>();
        FondsTree fondsTree = null;
        for (Fonds fonds : fondsList) {
            fondsTree = new FondsTree();
            fondsTree.setFonds(fonds);
            fondsTree.setRecordTypes(recordTypeService.selectByFondsId(fonds.getId()));
            fondsTrees.add(fondsTree);
        }*/

        tree.setFondss(recordTypeService.selectAccessTree());
        model.addAttribute("recordTree", tree);

        model.addAttribute("years", yearService.selectAll());
        model.addAttribute("deadlines", deadlineService.selectAll());
        model.addAttribute("departments", departmentService.selectAll());

        return "index/record/intohouse";

    }

    @RequiresPermissions(value = {"recordinfo"})
    @RequestMapping(value = "/reimport", method = RequestMethod.GET)
    public String reimport(
            @RequestParam(value = "recordId", required = true) String recordId,
            @RequestParam(value = "pattern", required = true) String pattern,
            @RequestParam(value = "fondsId", required = true) String fondsId,
            /*@RequestParam(value = "fondsName", required = true) String fondsName,
            @RequestParam(value = "recordTypeName", required = true) String recordTypeName,*/
            @RequestParam(value = "recordTypeId", required = false) String recordTypeId,
            @RequestParam(value = "reimport", required = false) String reimport,
            final RedirectAttributes redirectAttributes, ModelMap model) {

        String tablePrefix = danymicService.getTablePrefix(fondsId, recordTypeId);
        String tablename = "";
        String documentTable = "";

        RecordView recordView = null;


        if (RecordUtil.MODE_PIECE.equals(pattern)) {
            tablename = tablePrefix + RecordUtil.PIECE;
            recordView = recordService.selectViewByPrimaryKey(recordId, tablename);
            documentTable = tablePrefix + RecordUtil.PIECEDOCUMENT;
        } else {
            tablename = tablePrefix + RecordUtil.RECORD;
            recordView = recordService.selectViewByPrimaryKey(recordId, tablename);
            documentTable = tablePrefix + RecordUtil.DOCUMENT;
        }

        model.addAttribute("record", recordView);
        model.put("documents", documentService.selectByRecord(recordId, documentTable));
        if (!StringUtils.isEmpty(recordView.getTableid())) {
            Map objects = danymicService.selectInfosByRecordId(tablename, recordId);
            model.addAttribute("contents", objects);
            model.addAttribute("notSelectTemplate", false);
        } else {
            model.addAttribute("notSelectTemplate", true);
        }

        if(reimport!=null)
        	model.addAttribute("reimport", true);
        model.addAttribute("mode", pattern);
        model.addAttribute("fondsId", fondsId);
        model.addAttribute("recordTypeId", recordTypeId);
        model.addAttribute("fondsName", fondsService.selectByPrimaryKey(fondsId).getName());
        model.addAttribute("recordTypeName", recordTypeService.selectByPrimaryKey(recordTypeId).getName());
        model.addAttribute("templates", templateService.selectByTypeId(recordTypeId));
        model.addAttribute("recordForm", new InfoTypeForm());

        return "index/record/reimportinfo";

    }

    @RequiresPermissions(value = {"export"})
    @RequestMapping(value = "/directory/output", method = RequestMethod.GET)
    public String directoryoutput(
            @RequestParam(value = "recordId", required = false) String recordId,
            final RedirectAttributes redirectAttributes, ModelMap model) {

        model.put("recordSearchForm", new RecordSearchForm());
        model.put("buildRecordSearchForm", new RecordSearchForm());

        List<Fonds> fondsList = fondsService.selectAll();

        RecordTree tree = new RecordTree();
        List<FondsTree> fondsTrees = recordTypeService.selectAccessTree();
        /*List<FondsTree> fondsTrees = new ArrayList<>();
        FondsTree fondsTree = null;
        for (Fonds fonds : fondsList) {
            fondsTree = new FondsTree();
            fondsTree.setFonds(fonds);
            fondsTree.setRecordTypes(recordTypeService.selectByFondsId(fonds.getId()));
            fondsTrees.add(fondsTree);
        }*/

        tree.setFondss(fondsTrees);
        model.addAttribute("recordTree", tree);

        model.addAttribute("years", yearService.selectAll());
        model.addAttribute("deadlines", deadlineService.selectAll());
        model.addAttribute("departments", departmentService.selectAll());

        return "index/record/directory/output";

    }

    @RequiresPermissions(value = {"indexexport"})
    @RequestMapping(value = "/directory/indexoutput", method = RequestMethod.GET)
    public String indexoutput(
            @RequestParam(value = "recordId", required = false) String recordId,
            final RedirectAttributes redirectAttributes, ModelMap model) {

        model.put("recordSearchForm", new RecordSearchForm());
        model.put("buildRecordSearchForm", new RecordSearchForm());

        List<Fonds> fondsList = fondsService.selectAll();

        RecordTree tree = new RecordTree();
        /*List<FondsTree> fondsTrees = new ArrayList<>();
        FondsTree fondsTree = null;
        for (Fonds fonds : fondsList) {
            fondsTree = new FondsTree();
            fondsTree.setFonds(fonds);
            fondsTree.setRecordTypes(recordTypeService.selectByFondsId(fonds.getId()));
            fondsTrees.add(fondsTree);
        }*/

        tree.setFondss(recordTypeService.selectAccessTree());
        model.addAttribute("recordTree", tree);

        model.addAttribute("years", yearService.selectAll());
        model.addAttribute("deadlines", deadlineService.selectAll());
        model.addAttribute("departments", departmentService.selectAll());

        return "index/record/directory/indexoutput";

    }


    @RequiresPermissions(value = {"outputsetting"})
    @RequestMapping(value = "/directory/outputsetting", method = RequestMethod.GET)
    public String outputsetting(
            @RequestParam(value = "recordId", required = false) String recordId,
            final RedirectAttributes redirectAttributes, ModelMap model) {

        model.put("recordSearchForm", new RecordSearchForm());
        model.put("buildRecordSearchForm", new RecordSearchForm());

        List<Fonds> fondsList = fondsService.selectAll();

        RecordTree tree = new RecordTree();
        /*List<FondsTree> fondsTrees = new ArrayList<>();
        FondsTree fondsTree = null;
        for (Fonds fonds : fondsList) {
            fondsTree = new FondsTree();
            fondsTree.setFonds(fonds);
            fondsTree.setRecordTypes(recordTypeService.selectByFondsId(fonds.getId()));
            fondsTrees.add(fondsTree);
        }*/

        tree.setFondss(recordTypeService.selectAccessTree());
        model.addAttribute("recordTree", tree);

        model.addAttribute("years", yearService.selectAll());
        model.addAttribute("deadlines", deadlineService.selectAll());
        model.addAttribute("departments", departmentService.selectAll());

        return "index/record/directory/outputsetting";

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
    @RequiresPermissions(value = {"viewtree"})
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

        model.put("recordSearchForm", new RecordSearchForm());
        model.put("buildRecordSearchForm", new RecordSearchForm());

        List<Fonds> fondsList = fondsService.selectAll();

        RecordTree tree = new RecordTree();
        /*List<FondsTree> fondsTrees = new ArrayList<>();
        FondsTree fondsTree = null;
        for (Fonds fonds : fondsList) {
            fondsTree = new FondsTree();
            fondsTree.setFonds(fonds);
            fondsTree.setRecordTypes(recordTypeService.selectByFondsId(fonds.getId()));
            fondsTrees.add(fondsTree);
        }*/

        tree.setFondss(recordTypeService.selectAccessTree());
        model.addAttribute("recordTree", tree);

        model.addAttribute("years", yearService.selectAll());
        model.addAttribute("deadlines", deadlineService.selectAll());
        model.addAttribute("departments", departmentService.selectAll());

        return "index/record/manage";
    }

    @RequestMapping(
            value = "/batchupload",
            method = RequestMethod.GET
    )
    public String batchupload(HttpServletResponse response, RedirectAttributes redirectAttributes, ModelMap model) throws IOException {

        RecordTree tree = new RecordTree();
        /*List<FondsTree> fondsTrees = new ArrayList<>();
        FondsTree fondsTree = null;
        for (Fonds fonds : fondsList) {
            fondsTree = new FondsTree();
            fondsTree.setFonds(fonds);
            fondsTree.setRecordTypes(recordTypeService.selectByFondsId(fonds.getId()));
            fondsTrees.add(fondsTree);
        }*/

        tree.setFondss(recordTypeService.selectAccessTree());
        model.addAttribute("recordTree", tree);
        return "index/record/batchupload";
    }

    @RequestMapping(value = "/batchexport", method = RequestMethod.GET)
    public String batchexport(
            @RequestParam(value = "recordId", required = false) String recordId,
            final RedirectAttributes redirectAttributes, ModelMap model) {

        model.put("recordSearchForm", new RecordSearchForm());
        model.put("buildRecordSearchForm", new RecordSearchForm());

        List<Fonds> fondsList = fondsService.selectAll();

        RecordTree tree = new RecordTree();
        /*List<FondsTree> fondsTrees = new ArrayList<>();
        FondsTree fondsTree = null;
        for (Fonds fonds : fondsList) {
            fondsTree = new FondsTree();
            fondsTree.setFonds(fonds);
            fondsTree.setRecordTypes(recordTypeService.selectByFondsId(fonds.getId()));
            fondsTrees.add(fondsTree);
        }*/

        tree.setFondss(recordTypeService.selectAccessTree());
        model.addAttribute("recordTree", tree);

        model.addAttribute("years", yearService.selectAll());
        model.addAttribute("deadlines", deadlineService.selectAll());
        model.addAttribute("departments", departmentService.selectAll());

        return "index/record/directory/batchexport";

    }

    @RequiresAuthentication
    @RequiresPermissions(value = {"recordedit"})
    @RequestMapping(
            value = "/edit",
            method = RequestMethod.GET
    )
    public String edit(@RequestParam(
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

        model.put("recordSearchForm", new RecordSearchForm());
        model.put("buildRecordSearchForm", new RecordSearchForm());

        List<Fonds> fondsList = fondsService.selectAll();

        RecordTree tree = new RecordTree();
        /*List<FondsTree> fondsTrees = new ArrayList<>();
        FondsTree fondsTree = null;
        for (Fonds fonds : fondsList) {
            fondsTree = new FondsTree();
            fondsTree.setFonds(fonds);
            fondsTree.setRecordTypes(recordTypeService.selectByFondsId(fonds.getId()));
            fondsTrees.add(fondsTree);
        }*/

        tree.setFondss(recordTypeService.selectAccessTree());
        model.addAttribute("recordTree", tree);

        model.addAttribute("years", yearService.selectAll());
        model.addAttribute("deadlines", deadlineService.selectAll());
        model.addAttribute("departments", departmentService.selectAll());

        return "index/record/edit";
    }
    @RequestMapping(
            value = "/recordupload",
            method = RequestMethod.GET
    )
    public String recordupload(HttpServletResponse response, RedirectAttributes redirectAttributes, ModelMap model) throws IOException {


        return "index/record/recordupload";
    }

}


//~ Formatted by Jindent --- http://www.jindent.com
