package cn.com.jtang.web.controller.admin;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.com.jtang.po.ArchivesAudit;
import cn.com.jtang.po.Station;
import cn.com.jtang.po.StationMail;
import cn.com.jtang.po.StationMailExample;
import cn.com.jtang.service.ArchivesService;
import cn.com.jtang.service.SiteMailService;
import cn.com.jtang.service.StationService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.ArchivesForm;
import cn.com.jtang.web.controller.form.StationForm;

@Controller
@RequestMapping("admin")
public class IndexController {
	@Resource 
	private SiteMailService siteMailService;
	@Resource 
	private ArchivesService archivesService;
    @Resource
    private StationService stationService;
	@RequestMapping(value="/index",method=RequestMethod.GET)
	@RequiresAuthentication
	public String gotoIndex(ModelMap model){
		org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();
        String username = (String) my.getPrincipal();
        StationMailExample example = new StationMailExample();
        StationMailExample.Criteria criteria = example.createCriteria();
        criteria.andToUserEqualTo(username);
        criteria.andIsReadEqualTo(false);
        Page page = new Page(null, 0, 1, 10);
        Page pageObj = siteMailService.selectByExample(example,page);
        model.addAttribute("pageObj", new PageView(pageObj));
        
        List<ArchivesAudit> archivesAuditlist =  archivesService.getArchivesAudit();
        model.addAttribute("archivesAudits",archivesAuditlist);
        model.addAttribute("archivesAudits_length", archivesAuditlist.size());
        
        List<ArchivesForm> archiveslist =  archivesService.getArchives();
        model.addAttribute("archives",archiveslist);
        model.addAttribute("archives_length", archiveslist.size());
        
        List<Station> stationlist = stationService.getTop8Station();
        model.addAttribute("stations",stationlist);
        
        
		return "index/home/index";
	}
}
