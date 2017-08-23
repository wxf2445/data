package cn.com.jtang.service;

import cn.com.jtang.po.Info;
import cn.com.jtang.po.InfoExample;
import cn.com.jtang.po.Template;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.template.TemplateCreateForm;

import java.util.List;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface InfoService {

    List<Info> getCommonColumn();

    int createInfo(TemplateCreateForm templateCreateForm, Template template, int i);

    List<Info> selectByTempleId(String id);

    List<Info> selectByPieceId(String id);

    int deleteByExample(InfoExample infoexample);

    int insert(Info record);

    List<Info> selectByExample(InfoExample example);

    Page selectByExample(InfoExample example, Page page);

    int updateByExampleSelective(Info record, InfoExample example);

    List<String> selectAllTemCol();

    List<Info> selectByColName(String colname);

    List<Info> selectRealByTempleId(String tableid);

    List<Info> selectRealByPieceId(String pieceid);

    int deleteByContentTableId(String contentTableId);
}


//~ Formatted by Jindent --- http://www.jindent.com
