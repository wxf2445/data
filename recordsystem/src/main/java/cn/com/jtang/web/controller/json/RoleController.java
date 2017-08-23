package cn.com.jtang.web.controller.json;

import cn.com.jtang.po.LogExample;
import cn.com.jtang.po.Role;
import cn.com.jtang.po.RoleExample;
import cn.com.jtang.po.User;
import cn.com.jtang.po.UserExample;
import cn.com.jtang.service.LogService;
import cn.com.jtang.service.RoleService;
import cn.com.jtang.service.ShiroRealm;
import cn.com.jtang.service.ShiroUserService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.MailUtil;
import cn.com.jtang.util.Md5Util;
import cn.com.jtang.web.controller.form.RoleCreateForm;
import cn.com.jtang.web.controller.form.common.UserCreateForm;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
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
@Controller("jsonRoleController")
@RequestMapping("/json/role")
public class RoleController {
    @Resource
    private RoleService roleService;
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private LogService logService;


    @RequiresPermissions(value = {"createrole","editrole","deleterole"},logical = Logical.OR)
    @RequestMapping(value = "/all", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> all(ModelMap model) {

        Map<String, Object> result = new HashMap<String, Object>();

        result.put("roles", roleService.selectAll());

        return result;

    }

    @RequiresPermissions(value = {"createrole"})
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> create(@ModelAttribute("roleCreateForm") RoleCreateForm roleCreateForm ,ModelMap model) {

        Map<String, Object> result = new HashMap<String, Object>();
        
        logService.insert("创建了角色---" + roleCreateForm.getName());

        result.put("status", roleService.createRole(roleCreateForm));

        return result;

    }

    @RequiresPermissions(value = {"deleterole"})
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> delete(@RequestParam(value = "roleid",required = true)Integer roleid, ModelMap model) {

        Map<String, Object> result = new HashMap<String, Object>();

		RoleExample example = new RoleExample();
		RoleExample.Criteria criteria = example.createCriteria();
        List<Role> roles = roleService.selectByExample(example);
        
        logService.insert("删除了角色（" + roles.get(0).getName()+"）");
        result.put("status", roleService.deleteByRoleId(roleid));

        return result;

    }
    @RequiresPermissions(value = {"editrole"})
    @RequestMapping(value = "/modifypermission", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> modifypermission(
            @RequestParam(value = "roleid",required = true)Integer roleid,
            @RequestParam(value = "originpermissions",required = true)List<String> originpermissions,
            @RequestParam(value = "authorities",required = true)List<String> authorities,
                                                ModelMap model) {

        Map<String, Object> result = new HashMap<String, Object>();

        roleService.modifyRolePermission(roleid,originpermissions,authorities);
		RoleExample example = new RoleExample();
		RoleExample.Criteria criteria = example.createCriteria();
        List<Role> roles = roleService.selectByExample(example);
        
        logService.insert("修改了角色（" + roles.get(0).getName()+"）权限信息");

        result.put("status", 1);

        return result;

    }
}


//~ Formatted by Jindent --- http://www.jindent.com
