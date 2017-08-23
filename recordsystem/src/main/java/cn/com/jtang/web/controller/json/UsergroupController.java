package cn.com.jtang.web.controller.json;

import cn.com.jtang.service.ShiroRealm;
import cn.com.jtang.service.ShiroUserService;
import cn.com.jtang.service.UserGroupService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.web.controller.form.UserGroupCreateForm;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("jsonUGController")
@RequestMapping("/json/usergroup")
public class UsergroupController {
    @Resource
    private ShiroRealm shiroRealm;
    @Resource
    private UserGroupService userGroupService;
    @Resource
    private UserService userService;


    @RequiresPermissions(value = {"createusergroup","editusergroup","deleteusergroup"},logical = Logical.OR)
    @RequestMapping(value = "/all", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> all(ModelMap model) {

        Map<String, Object> result = new HashMap<String, Object>();

        result.put("usergroups", userGroupService.selectAll());

        return result;

    }

    @RequiresPermissions(value = {"createusergroup"})
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> create(@ModelAttribute("ugCreateForm") UserGroupCreateForm ugCreateForm , ModelMap model) {

        Map<String, Object> result = new HashMap<String, Object>();

        result.put("status", userGroupService.create(ugCreateForm));

        return result;

    }

    @RequiresPermissions(value = {"deleteusergroup"})
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delete(@RequestParam(value = "usergroupid",required = true)String usergroupid, ModelMap model) {

        Map<String, Object> result = new HashMap<String, Object>();

        result.put("status", userGroupService.delete(usergroupid));

        return result;

    }
    @RequiresPermissions(value = {"editusergroup"})
    @RequestMapping(value = "/modifypermission", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> modifypermission(
            @RequestParam(value = "usergroupid",required = true)String usergroupid,
            @RequestParam(value = "originpermissions",required = true)List<String> originpermissions,
            @RequestParam(value = "authorities",required = true)List<String> authorities,
                                                ModelMap model) {

        Map<String, Object> result = new HashMap<String, Object>();

        userGroupService.modifyUGPermission(usergroupid,originpermissions,authorities);
        shiroRealm.clearAuthz();

        result.put("status", 1);

        return result;

    }

    @RequiresPermissions(value = {"editusergroup"})
    @RequestMapping(value = "/allocateuser", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> allocateuserget(@RequestParam(value = "usergroupid",required = true)String usergroupid,ModelMap model) {

        Map<String, Object> result = new HashMap<String, Object>();

        //userGroupService.allocateUser(usergroupid,originuserids,userids);

        result.put("users", userService.selectAll());
        result.put("containusers", userService.selectUserIdsByUserGroup(usergroupid));

        return result;

    }
    @RequiresPermissions(value = {"editusergroup"})
    @RequestMapping(value = "/allocateuser", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> allocateuser(
            @RequestParam(value = "usergroupid",required = true)String usergroupid,
            @RequestParam(value = "originuserids",required = true)List<String> originuserids,
            @RequestParam(value = "userids",required = true)List<String> userids,
                                                ModelMap model) {

        Map<String, Object> result = new HashMap<String, Object>();

        userGroupService.allocateUser(usergroupid,originuserids,userids);

        result.put("status", 1);

        return result;

    }
}


//~ Formatted by Jindent --- http://www.jindent.com
