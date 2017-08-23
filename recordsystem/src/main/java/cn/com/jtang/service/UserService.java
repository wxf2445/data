package cn.com.jtang.service;

import cn.com.jtang.po.CreateTable;
import cn.com.jtang.po.InsertExample;
import cn.com.jtang.po.User;
import cn.com.jtang.po.UserExample;
import cn.com.jtang.po.custom.UserViewExample;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.common.UserCreateForm;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * Interface description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public interface UserService {

    void sendEmail(String email);

    int createUser(UserCreateForm userCreateForm, Boolean ispass);

    int editUser(String userid, UserCreateForm userCreateForm) throws IOException;

    int reRegisterUser(String userid, UserCreateForm userCreateForm);

    int delete(String userid);

    int deleteByExample(UserExample userexample);

    int deleteByPrimaryKey(String userid);

    int insert(User record);

    boolean notPass(String userid);

    List<User> selectByExample(UserExample example);

    Page selectByExample(UserExample example, Page page);

    Page selectViewByExample(UserViewExample example, Page page);

    User selectByPrimaryKey(String userid);

    List<User> selectByRoleid(Integer roleid);

    User selectByRoot(String userName, String mypassword, String companyid);

    User selectByUserName(String userName);

    User selectByUserNameAndCompanyId(String userName, String companyid);

    List<User> selectUserByEmail(String email);

    int updateByExampleSelective(User record, UserExample example);

    int updateByPrimaryKey(User record);

    int updateByPrimaryKeySelective(User record);

    boolean isExist(String name);

    List<User> selectAll();

    List<User> selectByUserGroup(String usergroupid);

    List<String> selectUserIdsByUserGroup(String usergroupid);

    List<User> selectByUserIds(List<String> originuserids);
    
    List<String> getCode(String userid,String recordtypeid);
}


//~ Formatted by Jindent --- http://www.jindent.com
