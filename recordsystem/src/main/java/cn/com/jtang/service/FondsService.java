package cn.com.jtang.service;

import cn.com.jtang.po.Fonds;
import cn.com.jtang.po.FondsExample;
import cn.com.jtang.po.RecordType;
import cn.com.jtang.po.custom.RecordTree;
import cn.com.jtang.util.Page;

import java.util.List;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface FondsService {

    RecordTree createRecordTree();

    List<Fonds> selectAll();

    int deleteByExample(FondsExample FondsExample);

    int deleteByPrimaryKey(String Fondsid);

    int insert(Fonds record);

    List<Fonds> selectByExample(FondsExample example);

    Page selectByExample(FondsExample example, Page page);

    Fonds selectByPrimaryKey(String Fondsid);

    int updateByExampleSelective(Fonds record, FondsExample example);

    int updateByPrimaryKey(Fonds record);

    int updateByPrimaryKeySelective(Fonds record);


    int create(String fondsname, String fondsno, String fondsdes, String shid);

    boolean isNameExist(String typename);

    boolean isNoExist(String fondsno);

    List<RecordType> getRecordType(String fondsid);

    Fonds selectByFondsNo(String fondsNo);

    List<Fonds> selectHasRecordType();
}


//~ Formatted by Jindent --- http://www.jindent.com
