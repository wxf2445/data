package cn.com.jtang.web.controller.json;

import cn.com.jtang.po.RecordType;
import cn.com.jtang.po.SelectImformation;
import cn.com.jtang.service.*;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.ArchivesForm;
import cn.com.jtang.web.controller.form.ArchivesSearchForm;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("jsonArchivesController")
@RequestMapping("/json/archives")
public class ArchivesController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private ArchivesService archivesService;
    @Resource
    private RecordService recordService;
    @Resource
    private RecordTypeService recordTypeService;

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
    @ResponseBody
    @RequiresRoles(value = {"SUPER ADMIN"})
    @RequestMapping(
            value = "/add",
            method = RequestMethod.POST
    )
    public Map<String, Object> add(
    		@ModelAttribute("archivesForm") ArchivesForm archivesForm) {

        Map<String, Object> result = new HashMap<>();
        try{
            archivesService.insert(archivesForm);
            result.put("status",1 );
        }catch(Exception e){
        	e.printStackTrace();
            result.put("status",0 );
        }
        return result;

    }
    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/notreturn",
            method = RequestMethod.POST
    )
    public Map<String, Object> notreturnPost( ModelMap model, HttpServletRequest request,
    		@ModelAttribute("archivesSearchForm") ArchivesSearchForm archivesSearchForm) throws IOException {
        

        Map<String, Object> result = new HashMap<>();
        PageView pageView =new PageView(archivesService.getAllArchives(archivesSearchForm));
        result.put("archives", pageView);
        result.put("pages", pageView.showPages());
        
        return result;
    }

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/record",
            method = RequestMethod.POST
    )
    public Map<String, Object> record( ModelMap model, HttpServletRequest request,
    		@ModelAttribute("archivesSearchForm") ArchivesSearchForm archivesSearchForm) throws IOException {
        

        Map<String, Object> result = new HashMap<>();
        PageView pageView =new PageView(archivesService.getArchivesRecord(archivesSearchForm));
        result.put("archives", pageView);
        result.put("pages", pageView.showPages());
        
        return result;
    }

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/returnArchives",
            method = RequestMethod.POST
    )
    public Map<String, Object> returnPost( ModelMap model, HttpServletRequest request,
    		@ModelAttribute("id") String id,
    		@ModelAttribute("returnPerson") String returnPerson) throws IOException {
        

        Map<String, Object> result = new HashMap<>();
        result.put("status", archivesService.returnArchives(id,returnPerson));
        
        return result;
    }
    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/application",
            method = RequestMethod.POST
    )
    public Map<String, Object> application( ModelMap model, HttpServletRequest request,
    		@ModelAttribute("page") int page) throws IOException {
        

        Map<String, Object> result = new HashMap<>();
        PageView pageView = new PageView(archivesService.getMyApplication(page));
        result.put("archivesaudits",  pageView);
        result.put("pages",  pageView.showPages());
        
        return result;
    }


    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/searchRecord",
            method = RequestMethod.POST
    )
    public Map<String, Object> searchRecord( ModelMap model,
    		@ModelAttribute("recordtypeid") String recordtypeid,
    		@ModelAttribute("type") String type,
    		@ModelAttribute("key") String key,
    		@ModelAttribute("page") String page) throws IOException {

        Map<String, Object> result = new HashMap<>();
        int pagenum = 1;
        if(page!=null&&!page.equals("")){
        	try{
        		pagenum = Integer.parseInt(page);
        	}catch(Exception e){
        	}
        }
        result.put("records",   new PageView(recordService.searchRecord(key, type, recordtypeid,pagenum)));
        return result;
    }

    
    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/sendApplication",
            method = RequestMethod.POST
    )
    public Map<String, Object> sendApplication( ModelMap model,
    		@ModelAttribute("recordtypeid") String recordtypeid,
    		@ModelAttribute("type") String type,
    		@ModelAttribute("recordid") String recordid,
    		@ModelAttribute("accesspermission") String accesspermission,
    		@ModelAttribute("reason") String reason/*,
    		@ModelAttribute("subject") String subject*/) throws IOException {

        Map<String, Object> result = new HashMap<>();

        result.put("status",  archivesService.sendApplication(recordtypeid, type, recordid, reason, accesspermission));
        return result;
    }
    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/passArchives",
            method = RequestMethod.POST
    )
    public Map<String, Object> passArchives( 
    		@ModelAttribute("id") String id,@ModelAttribute("deadline")@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")Date deadline){

        Map<String, Object> result = new HashMap<>();
        try{
            result.put("status", archivesService.passArchives(id,deadline));
            result.put("status",1 );
        }catch(Exception e){
        	e.printStackTrace();
            result.put("status",0 );
        }
        return result;
    }

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/refuseArchives",
            method = RequestMethod.POST
    )
    public Map<String, Object> refuseArchives( 
    		@ModelAttribute("id") String id){

        Map<String, Object> result = new HashMap<>();

        try{
        	archivesService.refuseArchives(id);
            result.put("status",1 );
        }catch(Exception e){
        	e.printStackTrace();
            result.put("status",0 );
        }
        return result;
    }
    
    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/cancelAuthority",
            method = RequestMethod.POST
    )
    public Map<String, Object> cancelAuthority(
    		@ModelAttribute("id") String id){

        Map<String, Object> result = new HashMap<>();

        try{
        	archivesService.cancelAuthority(id);
            result.put("status",1 );
        }catch(Exception e){
        	e.printStackTrace();
            result.put("status",0 );
        }
        return result;
    }

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/audit",
            method = RequestMethod.POST
    )
    public Map<String, Object> Application( ModelMap model,
    		@ModelAttribute("page") int page,
    		@ModelAttribute("status") int status) throws IOException {

        Map<String, Object> result = new HashMap<>();

    	PageView pageView = new PageView(archivesService.getApplication(page,status));
        result.put("archivesaudits", pageView);
        result.put("pages", pageView.showPages());
        return result;
    }
    

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/auditisread",
            method = RequestMethod.POST
    )
    public Map<String, Object> auditisread( ModelMap model,
    		@ModelAttribute("id") String id) throws IOException {

        Map<String, Object> result = new HashMap<>();

        result.put("status", archivesService.isAduitRead(id));
        return result;
    }

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/getOneArchives",
            method = RequestMethod.POST
    )
    public Map<String, Object> getOneArchives( ModelMap model,
    		@ModelAttribute("recordtypeid") String recordtypeid,
    		@ModelAttribute("type") String type,
    		@ModelAttribute("recordid") String recordid) throws IOException {

        Map<String, Object> result = new HashMap<>();
        try{
            RecordType recordType = recordTypeService.selectByPrimaryKey(recordtypeid);
            SelectImformation si = new SelectImformation(recordType.getRecordtable().replace(RecordUtil.RECORD, "") + type, recordid, recordTypeService.getAllTableField(recordtypeid, type));
            result.put("information", si.setFieldByMap(recordService.getImformation(si)));
        }catch(Exception e){
        	result.put("error", "1");
        }
        return result;
    }

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/isread",
            method = RequestMethod.POST
    )
    public Map<String, Object> isread( ModelMap model,
    		@ModelAttribute("id") String id) throws IOException {

        Map<String, Object> result = new HashMap<>();

        result.put("status", archivesService.isRead(id));
        return result;
    }

    @RequiresAuthentication
    @ResponseBody
    @RequestMapping(
            value = "/getAArchives",
            method = RequestMethod.POST
    )
    public Map<String, Object> getOneArvhives( ModelMap model,
    		@ModelAttribute("id") String id) throws IOException {

        Map<String, Object> result = new HashMap<>();

        result.put("archives", archivesService.getOneArchives(id));
        return result;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
