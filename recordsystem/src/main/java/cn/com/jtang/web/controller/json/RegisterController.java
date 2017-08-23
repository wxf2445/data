package cn.com.jtang.web.controller.json;

import cn.com.jtang.po.User;
import cn.com.jtang.po.UserExample;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.MailUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller("jsonRegisterController")
@RequestMapping("/json/register")
public class RegisterController {


    @Resource
    private UserService userService;

    @RequestMapping(value = "/checksum", method = RequestMethod.POST)
    @ResponseBody
    public boolean createchecksum(
            @RequestParam(value = "checksum", required = true) String checksum,
            HttpSession session) {

        boolean status = false;
        if ((session.getAttribute("checksum")) != null) {
            String savechecksum = (String) session.getAttribute("checksum");
            long starttime = (Long) session.getAttribute("starttime");
            long nowtime = new Date().getTime();
            if (savechecksum != null && savechecksum.equals(checksum) && (nowtime - starttime) < 24 * 3600 * 1000) {
                status = true;
            }
        }
        return status;

    }

    @RequestMapping(value = "/email", method = RequestMethod.POST)
    @ResponseBody
    public boolean email(
            @RequestParam(value = "email", required = true) String email,
            HttpSession session) {

        boolean status = true;
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andEmailEqualTo(email);
        List<User> users = userService.selectByExample(userExample);

        if (users != null && users.size() > 0) {
            status = false;
        }

        return status;

    }


    @RequestMapping(value = "/create/checkname", method = RequestMethod.POST)
    @ResponseBody
    public boolean checkname(
            @RequestParam(value = "name", required = true) String name) {

        boolean status = true;
        if (name != null && !"".equals(name)) {
            if(userService.isExist(name)){
                status = false;
            }
        }
        return status;

    }

    @RequestMapping(value = "/checkemail", method = RequestMethod.POST)
    @ResponseBody
    public boolean checkemail(
            @RequestParam(value = "email", required = true) String email,
            HttpSession session,
            HttpServletRequest request) {
        String id = IDGenerator.generator();
        /*String url = "http://" + request.getServerName() + ":"
				+ request.getServerPort() + request.getContextPath()
				+ "/api/user/activate?id="+id;*/
        String content = "您的验证码：" + id;
        try {
//			MailUtil.sendHtmlEmail("报名系统邮箱注册", content, email);
            MailUtil.sendMail("报名系统邮箱注册", content, email);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println(e.getMessage());
            return false;
        }
        session.setAttribute("checksum", id);
        session.setAttribute("starttime", new Date().getTime());
        return true;
    }

}