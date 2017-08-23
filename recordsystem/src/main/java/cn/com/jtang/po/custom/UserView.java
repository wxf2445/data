package cn.com.jtang.po.custom;

import cn.com.jtang.po.Role;
import cn.com.jtang.po.User;

/**
 * Class description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public class UserView extends User {
    Role role;

    /**
     * Method description getRole
     *
     *
     * @return Role 
     */
    public Role getRole() {
        return role;
    }

    /**
     * Method description setRole
     *
     *
     * @param role
     */
    public void setRole(Role role) {
        this.role = role;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
