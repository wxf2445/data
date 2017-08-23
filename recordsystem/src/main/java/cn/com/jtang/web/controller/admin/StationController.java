package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.UserExample;
import cn.com.jtang.service.DanymicService;
import cn.com.jtang.service.InfoService;
import cn.com.jtang.service.LogService;
import cn.com.jtang.service.RecordService;
import cn.com.jtang.service.StationService;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.InfoTypeForm;
import cn.com.jtang.web.controller.form.LogSearchForm;
import cn.com.jtang.web.controller.form.RecordForm;
import cn.com.jtang.web.controller.form.RecordSearchForm;
import cn.com.jtang.web.controller.form.StationForm;
import cn.com.jtang.web.controller.form.common.SearchForm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("stationController")
@RequestMapping("/station")

public class StationController {
    @Value("${page.size}")
    private int PAGE_SIZE;

    @Resource
    private StationService stationService;

    @RequestMapping(
            value = "/manage",
            method = RequestMethod.POST
    )
    public String managePost( ModelMap model, HttpServletRequest request,
    		@ModelAttribute("stationForm") StationForm stationForm,HttpSession session) throws IOException {
        

        session.setAttribute("stationForm", stationForm);
        return "redirect:/log/manage";
    }
    @RequestMapping(
            value = "/manage",
            method = RequestMethod.GET
    )
    public String manage( ModelMap model, HttpServletRequest request) throws IOException {
        

        if (model.get("stationForm") == null) {
            model.addAttribute("stationForm", new StationForm());
        }
        
        StationForm stationForm = (StationForm) model.get("stationForm");

        model.addAttribute("stations", new PageView(stationService.selectByStationForm(stationForm)));

        return "index/site/remainder";
    }



}


//~ Formatted by Jindent --- http://www.jindent.com
