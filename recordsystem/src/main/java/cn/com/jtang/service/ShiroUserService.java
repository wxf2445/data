package cn.com.jtang.service;

import cn.com.jtang.po.Authority;
import cn.com.jtang.po.User;

import org.apache.shiro.authc.AuthenticationToken;

import java.util.List;

/**
 * Interface description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public interface ShiroUserService {
    User getAuthenticatedUser(AuthenticationToken authcToken);

    User getLoginUser();

    User getSuperUser();

    void setUserSessionPermission(List<Authority> permissions);

    List<Authority> getUserSessionPermission();
    
    List<String> getCode(String userid,String recordtypeid);

    void logout ();
    /*boolean checkPermission(String code);*/
}


//~ Formatted by Jindent --- http://www.jindent.com
