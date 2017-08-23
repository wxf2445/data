package cn.com.jtang.web.controller.admin;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.alibaba.fastjson.JSONObject;

import cn.com.jtang.po.Record;
import cn.com.jtang.service.ArchivesService;
import cn.com.jtang.service.RecordService;
import cn.com.jtang.service.RecordTypeService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.ArchivesSearchForm;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("archivesController")
@RequestMapping("/archives")
public class ArchivesController {
    @Value("${page.size}")
    private int PAGE_SIZE;

    @Resource
    private ArchivesService archivesService;
    @Resource
    private RecordTypeService recordtypeService;
    @Resource
    private RecordService recordService;
    /* @Resource
    private DanymicService danymicService;*/

    @RequestMapping(
            value = "/library",
            method = RequestMethod.POST
    )
    public String managePost( ModelMap model, HttpServletRequest request) throws IOException {
        
        return "redirect:/archives/library";
    }
    @RequestMapping(
            value = "/library",
            method = RequestMethod.GET
    )
    public String manage( ModelMap model,
    		@ModelAttribute("recordtypeid") String recordtypeid,
    		@ModelAttribute("recordid") String recordid,
    		@ModelAttribute("type") String type, HttpServletRequest request) throws IOException {

        if(recordtypeid!=null&&recordid!=null&&type!=null&&!recordtypeid.equals("")&&!recordid.equals("")&&!type.equals("")){
        	String tableName = recordtypeService.selectByPrimaryKey(recordtypeid).getRecordtable().replace(RecordUtil.RECORD, type);
            model.addAttribute("record", JSONObject.toJSON(recordService.selectByPrimaryKey(recordid, tableName)));
        }else{
            model.addAttribute("record", "");
        }
        /*System.out.println(((Record)model.get("record")).getSubject());*/
        	
        return "index/archives/library";
    }
    
    
    @RequestMapping(
            value = "/notreturn",
            method = RequestMethod.GET
    )
    public String notreturn( ModelMap model, HttpServletRequest request) throws IOException {
        

        if (model.get("archivesSearchForm") == null) {
            model.addAttribute("archivesSearchForm", new ArchivesSearchForm());
        }
        
        ArchivesSearchForm archivesSearchForm = (ArchivesSearchForm) model.get("archivesSearchForm");

        model.addAttribute("archives", new PageView(archivesService.getAllArchives(archivesSearchForm)));

        return "index/archives/notreturn";
    }


    @RequestMapping(
            value = "/record",
            method = RequestMethod.POST
    )
    public String recordPost( ModelMap model, HttpServletRequest request,
    		@ModelAttribute("archivesSearchForm") ArchivesSearchForm archivesSearchForm,HttpSession session) throws IOException {
        

        session.setAttribute("archivesSearchForm", archivesSearchForm);
        
        return "redirect:/archives/record";
    }
    
    
    @RequestMapping(
            value = "/record",
            method = RequestMethod.GET
    )
    public String record( ModelMap model, HttpServletRequest request) throws IOException {
        

        if (model.get("archivesSearchForm") == null) {
            model.addAttribute("archivesSearchForm", new ArchivesSearchForm());
        }
        
        ArchivesSearchForm archivesSearchForm = (ArchivesSearchForm) model.get("archivesSearchForm");

    	PageView pageView =  new PageView(archivesService.getArchivesRecord(archivesSearchForm));
        model.addAttribute("archives",pageView);
        model.addAttribute("pages", pageView.showPages());

        return "index/archives/record";
    }

    
    
    @RequestMapping(
            value = "/application",
            method = RequestMethod.GET
    )
    public String application( ModelMap model) throws IOException {
        
    	PageView pageView = new PageView(archivesService.getMyApplication(Page.ONE));
        model.addAttribute("archivesaudits", pageView);
        model.addAttribute("pages", pageView.showPages());

        return "index/archives/application";
    }

    
    

    @RequestMapping(
            value = "/audit",
            method = RequestMethod.GET
    )
    public String audit( ModelMap model, HttpServletRequest request) throws IOException {
        

        if (model.get("archivesSearchForm") == null) {
            model.addAttribute("archivesSearchForm", new ArchivesSearchForm());
        }

    	PageView pageView = new PageView(archivesService.getApplication(Page.ONE,Page.ZERO));
        model.addAttribute("archivesaudits", pageView);
        model.addAttribute("pages", pageView.showPages());

        return "index/archives/audit";
    }


}


//~ Formatted by Jindent --- http://www.jindent.com
