import cn.com.jtang.dao.RecordTypeMapper;
import cn.com.jtang.dao.custom.DanymicMapper;
import cn.com.jtang.dao.custom.PermissionMapper;
import cn.com.jtang.po.RecordExample;
import cn.com.jtang.po.RoleAuthorityKey;
import cn.com.jtang.po.User;
import cn.com.jtang.po.custom.VolumeInnerMap;
import cn.com.jtang.resulthandler.VolumeInnerResultHandler;
import cn.com.jtang.service.DanymicService;
import cn.com.jtang.util.ApplicationUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by ZJUXP on 2016-06-04.
 */
public class test {
    public static void main(String[] args) throws IOException {
        /*ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        CommonService commonService = (CommonService) ApplicationUtil.getBean("commonService");
        CommonExample example = new CommonExample();
        example.setTableName("f1_w1_category");
        List<Object> objectList = commonService.selectByExample(example);

        JSONArray jsonArray = new JSONArray(objectList);
        System.out.println(jsonArray);*/

        /*Properties properties = new Properties();
        try {
            properties.load(test.class.getClassLoader().getResourceAsStream("config.properties"));
            String path = (String) properties.get("fileuploadroot");
            System.out.println(path);
            File file = new File(path + "/周华铭（test）.zip");
            if (!file.exists()) {
                try {
                    file.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }*/
       /* ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        TemplateViewMapper templateViewMapper = (TemplateViewMapper) ApplicationUtil.getBean("templateViewMapper");*/
        /*ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        RecordVolumeService recordVolumeService = (RecordVolumeService) ApplicationUtil.getBean("recordVolumeService");

        RecordVolumeExample example = new RecordVolumeExample();
        example.setTableName("f1_w1"+ RecordUtil.VOLUME);
        List<RecordVolume> recordVolumes = recordVolumeService.selectExportByExample(example);
        JSONArray jsonArray = new JSONArray();
        jsonArray.addAll(recordVolumes);
        System.out.println(jsonArray);*/
        /*ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        DanymicService danymicService = (DanymicService) ApplicationUtil.getBean("danymicService");
        Map<String,String> values = danymicService.getColMapValue("2_SvJ92kVbmamBjk-mocw6", "_piece");
        System.out.println(values);*/
        /*ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        ExportService exportService = (ExportService) ApplicationUtil.getBean("exportService");

        Map<String, Object> params = new HashMap<>();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("col1","ceshi1");
        jsonObject.put("col2","ceshi2");
        JSONObject data1 = new JSONObject();
        data1.put("data1","data1");
        data1.put("data2","data2");
        jsonArray.add(data1);
        data1 = new JSONObject();
        data1.put("data1","data1");
        data1.put("data2","data2");
        jsonArray.add(data1);
        exportService.exportWord(outputStream,jsonObject,jsonArray);
        FileOutputStream stream = new FileOutputStream("e:\\workbook.xls");
        outputStream.writeTo(stream);
        outputStream.close();*/
        /*TemplateExample example = new TemplateExample();

        List<TemplateMultiSelect> templateMultiSelects = templateViewMapper.selectByExample(example);
        System.out.println("test");*/
       /* String[] keys = {"a", "b", "c", "d"};

        Map map = new HashMap<>();
        map.put("tablename", "testcreatetable");
        map.put("keys", keys);
        map.put("primarykey", "a");
        map.put("tableindex", "testindex");
        map.put("name", "foreignkey");
        map.put("foreignkey", "b");
        map.put("foreignkeytable", "user");
        map.put("foreignkeytablefield", "userid");

        danymicService.createTable(map);*/
        /*List<Object> objectList = danymicService.selectInfoByRecordId("sd", "asdff", "3GjzovzWp7U86xjaxTS3yb");
        JSONArray jsonArray = new JSONArray(objectList);
        System.out.println(jsonArray);
*/
        /*ColSearchForm form = new ColSearchForm();
        form.setTableid("f1_e1_recordcontent1");
        List<Column> columns = new ArrayList<>();
        Column column = new Column();
        column.setColid("col0");
        column.setColvalue("严春来");
        columns.add(column);
        column = new Column();
        column.setColid("col1");
        column.setColvalue("");
        form.setCols(columns);
        List<String> recordIds = danymicService.selectRecordIdsByRecordContent(form);*/
        /*Map dd = danymicService.selectInfosByRecordId("f1_e1_record","0Q3goJ2Hdddr-ymXxTlKvT");
        System.out.println(dd);*/
       /* List<User> users = new ArrayList<User>();
        User user = new User();
        user.setUserid("testid");
        user.setUsername("testname");
        users.add(user);
        user = new User();
        user.setUserid("testid2");
        user.setUsername("testname2");
        users.add(user);
        String datastrings = JSONObject.toJSONString(users);
        JSONArray jsonArray = JSON.parseArray(datastrings);
        System.out.println(jsonArray);*/
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        /*PermissionMapper permissionMapper = (PermissionMapper) ApplicationUtil.getBean("permissionMapper");*/
        RecordTypeMapper recordTypeMapper = (RecordTypeMapper) ApplicationUtil.getBean("recordTypeMapper");
        /*List<RoleAuthorityKey> dd = new ArrayList<>();
        RoleAuthorityKey f = new RoleAuthorityKey();
        f.setAuthorityid("5");
        f.setRoleid(3);
        dd.add(f);
        permissionMapper.insertBatch(dd);*/
        //System.out.println(permissionMapper.selectAuthidsByRole(1));
        /*System.out.println(permissionMapper.selectAuthGroupPerm());*/
        //System.out.println(recordTypeMapper.getAllBasicField());
        System.out.println(recordTypeMapper.selectAccessRecordTree("1tlAV007Z3QbnzKNcksr3V"));
/*
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        DanymicMapper danymicMapper = (DanymicMapper) ApplicationUtil.getBean("danymicMapper");
        VolumeInnerResultHandler dd = new VolumeInnerResultHandler();
        danymicMapper.getVolumeInner("f1_t1_record",new RecordExample(),dd);
        System.out.println(dd.getVolumeInnerMap());
*/
    }
}
