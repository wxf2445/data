package cn.com.jtang.dao.custom;

import cn.com.jtang.po.User;
import cn.com.jtang.po.custom.UserView;
import cn.com.jtang.po.custom.UserViewExample;

import java.util.List;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface UserViewMapper {

    int updateByPrimaryKeySelective(User record);

    int countAllByExample(UserViewExample example);

    int countByExample(UserViewExample example);

    int countByExample(UserViewExample example, String companyid);

    List<UserView> selectByExample(UserViewExample example);

    List<UserView> selectByExample2(UserViewExample example);

    UserView selectByPrimaryKey(String userid);

    UserView selectByPrimaryKey2(String userid);

}


//~ Formatted by Jindent --- http://www.jindent.com
