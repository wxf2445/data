package cn.com.jtang.service.impl;

import cn.com.jtang.dao.OutputOrderMapper;
import cn.com.jtang.po.*;
import cn.com.jtang.service.OutputOrderService;
import cn.com.jtang.web.controller.form.OutputSettingForm;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Service("outputOrderService")
@Transactional
public class OutputOrderServiceImpl implements OutputOrderService {
    @Resource
    private OutputOrderMapper mapper;


    @Override
    public int deleteByExample(OutputOrderExample example) {
        return mapper.deleteByExample(example);
    }

    @Override
    public int insert(OutputOrder record) {
        return mapper.insert(record);
    }

    @Override
    public List<OutputOrder> selectByExample(OutputOrderExample example) {
        return mapper.selectByExample(example);
    }

    @Override
    public int updateByExampleSelective(OutputOrder record, OutputOrderExample example) {
        return mapper.updateByExampleSelective(record,example);
    }

    @Override
    public int modify(List<String> cols, OutputSettingForm outputOrder) {

        StringBuffer sb = new StringBuffer();
        StringBuffer wsb = new StringBuffer();
        Map<String,String> width = outputOrder.getWidth();
        for(String col:cols){
            sb.append(col).append("-");
            wsb.append(width.get(col)).append("-");
        }

        outputOrder.setOutputcolorder(sb.toString().substring(0,sb.toString().length()-1));
        outputOrder.setColwidth(wsb.toString().substring(0,wsb.toString().length()-1));
        //outputOrder.set

        int i = 0;
        if(isExist(outputOrder.getRecordtype(),outputOrder.getCategory())){
            OutputOrderExample example = new OutputOrderExample();
            OutputOrderExample.Criteria criteria = example.createCriteria();

            criteria.andRecordtypeEqualTo(outputOrder.getRecordtype());
            criteria.andCategoryEqualTo(outputOrder.getCategory());
            i=updateByExampleSelective(outputOrder,example);
        }else{
            i=insert(outputOrder);
        }

        return i;
    }

    private String getAppendString(List<String> cols) {
        StringBuffer sb = new StringBuffer();
        for(String col:cols){
            sb.append(col).append("-");
        }
        return sb.toString().substring(0,sb.toString().length()-1);
    }

    @Override
    public boolean isExist(String recordTypeId, String type) {

        OutputOrderExample example = new OutputOrderExample();
        OutputOrderExample.Criteria criteria = example.createCriteria();

        criteria.andRecordtypeEqualTo(recordTypeId);
        criteria.andCategoryEqualTo(type);

        return mapper.countByExample(example)!=0;
    }

    @Override
    public OutputOrder selectByTypeIdAndCategory(String recordTypeId, String type) {
        OutputOrderExample example = new OutputOrderExample();
        OutputOrderExample.Criteria criteria = example.createCriteria();

        criteria.andRecordtypeEqualTo(recordTypeId);
        criteria.andCategoryEqualTo(type);
        List<OutputOrder> outputOrders = mapper.selectByExample(example);
        return outputOrders!=null&&outputOrders.size()>0?outputOrders.get(0):null;
    }

}


//~ Formatted by Jindent --- http://www.jindent.com
