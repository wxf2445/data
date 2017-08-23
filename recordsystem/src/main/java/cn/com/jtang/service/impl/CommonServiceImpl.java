package cn.com.jtang.service.impl;

import cn.com.jtang.service.CommonService;
import org.springframework.stereotype.Service;

/**
 * Created by ZJUXP on 2016-07-19.
 */
@Service("commonservice")
public class CommonServiceImpl implements CommonService {
    @Override
    public String createAddress(String shId, String shCabNo, String shFloorNo) {
        StringBuffer sb = new StringBuffer();
        sb.append(shId).append("-").append(shCabNo).append("-").append(shFloorNo);
        return sb.toString();
    }
}
