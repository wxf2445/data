package cn.com.jtang.service.impl;

import cn.com.jtang.dao.AccessControlMapper;
import cn.com.jtang.dao.AuthorityMapper;
import cn.com.jtang.dao.RoleMapper;
import cn.com.jtang.dao.UserMapper;
import cn.com.jtang.dao.custom.PermissionMapper;
import cn.com.jtang.exception.BaseException;
import cn.com.jtang.exception.NoExistException;
import cn.com.jtang.po.*;
import cn.com.jtang.po.custom.PermissionExample;
import cn.com.jtang.po.permission.AuthGroupPermission;
import cn.com.jtang.resulthandler.AccessResultHandler;
import cn.com.jtang.service.PermissionService;
import cn.com.jtang.service.ShiroUserService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.naming.NoPermissionException;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Class description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
@Service("permissionService")
@Transactional
public class PermissionServiceImpl implements PermissionService {
    @Resource
    private UserMapper       userMapper;
    @Resource
    private RoleMapper       roleMapper;
    @Resource
    private AuthorityMapper  authorityMapper;
    @Resource
    private PermissionMapper permissionMapper;
    @Resource
    private AccessControlMapper accessControlMapper;
    @Resource
    private ShiroUserService shiroUserService;

    @Override
    public List<AuthGroupPermission> selectAuthGroupPerm() {
        return permissionMapper.selectAuthGroupPerm();
    }

    @Override
    public List<Authority> selectAllPermissions() {
        return authorityMapper.selectByExample(new AuthorityExample());
    }

    @Override
    public List<Authority> selectPermissionsByList(List<String> permissionList) {
        AuthorityExample example = new AuthorityExample();
        AuthorityExample.Criteria criteria = example.createCriteria();

        criteria.andCodeIn(permissionList);
        return authorityMapper.selectByExample(example);
    }

    @Override
    public List<Authority> selectByExample(PermissionExample example) {
        return permissionMapper.selectByExample(example);
    }

    @Override
    public List<Authority> selectPermissionsByRole(Role role) {
        PermissionExample example = new PermissionExample();

        example.setRole(role);
        example.setDistinct(true);

        return permissionMapper.selectByExample(example);
    }

    @Override
    public List<Authority> selectPermissionsByUser(User user) {
        PermissionExample example = new PermissionExample();

        example.setUser(user);
        example.setDistinct(true);

        return permissionMapper.selectByExample(example);
    }

    @Override
    public List<Role> selectRolesByUser(User user) {
        PermissionExample example = new PermissionExample();

        example.setUser(user);
        example.setDistinct(true);

        return permissionMapper.selectRoleByExample(example);
    }

    /**
     * Method description isAuthorityExist
     *
     *
     * @param permission
     *
     * @return boolean 
     */
    private boolean isAuthorityExist(String permission) {
        AuthorityExample          example  = new AuthorityExample();
        AuthorityExample.Criteria criteria = example.createCriteria();

        criteria.andCodeEqualTo(permission);

        List<Authority> authorityList = authorityMapper.selectByExample(example);

        if (isNullOrEmpty(authorityList)) {
            return false;
        }

        if (authorityList.size() != 1) {
            return false;
        }

        return true;
    }

    /**
     * Method description isEmpty
     *
     *
     * @param list
     *
     * @return boolean 
     */
    private boolean isEmpty(List<?> list) {
        if (isNull(list)) {
            return true;
        } else {
            return list.isEmpty();
        }
    }

    /**
     * Method description isNull
     *
     *
     * @param object
     *
     * @return boolean 
     */
    private boolean isNull(Object object) {
        if (object == null) {
            return true;
        }

        return false;
    }

    /**
     * Method description isNullOrEmpty
     *
     *
     * @param list
     *
     * @return boolean 
     */
    private boolean isNullOrEmpty(List<?> list) {
        if (isNull(list)) {
            return true;
        }

        if (isEmpty(list)) {
            return true;
        }

        return false;
    }

    /**
     * Method description hasPermission
     *
     *
     * @param example
     *
     * @return boolean 
     */
    private boolean hasPermission(PermissionExample example) {
        example.setDistinct(true);

        List<Authority> permissionList = permissionMapper.selectByExample(example);

        if ((permissionList != null) &&!permissionList.isEmpty()) {
            return true;
        }

        return false;
    }

    @Override
    public boolean hasPermission(String permission, Role role) throws BaseException, NoPermissionException {
        if (!isRoleExist(role)) {
            throw new NoExistException("Role: " + role.getRoleid());
        }

        if (!isAuthorityExist(permission)) {
            throw new NoExistException("Authority: " + permission);
        }

        PermissionExample example = new PermissionExample();

        example.setRole(role);
        example.setPermission(permission);

        boolean hasPermission = hasPermission(example);

        if (!hasPermission) {
            throw new NoPermissionException("Role " + role.getRoleid() + " has no permission '" + permission + "'");
        }

        return true;
    }

    @Override
    public boolean hasPermission(String permission, User user) throws BaseException {
        if (!isUserExist(user)) {
            throw new NoExistException("User: " + user.getUserid());
        }

        if (!isAuthorityExist(permission)) {
            throw new NoExistException("Authority: " + permission);
        }

        PermissionExample example = new PermissionExample();

        example.setUser(user);
        example.setPermission(permission);

        boolean hasPermission = hasPermission(example);

       /* if (!hasPermission) {
            throw new NoPermissionException("User " + user.getUserid() + " has no permission '" + permission + "'");
        }*/

        return hasPermission;
    }

    @Override
    public List<String> selectAuthoritiesByRole(int roleid) {

        return permissionMapper.selectAuthidsByRole(roleid);
    }

    @Override
    public List<Authority> getAuthByUserGroup(String usergroup) {
        return permissionMapper.selectAuthByUserGroup(usergroup);
    }

    @Override
    public List<String> getAuthIdsByUserGroup(String usergroupid) {
        return permissionMapper.selectAuthidsByUserGroup(usergroupid);
    }

    @Override
    public List<Authority> getAuthByAuthGroup(String authgroupid) {
        AuthorityExample example = new AuthorityExample();
        AuthorityExample.Criteria criteria = example.createCriteria();

        criteria.andAuthgroupidEqualTo(authgroupid);

        return authorityMapper.selectByExample(example);
    }

    @Override
    public Map getSelectedAuthsByUserid(String userid) {
        AccessResultHandler accessResultHandler = new AccessResultHandler();
        accessControlMapper.getSelectedAuths(userid,accessResultHandler);
        return accessResultHandler.getMappedResults();
    }

    @Override
    public void updateAccessControl(String userid, Map addmap) {
        Set<String> keys = addmap.keySet();
        for(String key:keys){
            String authids = (String)addmap.get(key);
            AccessControl accessControl = new AccessControl();
            accessControl.setUserid(userid);
            accessControl.setRecordtypeid(key);
            accessControl.setAccesspermission(authids);
            int i = accessControlMapper.updateByPrimaryKey(accessControl);
            if(i==0){
                accessControlMapper.insert(accessControl);
            }
        }
    }

    @Override
    public void addAccessControl(String userid, Map addmap) {
        Set<String> keys = addmap.keySet();
        for(String key:keys){
            String authids = (String)addmap.get(key);
            AccessControl accessControl = new AccessControl();
            accessControl.setUserid(userid);
            accessControl.setRecordtypeid(key);
            accessControl.setAccesspermission(authids);
            accessControlMapper.insert(accessControl);
        }
    }


    /**
     * Method description isRoleExist
     *
     *
     * @param role
     *
     * @return boolean 
     */
    private boolean isRoleExist(Role role) {
        RoleExample          example  = new RoleExample();
        RoleExample.Criteria criteria = example.createCriteria();

        criteria.andRoleidEqualTo(role.getRoleid());

        List<Role> roleList = roleMapper.selectByExample(example);

        if (isNullOrEmpty(roleList)) {
            return false;
        }

        if (roleList.size() != 1) {
            return false;
        }

        return true;
    }

    /**
     * Method description isUserExist
     *
     *
     * @param user
     *
     * @return boolean 
     */
    private boolean isUserExist(User user) {
        UserExample          example  = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();

        criteria.andUseridEqualTo(user.getUserid());

        List<User> userList = userMapper.selectByExample(example);

        if (isNullOrEmpty(userList)) {
            return false;
        }

        if (userList.size() != 1) {
            return false;
        }

        return true;
    }

	@Override
	public boolean checkPermission(String code) {
        PermissionExample example = new PermissionExample();

        example.setUser(shiroUserService.getLoginUser());
        example.setDistinct(true);
        List<Authority> authoritys = permissionMapper.selectByExample(example);
        for(Authority authority:authoritys){
        	if(authority.getCode().equals(code))
        		return true;
        }
		return false;
	}
}


//~ Formatted by Jindent --- http://www.jindent.com
