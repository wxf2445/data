package cn.com.jtang.web.controller.json;

import cn.com.jtang.po.User;
import cn.com.jtang.po.UserExample;
import cn.com.jtang.service.RoleService;
import cn.com.jtang.service.ShiroUserService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.MailUtil;
import cn.com.jtang.util.Md5Util;
import cn.com.jtang.web.controller.form.common.UserCreateForm;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
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
@Controller("jsonUserController")
@RequestMapping("/json/user")
public class UserController {
    @Resource
    private UserService userService;
    @Resource
    private RoleService roleService;
    @Resource
    private ShiroUserService shiroUserService;
    @Value("${fileserverpath}")
    private String ROOT_PATH;

    @RequiresPermissions(value = {"edituser"})
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> userEdit(
            @ModelAttribute("userCreateForm") UserCreateForm userCreateForm,
            @RequestParam(value = "userid", required = false) String userid,
            final RedirectAttributes redirectAttributes, ModelMap model) {

        Map<String, Object> result = new HashMap<String, Object>();

        try {
            result.put("editSuccess", userService.editUser(userid, userCreateForm));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;

    }

    /**
     * Method description checkeditname
     *
     * @param inputname
     * @param originalname
     * @return boolean
     */
    @RequestMapping(
            value = "/checkeditname",
            method = RequestMethod.POST
    )
    @ResponseBody
    public boolean checkeditname(@RequestParam(
            value = "inputname",
            required = true
    ) String inputname, @RequestParam(
            value = "originalname",
            required = true
    ) String originalname) {
        boolean status = true;


        return status;
    }


    /**
     * Method description checkeditusername
     *
     * @param inputname
     * @param originalname
     * @return boolean
     */
    @RequestMapping(
            value = "/checkeditusername",
            method = RequestMethod.POST
    )
    @ResponseBody
    public boolean checkeditusername(@RequestParam(
            value = "inputname",
            required = true
    ) String inputname, @RequestParam(
            value = "originalname",
            required = true
    ) String originalname) {
        boolean status = true;

        if (!originalname.equals(inputname)) {
            if (userService.selectByUserName(inputname) != null) {
                status = false;
            }
        }

        return status;
    }

    /**
     * Method description checkemail
     *
     * @param email
     * @param session
     * @return boolean
     */
    @RequestMapping(
            value = "/checkemail",
            method = RequestMethod.POST
    )
    @ResponseBody
    public boolean checkemail(@RequestParam(
            value = "email",
            required = true
    ) String email, HttpSession session) {
        boolean status = true;
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();

        criteria.andEmailEqualTo(email);

        List<User> users = userService.selectByExample(userExample);

        if ((users == null) || (users.size() == 0)) {
            status = false;
        }

        return status;
    }

    /**
     * Method description checkemail
     *
     * @param oldemail
     * @param email
     * @return boolean
     */
    @RequestMapping(
            value = "/edit/email",
            method = RequestMethod.POST
    )
    @ResponseBody
    public boolean checkemail(@RequestParam(
            value = "oldemail",
            required = true
    ) String oldemail, @RequestParam(
            value = "email",
            required = true
    ) String email) {
        boolean status = true;

        if (!oldemail.equals(email)) {
            UserExample userExample = new UserExample();
            UserExample.Criteria criteria = userExample.createCriteria();

            criteria.andEmailEqualTo(email);

            List<User> users = userService.selectByExample(userExample);

            if ((users != null) && (users.size() > 0)) {
                status = false;
            }
        }

        return status;
    }

    /**
     * Method description checkusername
     *
     * @param username
     * @return boolean
     */
    @RequestMapping(
            value = "/checkname",
            method = RequestMethod.POST
    )
    @ResponseBody
    public boolean checkusername(@RequestParam(
            value = "username",
            required = true
    ) String username) {
        boolean status = false;
        User user = userService.selectByUserName(username);

        if (user == null) {
            status = true;
        }

        return status;
    }

    /**
     * Method description createchecksum
     *
     * @param checksum
     * @param session
     * @return boolean
     */
    @RequestMapping(
            value = "/checksum",
            method = RequestMethod.POST
    )
    @ResponseBody
    public boolean createchecksum(@RequestParam(
            value = "checksum",
            required = true
    ) String checksum, HttpSession session) {
        boolean status = false;

        if ((session.getAttribute("checksum")) != null) {
            String savechecksum = (String) session.getAttribute("checksum");
            long starttime = (Long) session.getAttribute("starttime");
            long nowtime = new Date().getTime();

            if ((savechecksum != null) && savechecksum.equals(checksum) && (nowtime - starttime) < 24 * 3600 * 1000) {
                status = true;
            }
        }

        return status;
    }

    /**
     * Method description edit
     *
     * @param userid
     * @return User
     */
    @RequiresPermissions(value = {"edituser"})
    @RequestMapping(
            value = "/edit",
            method = RequestMethod.GET
    )
    @ResponseBody
    public User edit(@RequestParam(
            value = "userid",
            required = true
    ) String userid) {
        User user = userService.selectByPrimaryKey(userid);

        return user;
    }

    /**
     * Method description email
     *
     * @param email
     * @param session
     * @return boolean
     */
    @RequestMapping(
            value = "/email",
            method = RequestMethod.POST
    )
    @ResponseBody
    public boolean email(@RequestParam(
            value = "email",
            required = true
    ) String email, HttpSession session) {
        boolean status = true;
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();

        criteria.andEmailEqualTo(email);

        List<User> users = userService.selectByExample(userExample);

        if ((users != null) && (users.size() > 0)) {
            status = false;
        }

        return status;
    }


    /**
     * Method description notpass
     *
     * @param userid
     * @return boolean
     * @throws Exception
     */
    @RequestMapping(
            value = "/notpass",
            method = RequestMethod.GET
    )
    @ResponseBody
    public boolean notpass(@RequestParam(
            value = "userid",
            required = true
    ) String userid) throws Exception {
        User user = userService.selectByPrimaryKey(userid);
        String userEmail = user.getEmail();
        String title = "天津医康互联接入平台用户审核通知";
        String text = "<div style='font-family:Microsoft YaHei'>亲爱的用户，您好！<br/>欢迎使用天津医康互联接入平台,你的用户审核<i style='color:red;font-size:20px;'>失败</i>，请重新申请！</div>";
        MailUtil.sendMail(title, text, userEmail);

        return userService.notPass(userid);
    }


    /**
     * Method description setpwd
     *
     * @param mailName
     * @param newPwd
     * @param checkPwd
     * @return boolean
     */
    @RequestMapping(
            value = "/setpwd",
            method = RequestMethod.POST
    )
    @ResponseBody
    public boolean setpwd(@RequestParam(
            value = "mailName",
            required = true
    ) String mailName, @RequestParam(
            value = "newPwd",
            required = true
    ) String newPwd, @RequestParam(
            value = "checkPwd",
            required = false
    ) String checkPwd) {
        boolean status = false;
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();

        criteria.andEmailEqualTo(mailName);

        List<User> users = userService.selectByExample(userExample);

        if ((users != null) && (users.size() >= 1)) {
            User user = users.get(0);
            String userName = user.getUsername();

            user.setPwd(Md5Util.getMD5(userName + newPwd));
            userService.updateByPrimaryKey(user);
            status = true;
        }

        return status;
    }

    /**
     * Method description uploadpic
     *
     * @param httpServletRequest
     * @param image
     * @param httpServletResponse
     * @param params
     * @param session
     * @return Map<String,List<Object>>
     */
    @RequestMapping(
            value = "/uploadpic",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map<String, List<Object>> uploadpic(HttpServletRequest httpServletRequest, @RequestParam(
            value = "image",
            required = true
    ) MultipartFile image, HttpServletResponse httpServletResponse, @RequestParam MultiValueMap<String, Object> params,
                                               HttpSession session) {
        Map<String, List<Object>> resultMap = new HashMap<>();

        resultMap = params;

        return resultMap;
    }

    /**
     * Method description view
     *
     * @param userid
     * @return UserView
     */
    @RequiresPermissions(value = {"deleteuser","createuser","edituser"},logical = Logical.OR)
    @RequestMapping(
            value = "/view",
            method = RequestMethod.GET
    )
    @ResponseBody
    public Map<String,Object> view(@RequestParam(
            value = "userid",
            required = true
    ) String userid) {
        Map<String,Object> result = new HashMap<>();
        result.put("user",userService.selectByPrimaryKey(userid));
        result.put("roles",roleService.selectAll());

        return result;
    }

    /**
     * Method description view
     *
     * @param userid
     * @return UserView
     */
    @RequiresPermissions(value = {"deleteuser"})
    @RequestMapping(
            value = "/delete",
            method = RequestMethod.GET
    )
    @ResponseBody
    public int delete(@RequestParam(
            value = "userid",
            required = true
    ) String userid) {

        return userService.delete(userid);
    }


    @RequestMapping(
            value = "/logout",
            method = RequestMethod.GET
    )
    @ResponseBody
    public Map<String,Object> logout() {
        Map<String,Object> result = new HashMap<>();
        shiroUserService.logout();

        result.put("status",true);
        return result;
    }

    @RequestMapping(
            value = "/checksoftkey",
            method = RequestMethod.GET
    )
    @ResponseBody
    public Map<String,Object> checksoftkey() {
        Map<String,Object> result = new HashMap<>();
        if(new File(ROOT_PATH+"softkey/lock.key").exists())
        	result.put("status",true);
        else
        	result.put("status",false);
        return result;
    }

    @RequestMapping(
            value = "/getstr",
            method = RequestMethod.GET
    )
    @ResponseBody
    public Map<String,Object> getStr() {
        Map<String,Object> result = new HashMap<>();

        result.put("status","jtang-user");
        return result;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
