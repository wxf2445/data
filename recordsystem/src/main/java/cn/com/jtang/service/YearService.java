package cn.com.jtang.service;

import cn.com.jtang.po.Year;
import cn.com.jtang.po.YearExample;
import cn.com.jtang.util.Page;

import java.util.List;

/**
 * Interface description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public interface YearService {

    int checkAndCreate(String year);

    boolean isExist(String year);

    List<Year> selectAll();

    int deleteByExample(YearExample userexample);

    int deleteByPrimaryKey(int userid);

    int insert(Year record);

    List<Year> selectByExample(YearExample example);

    Page selectByExample(YearExample example, Page page);

    Year selectByPrimaryKey(int userid);

    int updateByExampleSelective(Year record, YearExample example);

    int updateByPrimaryKey(Year record);

    int updateByPrimaryKeySelective(Year record);

}


//~ Formatted by Jindent --- http://www.jindent.com
