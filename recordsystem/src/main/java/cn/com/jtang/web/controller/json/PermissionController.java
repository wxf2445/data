package cn.com.jtang.web.controller.json;

import cn.com.jtang.exception.BaseException;
import cn.com.jtang.po.User;
import cn.com.jtang.po.custom.RecordTree;
import cn.com.jtang.service.LogService;
import cn.com.jtang.service.PermissionService;
import cn.com.jtang.service.RecordTypeService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.RecordUtil;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.naming.NoPermissionException;

import java.util.HashMap;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller("jsonPermissionController")
@RequestMapping("/json/permission")
@SessionAttributes({
        "searchForm"
})
public class PermissionController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private PermissionService permissionService;
    @Resource
    private UserService userService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private LogService logService;

    @RequestMapping(
            value = "/all",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map getAll() {
        boolean status = true;

        Map result = new HashMap<>();

        result.put("allpermissions", permissionService.selectAuthGroupPerm());

        return result;
    }

    @RequestMapping(
            value = "/modify",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map modify(@RequestParam(value = "roleid", required = true) Integer roleid) {
        boolean status = true;

        Map result = new HashMap<>();

        result.put("permissions", permissionService.selectAuthoritiesByRole(roleid));
        result.put("allpermissions", permissionService.selectAuthGroupPerm());

        return result;
    }

    @RequestMapping(
            value = "/modifyByGroup",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map modify(@RequestParam(value = "usergroupid", required = true) String usergroupid) {
        boolean status = true;

        Map result = new HashMap<>();

        result.put("permissions", permissionService.getAuthIdsByUserGroup(usergroupid));
        result.put("allpermissions", permissionService.selectAuthGroupPerm());

        return result;
    }

    @RequestMapping(
            value = "/bygroup",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map bygroup(@RequestParam(value = "usergroupid", required = true) String usergroupid) {
        boolean status = true;

        Map result = new HashMap<>();

        result.put("allpermissions", permissionService.selectAuthGroupPerm());
        result.put("permissions", permissionService.getAuthIdsByUserGroup(usergroupid));

        return result;
    }

    @RequestMapping(
            value = "/byrole",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map byrole(@RequestParam(value = "roleid", required = true) Integer roleid) {
        boolean status = true;

        Map result = new HashMap<>();

        result.put("allpermissions", permissionService.selectAuthGroupPerm());
        result.put("permissions", permissionService.selectAuthoritiesByRole(roleid));

        return result;
    }

    @RequestMapping(
            value = "/byuser",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map byuser(@RequestParam(value = "useid", required = true) String userid) {
        boolean status = true;

        Map result = new HashMap<>();

        User user = new User();
        user.setUserid(userid);
        result.put("permissions", permissionService.selectPermissionsByUser(user));

        return result;
    }

    @RequestMapping(
            value = "/userrtcontrol",
            method = RequestMethod.GET
    )
    @ResponseBody
    public Map userrtcontrol(@RequestParam(value = "userid", required = true) String userid) throws NoPermissionException, BaseException {
        boolean status = true;

        Map result = new HashMap<>();
        RecordTree recordTree = new RecordTree();
        recordTree.setFondss(recordTypeService.getAllBasicField());
        User user = new User();
        user.setUserid(userid);
        result.put("hasARPermission", permissionService.hasPermission("accessrecord",user));
        result.put("accesscontrol", recordTree);
        result.put("recordTypes", recordTypeService.selectIds());
        result.put("auths", permissionService.getAuthByAuthGroup(RecordUtil.ACCESS_CONTROL));
        result.put("selectedauths", permissionService.getSelectedAuthsByUserid(userid));
        return result;
    }

    @RequestMapping(
            value = "/userrtcontrol",
            method = RequestMethod.POST
    )
    @ResponseBody
    public Map userrtcontrolpost(@RequestBody Map map) {
        boolean status = true;

        Map result = new HashMap<>();

        permissionService.updateAccessControl((String) map.get("userid"), (Map) map.get("updatemap"));
        logService.insert("修改了"+userService.selectByPrimaryKey((String)map.get("userid")).getUsername()+"的权限");
        //permissionService.addAccessControl((String) map.get("userid"), (Map) map.get("addmap"));
        result.put("status", true);
        return result;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
