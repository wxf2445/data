package cn.com.jtang.service.impl;

import cn.com.jtang.dao.UserGroupAuthMapper;
import cn.com.jtang.dao.UserGroupMapper;
import cn.com.jtang.dao.UserMapper;
import cn.com.jtang.dao.custom.PermissionMapper;
import cn.com.jtang.po.*;
import cn.com.jtang.service.ShiroRealm;
import cn.com.jtang.service.UserGroupService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.UserGroupCreateForm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by ZJUXP on 2016-08-01.
 */
@Service("userGroupService")
@Transactional
public class UserGroupServiceImpl implements UserGroupService {
    @Resource
    private UserMapper userMapper;
    @Resource
    private UserGroupMapper userGroupMapper;
    @Resource
    private UserGroupAuthMapper userGroupAuthMapper;
    @Resource
    private PermissionMapper permissionMapper;
    @Resource
    private UserService userService;
    @Resource
    private ShiroRealm shiroRealm;

    @Override
    public UserGroup selectByPrimaryKey(String userGroupId) {
        return userGroupMapper.selectByPrimaryKey(userGroupId);
    }

    @Override
    public List<UserGroup> selectAll() {
        return userGroupMapper.selectByExample(new UserGroupExample());
    }

    @Override
    public int insert(UserGroup userGroup) {
        return userGroupMapper.insert(userGroup);
    }

    @Override
    public int deleteByPrimaryKey(String userGroupId) {
        return userGroupMapper.deleteByPrimaryKey(userGroupId);
    }

    @Override
    public int updateByExample(UserGroup userGroup, UserGroupExample example) {
        return userGroupMapper.updateByExample(userGroup, example);
    }

    @Override
    public int updateByPrimaryKey(UserGroup userGroup) {
        return userGroupMapper.updateByPrimaryKey(userGroup);
    }

    @Override
    public Page selectByExample(UserGroupExample example, Page page) {
        page.retrievePage(userGroupMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(userGroupMapper.selectByExample(example));

        return page;
    }

    @Override
    public int create(UserGroupCreateForm ugCreateForm) {
        ugCreateForm.setId(IDGenerator.generator());
        ugCreateForm.setCreatetime(new Date());
        userGroupMapper.insert(ugCreateForm);

        List<UserGroupAuthKey> ugs = new ArrayList<>();
        for (String auth : ugCreateForm.getAuthorities()) {
            UserGroupAuthKey userGroupAuthKey = new UserGroupAuthKey();
            userGroupAuthKey.setUsergroupid(ugCreateForm.getId());
            userGroupAuthKey.setAuthid(auth);

            ugs.add(userGroupAuthKey);
        }

        if (ugs != null && !ugs.isEmpty()) {
            permissionMapper.insertUGBatch(ugs);
        }

        return 1;
    }

    @Override
    public int delete(String usergroupid) {

        return userGroupMapper.deleteByPrimaryKey(usergroupid);
    }

    @Override
    public void modifyUGPermission(String usergroupid, List<String> originpermissions, List<String> authorities) {
        List<String> deleteList = new ArrayList<>();
        for (String op : originpermissions) {
            if (!authorities.contains(op)) {
                deleteList.add(op);
            } else {
                authorities.remove(op);
            }
        }

        //insert
        if (!authorities.isEmpty()) {
            insertList(usergroupid, authorities);
        }

        //delete
        if (!deleteList.isEmpty()) {
            deletelist(usergroupid, deleteList);
        }

        List<User> users = userService.selectByUserGroup(usergroupid);
        for (User user : users) {
            PrincipalCollection principals = new SimplePrincipalCollection(user.getUsername(), user.getUsername());
            shiroRealm.clearAuthz(principals);
        }
    }

    @Override
    public void allocateUser(String usergroupid, List<String> originuserids, List<String> userids) {
        //update user`s usergroup
        Iterator<String> it = originuserids.iterator();
        while (it.hasNext()) {
            String userid = it.next();
            if (userids.contains(userid)) {
                it.remove();
                userids.remove(userid);
            }
        }

        //update null
        if (!originuserids.isEmpty()) {
            updateUserList(originuserids, null);
        }
        //update new
        if (!userids.isEmpty()) {
            updateUserList(userids, usergroupid);
        }
        originuserids.addAll(userids);
        List<User> users = userService.selectByUserIds(originuserids);
        for (User user : users) {
            PrincipalCollection principals = new SimplePrincipalCollection(user.getUsername(), user.getUsername());
            shiroRealm.clearAuthz(principals);
        }
    }


    private void updateUserList(List<String> userids, String usergroupid) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();

        criteria.andUseridIn(userids);

        User user = new User();
        user.setUsergroup(usergroupid);

        userMapper.updateByExampleSelective2(user, example);
    }


    private void insertList(String usergroupid, List<String> authorities) {
        List<UserGroupAuthKey> ugAuths = new ArrayList<>();

        for (String auth : authorities) {
            UserGroupAuthKey key = new UserGroupAuthKey();
            key.setAuthid(auth);
            key.setUsergroupid(usergroupid);
            ugAuths.add(key);
        }

        if (!ugAuths.isEmpty()) {
            permissionMapper.insertUGBatch(ugAuths);
        }
    }

    private void deletelist(String usergroupid, List<String> deleteList) {
        UserGroupAuthExample example = new UserGroupAuthExample();
        UserGroupAuthExample.Criteria criteria = example.createCriteria();

        criteria.andUsergroupidEqualTo(usergroupid);
        criteria.andAuthidIn(deleteList);

        userGroupAuthMapper.deleteByExample(example);
    }

}
