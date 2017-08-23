package cn.com.jtang.service.impl;

import cn.com.jtang.dao.RoleAuthorityMapper;
import cn.com.jtang.dao.RoleMapper;
import cn.com.jtang.dao.custom.PermissionMapper;
import cn.com.jtang.po.*;
import cn.com.jtang.service.RoleService;
import cn.com.jtang.service.ShiroRealm;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.RoleCreateForm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ZJUXP on 2016-07-28.
 */
@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;
    @Resource
    private RoleAuthorityMapper roleAuthorityMapper;
    @Resource
    private PermissionMapper permissionMapper;
    @Resource
    private ShiroRealm shiroRealm;
    @Resource
    private UserService userService;

    @Override
    public List<Role> selectAll() {
        return roleMapper.selectByExample(new RoleExample());
    }

    @Override
    public List<Role> selectByExample(RoleExample example) {
        return roleMapper.selectByExample(example);
    }

    @Override
    public Page selectByExample(RoleExample example, Page page) {
        page.retrievePage(roleMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(roleMapper.selectByExample(example));
        return page;
    }

    @Override
    public int createRole(RoleCreateForm roleCreateForm) {
        roleMapper.insertSelective(roleCreateForm);
        List<RoleAuthorityKey> roleAuthorityKeys = new ArrayList<>();
        for(String authorityId : roleCreateForm.getAuthorities()){
            RoleAuthorityKey key = new RoleAuthorityKey();
            key.setRoleid(roleCreateForm.getRoleid());
            key.setAuthorityid(authorityId);
            roleAuthorityKeys.add(key);
        }
        permissionMapper.insertBatch(roleAuthorityKeys);
        return 1;
    }

    @Override
    public int deleteByRoleId(int roleid) {

        roleMapper.deleteByPrimaryKey(roleid);

        return 1;
    }

    @Override
    public void modifyRolePermission(Integer roleid, List<String> originpermissions, List<String> authorities) {
        List<String> deleteList = new ArrayList<>();
        for(String op:originpermissions){
            if(!authorities.contains(op)){
                deleteList.add(op);
            }else{
                authorities.remove(op);
            }
        }

        //insert
        if(!authorities.isEmpty()){
            insertList(roleid,authorities);
        }

        //delete
        if(!deleteList.isEmpty()){
            deletelist(roleid,deleteList);
        }

        List<User> users = userService.selectByRoleid(roleid);
        for(User user : users){
            PrincipalCollection principals = new SimplePrincipalCollection(user.getUsername(), user.getUsername());
            shiroRealm.clearAuthz(principals);
        }
    }

    private void insertList(Integer roleid, List<String> authorities) {
        List<RoleAuthorityKey> roleAuths = new ArrayList<>();

        for(String auth : authorities){
            RoleAuthorityKey key = new RoleAuthorityKey();
            key.setRoleid(roleid);
            key.setAuthorityid(auth);
            roleAuths.add(key);
        }

        if(!roleAuths.isEmpty()){
            permissionMapper.insertBatch(roleAuths);
        }
    }

    private void deletelist(Integer roleid, List<String> deleteList) {
        RoleAuthorityExample example = new RoleAuthorityExample();
        RoleAuthorityExample.Criteria criteria = example.createCriteria();

        criteria.andRoleidEqualTo(roleid);
        criteria.andAuthorityidIn(deleteList);

        roleAuthorityMapper.deleteByExample(example);
    }
}
