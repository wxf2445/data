package cn.com.jtang.web.controller.form.common;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Date;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Component("searchForm")
public class SearchForm implements Serializable {
    private String key;
    private Integer page;
    private Integer size;
    private String typeid;
    private String id;
    private String orderByClause;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date starttime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endtime;

    /**
     * Method description getEndtime
     *
     * @return Date
     */
    public Date getEndtime() {
        return endtime;
    }

    /**
     * Method description setEndtime
     *
     * @param endtime
     */
    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    /**
     * Method description getId
     *
     * @return String
     */
    public String getId() {
        return id;
    }

    /**
     * Method description setId
     *
     * @param id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * Method description getKey
     *
     * @return String
     */
    public String getKey() {
        return key;
    }

    /**
     * Method description setKey
     *
     * @param key
     */
    public void setKey(String key) {
        this.key = key;
    }

    /**
     * Method description getOrderByClause
     *
     * @return String
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * Method description setOrderByClause
     *
     * @param orderByClause
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * Method description getPage
     *
     * @return Integer
     */
    public Integer getPage() {
        return page;
    }

    /**
     * Method description setPage
     *
     * @param page
     */
    public void setPage(Integer page) {
        this.page = page;
    }

    /**
     * Method description getSize
     *
     * @return Integer
     */
    public Integer getSize() {
        return size;
    }

    /**
     * Method description setSize
     *
     * @param size
     */
    public void setSize(Integer size) {
        this.size = size;
    }

    /**
     * Method description getStarttime
     *
     * @return Date
     */
    public Date getStarttime() {
        return starttime;
    }

    /**
     * Method description setStarttime
     *
     * @param starttime
     */
    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    /**
     * Method description getTypeid
     *
     * @return String
     */
    public String getTypeid() {
        return typeid;
    }

    /**
     * Method description setTypeid
     *
     * @param typeid
     */
    public void setTypeid(String typeid) {
        this.typeid = typeid;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
