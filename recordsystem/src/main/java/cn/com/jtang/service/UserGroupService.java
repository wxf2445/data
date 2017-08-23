package cn.com.jtang.service;

import cn.com.jtang.po.Authority;
import cn.com.jtang.po.UserGroup;
import cn.com.jtang.po.UserGroupExample;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.UserGroupCreateForm;

import java.util.List;

/**
 * Created by ZJUXP on 2016-08-01.
 */
public interface UserGroupService {
    UserGroup selectByPrimaryKey(String userGroupId);

    List<UserGroup> selectAll();

    int insert(UserGroup userGroup);

    int deleteByPrimaryKey(String userGroupId);

    int updateByExample(UserGroup userGroup, UserGroupExample example);

    int updateByPrimaryKey(UserGroup userGroup);

    Page selectByExample(UserGroupExample usergroupExample, Page pageObject);

    int create(UserGroupCreateForm ugCreateForm);

    int delete(String usergroupid);

    void modifyUGPermission(String usergroupid, List<String> originpermissions, List<String> authorities);

    void allocateUser(String usergroupid, List<String> originuserids, List<String> userids);

}
