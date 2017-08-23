package cn.com.jtang.service;

import cn.com.jtang.po.Authority;
import cn.com.jtang.po.Role;
import cn.com.jtang.po.User;
import cn.com.jtang.po.UserGroupAuthKey;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.ArrayList;
import java.util.List;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public class ShiroRealm extends AuthorizingRealm {
    private ShiroUserService shiroUserService;
    private UserService userService;
    private PermissionService permissionService;


   /* private String prefix;

    public void setKeyPrefix(String prefix) {
        this.prefix = prefix;
    }

    @Override
    protected Object getAuthorizationCacheKey(PrincipalCollection principals) {
        return super.getAuthorizationCacheKey(principals) + prefix;
    }*/


    /**
     * ��֤�ص�����,��¼ʱ����.
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
            throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        User user;

        user = shiroUserService.getAuthenticatedUser(authcToken);
        System.out.println(" doGetAuthenticationInfo:" + user.getUsername());
        return new SimpleAuthenticationInfo(user.getUsername(),
                String.valueOf(token.getPassword()),
                user.getUsername());

        /*
         * if
         * (!"superadmin".equals(username)&&!"app".equals(username)&&!"hospital"
         * .equals(username)) { throw new AuthorizationException("���û�������"); }
         * else if(!"123".equals(password)){ throw new
         * AuthorizationException("�������"); } return new
         * SimpleAuthenticationInfo(username, password, username);
         */
    }

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        // ��ȡ��ǰ��¼���û���
        System.out.println("To doGetAuthorizationInfo:");
        String userName = (String) getAvailablePrincipal(principals);
        User user = userService.selectByUserName(userName);
        List<Role> roles = permissionService.selectRolesByUser(user);
        List<Authority> auths = permissionService.selectPermissionsByUser(user);
        List<Authority> userGroupAuthKeys = permissionService.getAuthByUserGroup(user.getUsergroup());

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        boolean isHos = false;
        if (user != null) {
            for (Role role : roles) {
                info.addRole(role.getCode());
            }
            List<String> permissions = new ArrayList<>();
            for (Authority auth : auths) {
                permissions.add(auth.getCode());
            }

            for(Authority auth:userGroupAuthKeys){
                if(!permissions.contains(auth.getCode())){
                    permissions.add(auth.getCode());
                }
            }
            info.addStringPermissions(permissions);
            /*if (isHos) {
                Hospital hospital = hospitalService.selectByContactUserid(user.getUserid());
                if (hospital != null && hospital.getCheckstatus() != null && hospital.getCheckstatus()) {
                    info.addStringPermission("hoscheckpass");
                }
            }*/
            System.out.println(" doGetAuthorizationInfo:" + user.getUsername());

            return info;
        }

        return null;

        /*
         * SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
         * if("superadmin".equals(userName)){ info.addRole("SUPER ADMIN"); }
         * else if("app".equals(userName)){ info.addRole("APP"); } else
         * if("hospital".equals(userName)){ info.addRole("HOSPITAL"); } return
         * info;
         */
    }
    public void clearAuthz() {
        this.clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
    }
    public void clearAuthz(PrincipalCollection principalCollection) {
        this.clearCachedAuthorizationInfo(principalCollection);
    }
    /**
     * Method description getPermissionService
     *
     * @return PermissionService
     */
    public PermissionService getPermissionService() {
        return permissionService;
    }

    /**
     * Method description setPermissionService
     *
     * @param permissionService
     */
    public void setPermissionService(PermissionService permissionService) {
        this.permissionService = permissionService;
    }

    /**
     * Method description getShiroUserService
     *
     * @return ShiroUserService
     */
    public ShiroUserService getShiroUserService() {
        return shiroUserService;
    }

    /**
     * Method description setShiroUserService
     *
     * @param shiroUserService
     */
    public void setShiroUserService(ShiroUserService shiroUserService) {
        this.shiroUserService = shiroUserService;
    }

    /**
     * Method description getUserService
     *
     * @return UserService
     */
    public UserService getUserService() {
        return userService;
    }

    /**
     * Method description setUserService
     *
     * @param userService
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
