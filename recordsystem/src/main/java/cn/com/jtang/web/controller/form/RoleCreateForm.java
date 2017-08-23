package cn.com.jtang.web.controller.form;

import cn.com.jtang.po.Authority;
import cn.com.jtang.po.Role;

import java.util.List;

/**
 * Created by ZJUXP on 2016-07-29.
 */
public class RoleCreateForm extends Role {

    public List<String> authorities;

    public List<String> getAuthorities() {
        return authorities;
    }

    public void setAuthorities(List<String> authorities) {
        this.authorities = authorities;
    }

}
