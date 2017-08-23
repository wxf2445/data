package cn.com.jtang.service;

import cn.com.jtang.po.Pending;
import cn.com.jtang.po.PendingExample;
import cn.com.jtang.util.Page;

import java.util.List;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface PendingService {

    List<Pending> selectAll();

    int deleteByExample(PendingExample PendingExample);

    int deleteByPrimaryKey(String Pendingid);

    int insert(Pending record);

    List<Pending> selectByExample(PendingExample example);

    Page selectByExample(PendingExample example, Page page);

    Pending selectByPrimaryKey(String Pendingid);

    int updateByExampleSelective(Pending record, PendingExample example);

    int updateByPrimaryKey(Pending record);

    int updateByPrimaryKeySelective(Pending record);

    int create(String fondsid, String recordtype, String volumeid, String recordids);


}


//~ Formatted by Jindent --- http://www.jindent.com
