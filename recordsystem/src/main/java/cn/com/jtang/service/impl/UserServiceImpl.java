package cn.com.jtang.service.impl;

import cn.com.jtang.dao.UserMapper;
import cn.com.jtang.dao.custom.PermissionMapper;
import cn.com.jtang.dao.custom.UserViewMapper;
import cn.com.jtang.po.User;
import cn.com.jtang.po.UserExample;
import cn.com.jtang.po.custom.UserViewExample;
import cn.com.jtang.service.LogService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.MailUtil;
import cn.com.jtang.util.Md5Util;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.common.UserCreateForm;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Resource
    private UserViewMapper userViewMapper;
    @Resource
    private PermissionMapper permissionMapper;
    @Resource
    private LogService logService;

    @Override
    public void sendEmail(String userEmail) {
        String title = "天津医康互联接入平台用户审核通知";
        String text = "<div style='font-family:Microsoft YaHei'>亲爱的用户，您好！<br/>欢迎使用天津医康互联接入平台,你的用户审核<i style='font-size:20px;color:#2BA229;'>成功</i>。</div>";
        try {
            MailUtil.sendMail(title, text, userEmail);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int createUser(UserCreateForm userCreateForm, Boolean ispass) {
        User record = new User();
        record.setUserid(IDGenerator.generator());
        record.setUsername(userCreateForm.getTempusername());
        record.setPwd(Md5Util.getMD5(userCreateForm.getTempusername() + String.valueOf(userCreateForm.getUserpassword())));
        record.setRoleid(userCreateForm.getRole());
        record.setEmail(userCreateForm.getEmail());
        record.setPhone(userCreateForm.getPhone());
        record.setDescription(userCreateForm.getDescription());
        record.setCreatetime(new Date());
        record.setCheckresult(true);
        
        logService.insert("添加了用户（" + record.getUsername()+"）信息");

        return userMapper.insert(record);
    }

    @Override
    public int editUser(String userid, UserCreateForm form) throws IOException {
        User user = new User();

        user.setUserid(userid);
        user.setEmail(form.getEmail());
        user.setPhone(form.getPhone());
        user.setRoleid(form.getRole());
        user.setUsername(form.getTempusername());
        user.setDescription(form.getDescription());
        if(!StringUtils.isEmpty(form.getUserpassword())){
            user.setPwd(Md5Util.getMD5(form.getTempusername()+form.getUserpassword()));
        }
        logService.insert("修改了用户（" + user.getUsername()+"）信息");
        /*MultipartFile file = form.getApplydata();
        if (file != null) {
            String path = cn.com.jtang.util.FileUtils.getFilePath(user.getUserid());
            path += file.getOriginalFilename();
            cn.com.jtang.util.FileUtils.saveFile(file.getInputStream(), path);
            user.setApplydata(path);
        }*/

        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public int reRegisterUser(String userid, UserCreateForm userCreateForm) {

        User record = new User();

        record.setUserid(userid);

        /*String md5password = Md5Util.getMD5(userCreateForm.getTempusername() + String.valueOf(userCreateForm.getUserpassword()));
        record.setPwd(md5password);

        record.setCheckresult(null);*/

        return userViewMapper.updateByPrimaryKeySelective(record);

    }

    @Override
    public int delete(String userid) {
    	User user = selectByPrimaryKey(userid);
        logService.insert("删除了用户（" + user.getUsername()+"）");
        return userMapper.deleteByPrimaryKey(userid);
    }

    @Override
    public int deleteByExample(UserExample userexample) {

        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public final int deleteByPrimaryKey(String userid) {
    	User user = selectByPrimaryKey(userid);
        logService.insert("删除了用户（" + user.getUsername()+"）");
        return userMapper.deleteByPrimaryKey(userid);
    }

    @Override
    public final int insert(User record) {
        return userMapper.insert(record);
    }

    @Override
    public boolean notPass(String userid) {

        // TODO Auto-generated method stub
        User record = new User();

        record.setUserid(userid);
        record.setCheckresult(false);

        return (userMapper.updateByPrimaryKeySelective(record) == 1)
                ? true
                : false;
    }

    @Override
    public final List<User> selectByExample(UserExample example) {
        return userMapper.selectByExample(example);
    }

    @Override
    public final Page selectByExample(UserExample example, Page page) {
        page.retrievePage(userMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(userMapper.selectByExample(example));

        return page;
    }

    @Override
    public Page selectViewByExample(UserViewExample example, Page page) {
        page.retrievePage(userViewMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        page.setItems(userViewMapper.selectByExample(example));

        return page;
    }

    @Override
    public User selectByPrimaryKey(String userid) {
        User user = userMapper.selectByPrimaryKey(userid);

        return user;
    }

    /**
     * Method description selectByRoleid
     *
     * @param roleid
     * @return List<User>
     */
    public List<User> selectByRoleid(Integer roleid) {

        // TODO Auto-generated method stub
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();

        criteria.andRoleidEqualTo(roleid);

        List<User> users = userMapper.selectByExample(example);

        return users;
    }

    @Override
    public User selectByRoot(String userName, String mypassword, String companyid) {

        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public User selectByUserName(String userName) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();

        criteria.andUsernameEqualTo(userName);

        List<User> users = new ArrayList<User>();

        try {
            users = userMapper.selectByExample(example);
        } catch (Exception e) {

            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        if (users.size() == 0) {
            return null;
        }

        return users.get(0);
    }

    @Override
    public User selectByUserNameAndCompanyId(String userName, String companyid) {

        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<User> selectUserByEmail(String email) {

        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int updateByExampleSelective(User record, UserExample example) {

        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int updateByPrimaryKey(User record) {
        return userMapper.updateByPrimaryKey(record);
    }

    @Override
    public int updateByPrimaryKeySelective(User record) {

        // TODO Auto-generated method stub
        return userMapper.updateByPrimaryKeySelective(record);
    }


    @Override
    public boolean isExist(String name) {
        User user = selectByUserName(name);
        return user != null;
    }

    @Override
    public List<User> selectAll() {
        return userMapper.selectByExample(new UserExample());
    }

    @Override
    public List<User> selectByUserGroup(String usergroupid) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();

        criteria.andUsergroupEqualTo(usergroupid);

        return userMapper.selectByExample(example);
    }

    @Override
    public List<String> selectUserIdsByUserGroup(String usergroupid) {
        return permissionMapper.selectUserIdsByUserGroup(usergroupid);
    }

    @Override
    public List<User> selectByUserIds(List<String> originuserids) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();

        criteria.andUseridIn(originuserids);

        return userMapper.selectByExample(example);
    }

    /**
     * Method description isEmpty
     *
     * @param list
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
     * Method description isMoreThanOne
     *
     * @param list
     * @return boolean
     */
    private boolean isMoreThanOne(List<?> list) {
        if (isNullOrEmpty(list)) {
            return false;
        }

        if (list.size() > 1) {
            return true;
        }

        return false;
    }

    /**
     * Method description isNull
     *
     * @param object
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
     * @param list
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

    @Override
    public List<String> getCode(String userid, String recordtypeid) {
        return userMapper.getCode(userid, recordtypeid);
    }


}


//~ Formatted by Jindent --- http://www.jindent.com
