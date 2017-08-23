package cn.com.jtang.dao.custom;

import cn.com.jtang.po.Authority;
import cn.com.jtang.po.Role;
import cn.com.jtang.po.RoleAuthorityKey;
import cn.com.jtang.po.UserGroupAuthKey;
import cn.com.jtang.po.custom.PermissionExample;
import cn.com.jtang.po.permission.AuthGroupPermission;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

/**
 * Interface description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public interface PermissionMapper {

    List<AuthGroupPermission> selectAuthGroupPerm();

    List<Authority> selectByExample(PermissionExample example);

    List<Role> selectRoleByExample(PermissionExample example);

    int insertBatch(@Param("roleAuths") List<RoleAuthorityKey> roleAuths);

    int insertUGBatch(@Param("ugAuths") List<UserGroupAuthKey> ugAuths);

    List<String> selectAuthidsByRole(int roleid);

    List<Authority> selectAuthByUserGroup(@Param("usergroupid") String usergroupid);

    List<String> selectAuthidsByUserGroup(@Param("usergroupid") String usergroupid);

    List<String> selectUserIdsByUserGroup(@Param("usergroupid") String usergroupid);

}


//~ Formatted by Jindent --- http://www.jindent.com
