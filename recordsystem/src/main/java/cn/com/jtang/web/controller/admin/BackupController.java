package cn.com.jtang.web.controller.admin;

import cn.com.jtang.service.BackupService;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller
@RequestMapping("/backup")
@SessionAttributes({
        "dataSearchForm", "userSearchForm", "stypeSearchForm", "ctypeSearchForm", "searchForm",
        "companySearchForm", "sensorSearchForm", "ctypes", "stypes", "currentdeviceTypeSensor", "warningviews",
        "keySearchForm", "logSearchForm", "navid"
})
public class BackupController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Value("${fileserverpath}")
    private String FileServerPath;
    @Resource
    private BackupService backupService;

    @RequiresAuthentication
    @RequestMapping(
            value = "/all",
            method = RequestMethod.GET
    )
    public String all(ModelMap model, HttpServletResponse response) {

        //model.addAttribute("allBackupSave",backupService.selectAllBackupSave());

        return "index/backup/all";

    }

}


//~ Formatted by Jindent --- http://www.jindent.com
