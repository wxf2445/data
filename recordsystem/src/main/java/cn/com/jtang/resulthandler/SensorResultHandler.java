package cn.com.jtang.resulthandler;

import cn.com.jtang.util.DateUtil;
import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ZJUXP on 2016-07-23.
 */
public class SensorResultHandler implements ResultHandler {
    private final Map<String, Object> mappedResults = new HashMap();
    private final List<String> dates = new ArrayList<>();
    private final List<Float> temps = new ArrayList<>();
    private final List<Float> moistures = new ArrayList<>();

    @Override
    public void handleResult(ResultContext context) {
        Map map = (Map) context.getResultObject();
        if (mappedResults.isEmpty()) {
            mappedResults.put("dates", dates);
            mappedResults.put("temps", temps);
            mappedResults.put("moistures", moistures);
        }
        Timestamp date = (Timestamp) map.get("recordtime");
        String temperature = (String) map.get("temperature");
        String moisture = (String) map.get("moisture");
        dates.add(DateUtil.format(date));
        temps.add(Float.valueOf(temperature));
        moistures.add(Float.valueOf(moisture));
    }

    public Map getMappedResults() {
        return mappedResults;
    }
}
