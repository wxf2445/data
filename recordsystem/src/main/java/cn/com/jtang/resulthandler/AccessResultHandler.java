package cn.com.jtang.resulthandler;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by ZJUXP on 2016-07-23.
 */
public class AccessResultHandler implements ResultHandler {
    private final Map mappedResults = new HashMap();
    @Override
    public void handleResult(ResultContext context) {
        Map map = (Map) context.getResultObject();
        mappedResults.put(map.get("recordtypeid"), ((String)map.get("accesspermission")).split(":"));
    }
    public Map getMappedResults() {
        return mappedResults;
    }
}
