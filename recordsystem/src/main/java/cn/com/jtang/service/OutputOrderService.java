package cn.com.jtang.service;

import cn.com.jtang.po.*;
import cn.com.jtang.web.controller.form.OutputSettingForm;

import java.util.List;

/**
 * Interface description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
public interface OutputOrderService {

    int deleteByExample(OutputOrderExample example);

    int insert(OutputOrder record);

    List<OutputOrder> selectByExample(OutputOrderExample example);

    int updateByExampleSelective(OutputOrder record, OutputOrderExample example);

    int modify(List<String> cols, OutputSettingForm setting);

    boolean isExist(String recordTypeId,String type);

    OutputOrder selectByTypeIdAndCategory(String recordTypeId, String type);

}


//~ Formatted by Jindent --- http://www.jindent.com
