package cn.com.jtang.service;

import cn.com.jtang.po.Role;
import cn.com.jtang.po.RoleExample;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.RoleCreateForm;

import java.util.List;

/**
 * Created by ZJUXP on 2016-07-28.
 */
public interface RoleService {

    List<Role> selectAll();

    List<Role> selectByExample(RoleExample example);

    Page selectByExample(RoleExample example, Page page);

    int createRole(RoleCreateForm roleCreateForm);

    int deleteByRoleId(int roleid);

    void modifyRolePermission(Integer roleid, List<String> originpermissions, List<String> authorities);
}
