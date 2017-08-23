package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.User;
import cn.com.jtang.po.UserExample;
import cn.com.jtang.service.DanymicService;
import cn.com.jtang.service.InfoService;
import cn.com.jtang.service.LogService;
import cn.com.jtang.service.RecordService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.InfoTypeForm;
import cn.com.jtang.web.controller.form.LogSearchForm;
import cn.com.jtang.web.controller.form.RecordForm;
import cn.com.jtang.web.controller.form.RecordSearchForm;
import cn.com.jtang.web.controller.form.common.SearchForm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONArray;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("logController")
@RequestMapping("/log")
@SessionAttributes({
        "dataSearchForm", "userSearchForm", "stypeSearchForm", "ctypeSearchForm", "searchForm"
})
public class LogController {
    @Value("${page.size}")
    private int PAGE_SIZE;

    @Resource
    private LogService logService;
    @Resource
    private RecordService recordService;
    @Resource
    private DanymicService danymicService;
	@Resource
	private UserService userService;

    @RequestMapping(
            value = "/manage",
            method = RequestMethod.POST
    )
    public String managePost( ModelMap model, HttpServletRequest request,
    		@ModelAttribute("logSearchForm") LogSearchForm logSearchForm,HttpSession session) throws IOException {
        

        session.setAttribute("logSearchForm", logSearchForm);
        return "redirect:/log/manage";
    }
    @RequestMapping(
            value = "/manage",
            method = RequestMethod.GET
    )
    public String manage( ModelMap model, HttpServletRequest request) throws IOException {
        

        if (model.get("logSearchForm") == null) {
            model.addAttribute("logSearchForm", new LogSearchForm());
        }
        
        LogSearchForm logSearchForm = (LogSearchForm) model.get("logSearchForm");

		UserExample example = new UserExample();
		List<User> userList = userService.selectByExample(example);
		
        model.addAttribute("userList", userList);
        model.addAttribute("logs", new PageView(logService.selectByLogSearchForm(logSearchForm)));

        return "index/log/manage";
    }

    @RequiresAuthentication
    @RequestMapping(
            value = "/export",
            method = RequestMethod.POST
    )
    public void all(
    		@ModelAttribute("logSearchForm") LogSearchForm logSearchForm, HttpServletResponse response) {
        JSONArray jsonArray = null;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        logService.exportWord(byteArrayOutputStream,logSearchForm);

        // 设置为下载文件弹框,和文件名编码
        String fileName = "";
        try {
            /*fileName = URLEncoder.encode(filename + "." + format, "UTF-8");
            if (fileName.length() > 150) {
                fileName = new String(fileName.getBytes("gb2312"), "ISO8859-1");
            }*/
        	if(logSearchForm.getOperator()!=null){
        		if(logSearchForm.getOperator().equals(""))
        			fileName += "所有人";
        		else
        			fileName += logSearchForm.getOperator();
        	}
        	
        	if(logSearchForm.getType().equals("action"))
    			fileName += "操作日志";
        	else if(logSearchForm.getType().equals("check"))
        		fileName += "查询日志";
        	else
        		fileName += "所有操作";

            response.setHeader("Content-Disposition", "attachment; filename="+java.net.URLEncoder.encode(fileName, "UTF-8")+".xlsx");
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
    }


}


//~ Formatted by Jindent --- http://www.jindent.com
