package cn.com.jtang.service.impl;

import cn.com.jtang.po.Authority;
import cn.com.jtang.po.User;
import cn.com.jtang.service.ShiroUserService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.Md5Util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Service("shiroUserService")
public class ShiroUserServiceImpl implements ShiroUserService {
    @Resource
    private UserService userService;

    @Override
    public User getAuthenticatedUser(AuthenticationToken authcToken) {

        // TODO Auto-generated method stub
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        String md5password = Md5Util.getMD5(token.getUsername() + String.valueOf(token.getPassword()));
        User user = userService.selectByUserName(token.getUsername());

        if (user == null) {
            throw new AuthenticationException("usernameorpassword.not.match");
        } else if (!user.getPwd().equals(md5password)) {
            throw new AuthenticationException("usernameorpassword.not.match");
        } else if ((user.getCheckresult() == null)) {
            throw new AuthenticationException("account.not.activate");
        } else if(!user.getCheckresult()){
            throw new AuthenticationException("account.notPass");
        }

        return user;
    }

    @Override
    public User getLoginUser() {

        // TODO Auto-generated method stub
        org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();

        String username = (String) my.getPrincipal();

        if (username == null) {
            return null;
        }

        return userService.selectByUserName(username);
    }

    @Override
    public User getSuperUser() {

        // TODO Auto-generated method stub
        List<User> users = userService.selectByRoleid(1);

        if (users.size() == 1) {
            return users.get(0);
        }

        return null;
    }

    @Override
    public void setUserSessionPermission(List<Authority> permissions) {
        org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();
        my.getSession(true).setAttribute("permissions",permissions);
    }

    @Override
    public List<Authority> getUserSessionPermission() {
        org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();
        return (List<Authority>) my.getSession().getAttribute("permissions");
    }

/*   
    }*/
    
	@Override
	public List<String> getCode(String userid,String recordtypeid) {
		return userService.getCode(userid,recordtypeid);
	}

    @Override
    public void logout () {
        SecurityUtils.getSubject().logout();
    }

/*	@Override
	public boolean checkPermission(String code) {
        org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();
        List<Authority> as = (List<Authority>) my.getSession().getAttribute("permissions");
		 for(Authority a:as){
	    	if(a.getCode().equals(code))
	    		return true;
		 }
		return false;
	}*/
}


//~ Formatted by Jindent --- http://www.jindent.com
