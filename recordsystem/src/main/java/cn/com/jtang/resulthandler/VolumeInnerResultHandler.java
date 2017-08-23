package cn.com.jtang.resulthandler;

import cn.com.jtang.dao.custom.DanymicMapper;
import cn.com.jtang.dao.custom.GeneralDataMapper;
import cn.com.jtang.po.GeneralData;
import cn.com.jtang.po.custom.VolumeInnerMap;
import cn.com.jtang.util.RecordUtil;
import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ZJUXP on 2016-07-23.
 */
@Component
public class VolumeInnerResultHandler implements ResultHandler {
    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    private int start;
    private int limit;
    private int index = 0;

    public int getIndex() {
        return index;
    }

    private final Map<String,VolumeInnerMap> volumeInnerMaps = new HashMap<>();
    private final List<String> volumeids = new ArrayList<>();
    @Override
    public void handleResult(ResultContext context) {
        Map map = (Map) context.getResultObject();
        String volumeid = (String)map.get("volumeid");
            if (!volumeids.contains(volumeid)) {
                index++;
                if(index>start&&index<=start+limit){
                    volumeids.add(volumeid);
                    VolumeInnerMap volumeInnerMap = new VolumeInnerMap();
                    List currentMap = new ArrayList<>();
                    currentMap.add(map);
                    volumeInnerMap.setInners(currentMap);
                    volumeInnerMaps.put(volumeid, volumeInnerMap);
                }
            } else {
                volumeInnerMaps.get(volumeid).getInners().add(map);
            }
    }
    public Map<String,VolumeInnerMap> getVolumeInnerMap() {
        return volumeInnerMaps;
    }
}
