package cn.com.jtang.web.controller.json;

import cn.com.jtang.po.BackupSave;
import cn.com.jtang.service.BackupService;
import cn.com.jtang.service.LogService;
import cn.com.jtang.service.ScheduleService;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("jsonbackup")
@RequestMapping("/json/backup")
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
    private LogService logService;
    @Resource
    private BackupService backupService;

    @RequiresAuthentication
    @RequestMapping(
            value = "/dailybackup/modify",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map<String, Object> dailybackupmodify(@RequestBody Map body, HttpServletResponse response) {

        Map<String, Object> result = new HashMap<>();
        List<String> cronExpressions = (List<String>) body.get("cronExpressions");
        List<Integer> hasWeeks = (List<Integer>) body.get("hasWeeks");
        backupService.modifyDailyJob(hasWeeks, cronExpressions);
        String event = "增量备份表达式修改，修改后表达式为:"+cronExpressions;
        logService.insert(event);
        result.put("status", true);
        return result;
    }

    @RequiresAuthentication
    @RequestMapping(
            value = "/fullbackup/modify",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map<String, Object> fullbackupmodify(@RequestBody Map body, HttpServletResponse response) {

        Map<String, Object> result = new HashMap<>();
        List<String> cronExpressions = (List<String>) body.get("cronExpressions");
        List<Integer> hasWeeks = (List<Integer>) body.get("hasWeeks");
        backupService.modifyFullJob(hasWeeks, cronExpressions);
        String event = "全量备份表达式修改，修改后表达式为:"+cronExpressions;
        logService.insert(event);
        result.put("status", true);
        return result;

    }

    @RequiresAuthentication
    @RequestMapping(
            value = "/dailybackup/info",
            method = RequestMethod.GET
    )
    @ResponseBody
    public Map<String, Object> dailybackupinfo(HttpServletResponse response) {

        Map<String, Object> result = new HashMap<>();
        result.put("backsmap", backupService.selectDailyMap());
        result.put("hasWeeks", backupService.selectDailyWeeks());
        return result;

    }

    @RequiresAuthentication
    @RequestMapping(
            value = "/fullbackup/info",
            method = RequestMethod.GET
    )
    @ResponseBody
    public Map<String, Object> fullbackupinfo(HttpServletResponse response) {

        Map<String, Object> result = new HashMap<>();
        result.put("backsmap", backupService.selectFullMap());
        result.put("hasWeeks", backupService.selectFullWeek());
        return result;

    }

    @RequiresAuthentication
    @RequestMapping(
            value = "/now",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map<String, Object> now(@RequestParam(
            value = "description",
            required = true
    ) String description, HttpServletResponse response) {

        Map<String, Object> result = new HashMap<>();
        try {
            backupService.backupNowAndSave(description);
            String event = "备份当前数据库，备份原因:"+description;
            logService.insert(event);
            result.put("status", true);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        return result;

    }

    @RequiresAuthentication
    @RequestMapping(
            value = "/revert",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map<String, Object> revert(@RequestParam(
            value = "index",
            required = true
    ) String index, HttpServletResponse response) {

        Map<String, Object> result = new HashMap<>();
        try {
            BackupSave backupSave = backupService.selectBackupSaveByPrimaryKey(index);
            String sqlPath = backupSave.getSqlpath();
            backupService.revert(sqlPath);
            String event = "还原数据库到某个时间节点，时间为:"+backupSave.getCreatetime().toString();
            logService.insert(event);
            result.put("status", true);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        return result;

    }

    @RequiresAuthentication
    @RequestMapping(
            value = "/delete",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map<String, Object> delete(@RequestParam(
            value = "index",
            required = true
    ) String index, HttpServletResponse response) {

        Map<String, Object> result = new HashMap<>();
        backupService.deleteSql(index);
        String event = "删除某个时间节点的数据库备份，id为:"+index;
        logService.insert(event);
        result.put("status", true);

        return result;

    }


    @RequiresAuthentication
    @RequestMapping(
            value = "/allBackupSave",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map<String, Object> allBackupSave(@RequestParam(
            value = "pageNum",
            required = true
    ) Integer pageNum, @RequestParam(
            value = "pageSize",
            required = true
    ) Integer pageSize, HttpServletResponse response) {

        Map<String, Object> result = new HashMap<>();

        result.put("allBackupSave", backupService.selectPage(pageNum, pageSize));

        return result;

    }

}


//~ Formatted by Jindent --- http://www.jindent.com
