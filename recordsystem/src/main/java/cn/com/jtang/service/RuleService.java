package cn.com.jtang.service;

import cn.com.jtang.po.Rule;
import cn.com.jtang.web.controller.form.CreateVolumeForm;
import cn.com.jtang.web.controller.form.InfoTypeForm;

/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface RuleService {

    int insert(Rule record);

    Rule selectByPrimaryKey(String ruleid);

    Rule selectByRecordType(String recordtype,String tabletype);

    String getVolumeRuleorder(CreateVolumeForm form, String tablePrefix);

    //String createRecordRuleorder(InfoTypeForm form, String sequencno);

    String getChineseRule(String recordtype, String tabletype);

    String getRule(String recordtype, String tabletype);
    
    int deleteByRecordTypeId(String recordtypeid);
}


//~ Formatted by Jindent --- http://www.jindent.com
