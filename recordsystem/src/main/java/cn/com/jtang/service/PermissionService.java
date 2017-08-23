package cn.com.jtang.service;

import cn.com.jtang.exception.BaseException;
import cn.com.jtang.po.Authority;
import cn.com.jtang.po.Role;
import cn.com.jtang.po.RoleAuthorityKey;
import cn.com.jtang.po.User;
import cn.com.jtang.po.custom.PermissionExample;
import cn.com.jtang.po.permission.AuthGroupPermission;

import javax.naming.NoPermissionException;
import java.util.List;
import java.util.Map;

/**
 * Interface description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public interface PermissionService {

    List<AuthGroupPermission> selectAuthGroupPerm();

    List<Authority> selectAllPermissions();

    List<Authority> selectPermissionsByList(List<String> permissionList);

    List<Authority> selectByExample(PermissionExample example);

    List<Authority> selectPermissionsByRole(Role role);

    List<Authority> selectPermissionsByUser(User user);

    List<Role> selectRolesByUser(User user);

    boolean hasPermission(String permission, Role role) throws BaseException, NoPermissionException;

    boolean hasPermission(String permission, User user) throws BaseException;

    List<String> selectAuthoritiesByRole(int roleid);

    List<Authority> getAuthByUserGroup(String usergroup);

    List<String> getAuthIdsByUserGroup(String usergroupid);

    List<Authority> getAuthByAuthGroup(String authgroupid);

    Map getSelectedAuthsByUserid(String userid);

    void updateAccessControl(String userid, Map addmap);

    void addAccessControl(String userid, Map addmap);

    boolean checkPermission (String code);
}


//~ Formatted by Jindent --- http://www.jindent.com
