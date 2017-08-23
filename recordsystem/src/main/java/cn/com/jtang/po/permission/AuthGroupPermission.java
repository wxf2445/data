package cn.com.jtang.po.permission;

import cn.com.jtang.po.Authority;

import java.util.List;

/**
 * Created by ZJUXP on 2016-08-10.
 */
public class AuthGroupPermission {

    String groupid;
    String groupname;
    List<Authority> authorityList;

    public String getGroupid() {
        return groupid;
    }

    public void setGroupid(String groupid) {
        this.groupid = groupid;
    }

    public List<Authority> getAuthorityList() {
        return authorityList;
    }

    public void setAuthorityList(List<Authority> authorityList) {
        this.authorityList = authorityList;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname;
    }

}
