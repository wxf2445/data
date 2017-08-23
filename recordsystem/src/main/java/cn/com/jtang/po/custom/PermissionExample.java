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
public class PermissionExample {
    protected int     start = -1;
    protected int     limit = -1;
    protected String  orderByClause;
    protected User user;
    protected Role role;
    protected String  permission;
    protected boolean distinct;

    /**
     * Method description clear
     *
     */
    public void clear() {
        orderByClause = null;
        user          = null;
        role          = null;
        permission    = null;
        distinct      = false;
    }

    /**
     * Method description isDistinct
     *
     *
     * @return boolean 
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * Method description setDistinct
     *
     *
     * @param distinct
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * Method description getLimit
     *
     *
     * @return int 
     */
    public int getLimit() {
        return limit;
    }

    /**
     * Method description setLimit
     *
     *
     * @param limit
     */
    public void setLimit(int limit) {
        this.limit = limit;
    }

    /**
     * Method description getOrderByClause
     *
     *
     * @return String 
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * Method description setOrderByClause
     *
     *
     * @param orderByClause
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * Method description getPermission
     *
     *
     * @return String 
     */
    public String getPermission() {
        return permission;
    }

    /**
     * Method description setPermission
     *
     *
     * @param permission
     */
    public void setPermission(String permission) {
        this.permission = permission;
    }

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

    /**
     * Method description getStart
     *
     *
     * @return int 
     */
    public int getStart() {
        return start;
    }

    /**
     * Method description setStart
     *
     *
     * @param start
     */
    public void setStart(int start) {
        this.start = start;
    }

    /**
     * Method description getUser
     *
     *
     * @return User 
     */
    public User getUser() {
        return user;
    }

    /**
     * Method description setUser
     *
     *
     * @param user
     */
    public void setUser(User user) {
        this.user = user;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
