package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.CreateTable;
import cn.com.jtang.po.Fonds;
import cn.com.jtang.po.FondsExample;
import cn.com.jtang.po.RecordType;
import cn.com.jtang.po.Rule;
import cn.com.jtang.po.custom.RecordViewExample;
import cn.com.jtang.service.*;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.common.SearchForm;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;
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
@Controller
@RequestMapping("/recordapply")
@SessionAttributes({
        "dataSearchForm", "userSearchForm", "stypeSearchForm", "ctypeSearchForm", "searchForm",
        "companySearchForm", "sensorSearchForm", "ctypes", "stypes", "currentdeviceTypeSensor", "warningviews",
        "keySearchForm", "logSearchForm", "navid"
})
public class RecordApplyController {
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
            value = "/infotype",
            method = RequestMethod.POST
    )
    public String deviceManage(@ModelAttribute("searchForm") SearchForm searchForm,@RequestParam(
            value = "page",
            required = false
    ) Integer page, @RequestParam(
            value = "size",
            required = false
    ) Integer size,@RequestParam(
            value = "fondsid",
            required = false
    ) String fondsid,@RequestParam(
            value = "recordtypeid",
            required = false
    ) String recordtypeid,@RequestParam(
            value = "type",
            required = false
    ) String type,@RequestParam(
            value = "checkstatus",
            required = false
    ) String checkstatus, final RedirectAttributes redirectAttributes, ModelMap model, HttpSession session) {

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
       /* searchForm.setPage(page);
        searchForm.setSize(size);
*/
        String pageParam = "";

        if ((page != null) && (size != null)) {
            pageParam = "&page=" + page + "&size=" + size;
        }

        session.setAttribute("searchForm", searchForm);
        return "redirect:/recordapply/infotype?n=true&fondsid="+fondsid+"&recordtypeid="+recordtypeid+"&type="+type+"&checkstatus="+checkstatus + pageParam;
    }
    
    

    @RequiresAuthentication
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/infotype",
            method = RequestMethod.GET
    )
    public String infotype(@RequestParam(
            value = "n",
            required = false
    ) Boolean n, @RequestParam(
            value = "page",
            required = false
    ) Integer page, @RequestParam(
            value = "size",
            required = false
    ) Integer size,@RequestParam(
            value = "fondsid",
            required = false
    ) String fondsid,@RequestParam(
            value = "recordtypeid",
            required = false
    ) String recordtypeid,@RequestParam(
            value = "type",
            required = false
    ) String type,@RequestParam(
            value = "checkstatus",
            required = false
    ) String checkstatus,HttpServletRequest request, ModelMap model, HttpSession session) throws IOException {


        if(type==null||"".equals(type)||"null".equals(type)||(!RecordUtil.RECORD.equals(type)&&!RecordUtil.PIECE.equals(type)))
        	type = RecordUtil.RECORD;
        model.addAttribute("type", type);

        if (model.get("searchForm") == null) {
            model.addAttribute("searchForm", new SearchForm());
        }

        RecordViewExample example = new RecordViewExample();
        RecordViewExample.Criteria criteria = example.createCriteria();
        if(checkstatus==null||checkstatus.equals(""))
        	criteria.and("checkstatus="+RecordUtil.SUBMIT_CHECK);
        else
        	criteria.and("checkstatus="+checkstatus);
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
        	   	criteria.and("people like '%"+searchForm.getKey()+"%'");
                //criteria.and("%" + key + "%");
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


        List<Fonds> fonds =  fondsService.selectHasRecordType();
        model.addAttribute("fonds",fonds);
        model.addAttribute("checkstatus",checkstatus);
        
        if(fondsid!=null&&!fondsid.equals("null")){
            model.addAttribute("fondsid", fondsid);
        }else{
        	if(fonds.size()>0){
        		fondsid = fonds.get(0).getId();
        		model.addAttribute("fondsid", fondsid);
        	}else{
        		model.addAttribute("fondsid", "");
                model.addAttribute("records", new PageView(pageObject));
        		return "index/recordapply/infotype";
        	}
        }
       // String typeNo="";
        if(recordtypeid==null||recordtypeid.equals("null")||recordtypeid.equals("")){
        	List<RecordType> recordType=fondsService.getRecordType(fondsid);
        	if(recordType.size()>0){
                recordtypeid = recordType.get(0).getId();
        	}else{
                model.addAttribute("recordtypeid","");
                model.addAttribute("records", new PageView(pageObject));
        		return "index/recordapply/infotype";
        	}
        }

        model.addAttribute("n",n);
        model.addAttribute("recordtypeid",recordtypeid);
        model.addAttribute("type",type);
    	RecordType recordType = recordTypeService.selectByPrimaryKey(recordtypeid);
    	if(recordType==null)
            model.addAttribute("records", new PageView(pageObject));
    	else
    		model.addAttribute("records", new PageView(recordService.getApplyRecord(example, pageObject,recordType.getRecordtable().replace(RecordUtil.RECORD, type))));
        
        //model.addAttribute("table_prefix",fondsNo+"_"+typeNo);
        return "index/recordapply/infotype";
    }

    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/build",
            method = RequestMethod.GET
    )
    public String build(final RedirectAttributes redirectAttributes, HttpServletRequest request, ModelMap model, HttpSession session) throws IOException {


        return "index/recordapply/build";
    }
    
    
    
    @ResponseBody
    @RequestMapping(
            value = "/recordType",
            method = RequestMethod.GET
    )
    public Map<String, Object> userCreate( @RequestParam(
            value = "fondsid",
            required = true
    ) String fondsid, ModelMap model) {

        Map<String, Object> result = new HashMap<>();
        try{
        	List<RecordType> recordtypes = fondsService.getRecordType(fondsid);
        	
            result.put("recordtypes", recordtypes);
        }catch(Exception e){
        	e.printStackTrace();
            result.put("recordtypes", "");
        }

        return result;


    }    
    @ResponseBody
    @RequestMapping(
            value = "/getFailReason",
            method = RequestMethod.GET
    )
    public Map<String, Object> getFailReason( @RequestParam(
            value = "recordid",
            required = true
    ) String recordid, ModelMap model) {

        Map<String, Object> result = new HashMap<>();
        try{
            result.put("failReason", recordService.getFailReason(recordid));
        }catch(Exception e){
        	e.printStackTrace();
            result.put("failReason", "");
        }

        return result;


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
    @RequestMapping(
            value = "/myapply",
            method = RequestMethod.POST
    )
    public String myapply(@ModelAttribute("searchForm") SearchForm searchForm,@RequestParam(
            value = "page",
            required = false
    ) Integer page, @RequestParam(
            value = "size",
            required = false
    ) Integer size,@RequestParam(
            value = "fondsid",
            required = false
    ) String fondsid,@RequestParam(
            value = "recordtypeid",
            required = false
    ) String recordtypeid,@RequestParam(
            value = "type",
            required = false
    ) String type, final RedirectAttributes redirectAttributes, ModelMap model, HttpSession session) {

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
       /* searchForm.setPage(page);
        searchForm.setSize(size);
*/
        String pageParam = "";

        if ((page != null) && (size != null)) {
            pageParam = "&page=" + page + "&size=" + size;
        }

        session.setAttribute("searchForm", searchForm);
        return "redirect:/recordapply/myapply?n=true&fondsid="+fondsid+"&recordtypeid="+recordtypeid+"&type="+type + pageParam;
    }
    
    

    @RequiresAuthentication
    @RequestMapping(
            value = "/myapply",
            method = RequestMethod.GET
    )
    public String myapply(@RequestParam(
            value = "n",
            required = false
    ) Boolean n, @RequestParam(
            value = "page",
            required = false
    ) Integer page, @RequestParam(
            value = "size",
            required = false
    ) Integer size,@RequestParam(
            value = "fondsid",
            required = false
    ) String fondsid,@RequestParam(
            value = "recordtypeid",
            required = false
    ) String recordtypeid,@RequestParam(
            value = "type",
            required = false
    ) String type,@RequestParam(
            value = "status",
            required = false
    ) String status,HttpServletRequest request, ModelMap model, HttpSession session) throws IOException {
    	
    	if(status==null||"".equals(status)||"null".equals(status)){
    		status="0";
        }
        model.addAttribute("status", status);
        if(type==null||"".equals(type)||"null".equals(type)||(!RecordUtil.RECORD.equals(type)&&!RecordUtil.PIECE.equals(type))){
        	type = RecordUtil.RECORD;
            model.addAttribute("pattern", 0);
        }else{
            model.addAttribute("pattern", 1);
        }
        model.addAttribute("type", type);

        if (model.get("searchForm") == null) {
            model.addAttribute("searchForm", new SearchForm());
        }

        RecordViewExample example = new RecordViewExample();
        RecordViewExample.Criteria criteria = example.createCriteria();
        //criteria.and("checkstatus="+RecordUtil.SUBMIT_CHECK);
        criteria.and("operator='"+shiroUserService.getLoginUser().getUsername()+"'");
        criteria.and("checkstatus="+status);
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
        	   	criteria.and("people like '%"+searchForm.getKey()+"%'");
                //criteria.and("%" + key + "%");
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


        List<Fonds> fonds =  fondsService.selectAll();
        model.addAttribute("fonds",fonds);
        
        if(fondsid!=null&&!fondsid.equals("null")){
            model.addAttribute("fondsid", fondsid);
        }else{
        	if(fonds.size()>0){
        		fondsid = fonds.get(0).getId();
        	}else{
        		model.addAttribute("fondsid", "");
                model.addAttribute("records", new PageView(pageObject));
        		return "index/recordapply/infotype";
        	}
        }
       // String typeNo="";
        if(recordtypeid==null||recordtypeid.equals("null")||recordtypeid.equals("")){
        	List<RecordType> recordType=fondsService.getRecordType(fondsid);
        	if(recordType.size()>0){
                recordtypeid = recordType.get(0).getId();
        	}else{
        		model.addAttribute("fondsid", fondsid);
                model.addAttribute("recordtypeid","");
                model.addAttribute("records", new PageView(pageObject));
        		return "index/recordapply/infotype";
        	}
        }

        model.addAttribute("n",n);
        model.addAttribute("recordtypeid",recordtypeid);
        model.addAttribute("type",type);
    	RecordType recordType = recordTypeService.selectByPrimaryKey(recordtypeid);
    	if(recordType==null)
            model.addAttribute("records", new PageView(pageObject));
    	else{
    		String fondsName = fondsidIsRight(fondsid,fonds);
    		if(fondsName!=null){
                model.addAttribute("fondsName", fondsName);
    		}else{
                model.addAttribute("fondsName", fondsService.selectByPrimaryKey(recordType.getFondsid()).getName());
    		}
            model.addAttribute("fondsid", recordType.getFondsid());
            model.addAttribute("recordTypeName", recordType.getName());
    		model.addAttribute("records", new PageView(recordService.getApplyRecord(example, pageObject,recordType.getRecordtable().replace(RecordUtil.RECORD, type))));
    	}
        //model.addAttribute("table_prefix",fondsNo+"_"+typeNo);
        return "index/recordapply/myapply";
    }
    public String fondsidIsRight(String fondsid,List<Fonds> fonds){
    	for(Fonds fond:fonds){
    		if(fond.getId().equals(fondsid)){
    			return fond.getName();
    		}
    	}
		return null;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
