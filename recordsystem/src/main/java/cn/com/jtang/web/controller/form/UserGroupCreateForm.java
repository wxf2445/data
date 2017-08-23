package cn.com.jtang.web.controller.form;

import cn.com.jtang.po.UserGroup;

import java.util.List;

/**
 * Created by ZJUXP on 2016-08-02.
 */
public class UserGroupCreateForm extends UserGroup {

    public List<String> authorities;

    public List<String> getAuthorities() {
        return authorities;
    }

    public void setAuthorities(List<String> authorities) {
        this.authorities = authorities;
    }

}
