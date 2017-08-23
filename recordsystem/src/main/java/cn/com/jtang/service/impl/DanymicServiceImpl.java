package cn.com.jtang.service.impl;

import cn.com.jtang.dao.FondsMapper;
import cn.com.jtang.dao.RecordMapper;
import cn.com.jtang.dao.RecordTypeMapper;
import cn.com.jtang.dao.custom.DanymicMapper;
import cn.com.jtang.dao.custom.RecordViewMapper;
import cn.com.jtang.po.*;
import cn.com.jtang.resulthandler.MapResultHandler;
import cn.com.jtang.resulthandler.VolumeInnerResultHandler;
import cn.com.jtang.service.DanymicService;
import cn.com.jtang.service.InfoService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.ColSearchForm;
import cn.com.jtang.web.controller.form.template.Column;
import cn.com.jtang.web.controller.form.template.TemplateCreateForm;
import com.alibaba.fastjson.JSONArray;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created by ZJUXP on 2016-07-01.
 */
@Service("danymicService")
@Transactional
public class DanymicServiceImpl implements DanymicService {

    @Resource
    private DanymicMapper danymicMapper;
    @Resource
    private InfoService infoService;
    @Resource
    private FondsMapper fondsMapper;
    @Resource
    private RecordTypeMapper recordTypeMapper;
    @Resource
    private RecordMapper recordMapper;
    @Resource
    private RecordViewMapper recordViewMapper;

    @Override
    public Map getMapValue(String tableName, String id) {
        return danymicMapper.getMapValue(tableName, id);
    }

    @Override
    public String getTablePrefix(String fondsid, String recordtype) {
        Fonds fonds = fondsMapper.selectByPrimaryKey(fondsid);
        RecordType recordType = recordTypeMapper.selectByPrimaryKey(recordtype);

        StringBuffer sb = new StringBuffer();
        sb.append(fonds.getFondsno()).append("_").append(recordType.getTypeno());

        return sb.toString().toLowerCase();
    }

    @Override
    public int createTable(Map params) {
        return danymicMapper.creatTableAndInsert(params);
    }

    @Override
    public int createTable(Template template, TemplateCreateForm templateCreateForm) {
        Map<String, Object> params = new HashMap<>();

        String piecetableid = template.getPiecetableid();
        String tableId = template.getTableid();
        String prefix = tableId.substring(0, tableId.lastIndexOf("_"));

        int i = 0;
        for (Column column : templateCreateForm.getColumns()) {
            column.setColid(RecordUtil.COL_PREFIX + i);
            i++;
        }

        Column column = null;
        for (String columnid : Arrays.asList(RecordUtil.COLUMN_NOT_IN)) {
            column = new Column();
            column.setColid(columnid);
            column.setColname(columnid);
            if (RecordUtil.COLUMN_SOURCEFILE.equals(columnid)) {
                column.setColwidth(RecordUtil.COLUMN_SOURCEFILE_WIDTH);
            } else if (RecordUtil.COLUMN_PAGENUM.equals(columnid)) {
                column.setColwidth(RecordUtil.COLUMN_PAGENUM_WIDTH);
            } else if (RecordUtil.COLUMN_RECORDID.equals(columnid)) {
                column.setColwidth(RecordUtil.COLUMN_RECORDID_WIDTH);
            }
            templateCreateForm.getColumns().add(column);
        }

        createTable(tableId, templateCreateForm.getColumns(), prefix + RecordUtil.RECORD);
        createTable(piecetableid, templateCreateForm.getColumns(), prefix + RecordUtil.PIECE);

        return 1;
    }

    private void createTable(String tableId, List<Column> columns, String foreignTable) {
        Map map = new HashMap<>();
        String prefix = tableId.substring(0, tableId.lastIndexOf("_"));
        map.put("tablename", tableId);
        map.put("keys", columns);
        //map.put("primarykey", "a");
        map.put("tableindex", tableId + "_index");
        map.put("name", tableId + "_foreignkey");
        map.put("foreignkey", "recordId");
        map.put("foreignkeytable", foreignTable);
        map.put("foreignkeytablefield", "id");
        danymicMapper.creatTableAndInsert(map);
    }

    @Override
    public void insertInfo(List<String> lists, Integer colSize, String tableId, String recordId) {
        Map map = new HashMap<>();

        InfoExample infoExample = new InfoExample();
        InfoExample.Criteria criteria = infoExample.createCriteria();
        infoExample.setOrderByClause("columnid asc");
        criteria.andTableidEqualTo(tableId);

        List<Info> infos = null;
        if (tableId.contains(RecordUtil.RECORD)) {
            infos = infoService.selectByTempleId(tableId);
        } else if (tableId.contains(RecordUtil.PIECE)) {
            infos = infoService.selectByPieceId(tableId);
        }

        List<String> colids = new ArrayList<>();
        for (Info info : infos) {
            colids.add(info.getColumnid());
        }

        colids.add("recordId");

        for (String s : lists) {
            String[] vs = s.split(",");
            List<String> vlist = new ArrayList<>(Arrays.asList(vs));
            map.put("tablename", tableId);
            map.put("keys", colids);
            vlist.add(recordId);
            map.put("values", vlist);
            insertInfo(map);
        }

        /*int end = colSize;
        int start = 0;
        while (end <= lists.size()) {
            map.put("tablename", tableId);
            map.put("keys", colids);
            List<String> values = lists.subList(start, end);
            values.add(recordId);
            map.put("values", values);
            insertInfo(map);
            start += colSize;
            end += colSize;
        }*/
    }

    @Override
    public Map selectInfosByRecordId(String tableId, String recordId) {
        Map map = new HashMap<>();

        Record record = recordViewMapper.selectByPrimaryKey(recordId, tableId);
        /*Template template = templateService.selectByRecordTypeId(recordTypeId);
        if (template != null) {
            map.put("tableName", template.getTableid());
        }*/

        if (tableId.contains(RecordUtil.PIECE)) {
            map.put("cols", infoService.selectByPieceId(record.getTableid()));
        } else {
            map.put("cols", infoService.selectByTempleId(record.getTableid()));
        }

        map.put("tableName", record.getTableid());
        map.put("recordId", recordId);
        JSONArray jsonArray = new JSONArray(danymicMapper.selectObjectByRecordId(map));
        System.out.println(jsonArray);
        map.put("values", jsonArray);

        return map;
    }


    @Override
    public List<List<InfoClass>> selectInfoByRecordId(String tableName, String type, String recordId) {

        Record record = recordViewMapper.selectByPrimaryKey(recordId, tableName);
        //JSONObject jsonObject = (JSONObject) JSON.toJSON(record);
        /*Template template = templateService.selectByRecordTypeId(recordTypeId);
        if (template != null) {
            map.put("tableName", template.getTableid());
        }*/

        if (record.getTableid() == null || "".equals(record.getTableid()))
            return null;
        List<Map<String, Object>> infomap = danymicMapper.selectByRecordId(record.getTableid(), recordId);


        InfoExample infoExample = new InfoExample();
        InfoExample.Criteria criteria = infoExample.createCriteria();
        infoExample.setOrderByClause("columnid asc");
        if (type.equals(RecordUtil.RECORD))
            criteria.andTableidEqualTo(record.getTableid());
        else if (type.equals(RecordUtil.PIECE))
            criteria.andPiecetableidEqualTo(record.getTableid());

        List<Info> infos = infoService.selectByExample(infoExample);
        List<List<InfoClass>> listinfos = new ArrayList<List<InfoClass>>();
        for (int i = 0; i < infomap.size(); i++) {
            List<InfoClass> listinfo = new ArrayList<InfoClass>();
            for (Info info : infos) {
                InfoClass infoClass = new InfoClass();
                infoClass.setColumnid(info.getColumnid());
                infoClass.setColumnname(info.getColumnname());
                infoClass.setColumnvalue(infomap.get(i).get(info.getColumnid()).toString());
                listinfo.add(infoClass);
            }
            listinfos.add(listinfo);
        }

        return listinfos;
    }

    @Override
    public List<String> selectRecordIdsByRecordContent(ColSearchForm form) {
        Map map = new HashMap<>();
        //String tablePrefix = getTablePrefix(fondsId, recordTypeId);
        //Record record = recordViewMapper.selectByPrimaryKey(recordId, tablePrefix + RecordUtil.RECORD);
        //JSONObject jsonObject = (JSONObject) JSON.toJSON(record);
        /*Template template = templateService.selectByRecordTypeId(recordTypeId);
        if (template != null) {
            map.put("tableName", template.getTableid());
        }*/
        List<String> recordIds = null;
        if (!isValueEmpty(form.getCols())) {
            map.put("tableName", form.getTableid());
            map.put("cols", form.getCols());
            recordIds = danymicMapper.selectRecordIdsByRecordContent(map);
        } else {
            String tableId = form.getTableid();
            String prefix = tableId.substring(0, tableId.lastIndexOf("_"));
            String suffix = tableId.contains(RecordUtil.RECORD) ? RecordUtil.RECORD : RecordUtil.PIECE;
            recordIds = danymicMapper.selectAllIds(prefix + suffix);
        }

        return recordIds;
    }

    private boolean isValueEmpty(List<Column> cols) {
        boolean status = true;
        for (Column col : cols) {
            if (!StringUtils.isEmpty(col.getColvalue())) {
                status = false;
                break;
            }
        }
        return status;
    }

    @Override
    public void deleteOldInfo(String tableId, String id) {
        danymicMapper.deleteOldInfo(tableId, id);
    }

    @Override
    public void selectPageByCols(List<String> cols, List<TableField> indexFields, String tableName, RecordExample example, Page pageObject) {
        //pageObject.retrievePage(danymicMapper.selectCountByCols(tableName, example));
        //example.setStart((pageObject.getPageNum() - Page.ONE) * pageObject.getPageSize());
        //example.setLimit(pageObject.getPageSize());
        pageObject.setItems(danymicMapper.selectByCols(cols, indexFields, tableName, example));
    }

    @Override
    public List<Object> selectByCols(List<String> cols, List<TableField> indexFields, String tableName, RecordExample example) {
        return danymicMapper.selectByCols(cols, indexFields, tableName, example);
    }

    @Override
    public int countByTableId(String tableid) {
        return danymicMapper.countByTableId(tableid);
    }

    @Override
    public void dropTable(String tableName) {
        danymicMapper.dropTable(tableName);
    }

    @Override
    public Map getColMapValue(String recordTypeId, String tableFieldType) {
        MapResultHandler mapResultHandler = new MapResultHandler();
        danymicMapper.getColMapValue(recordTypeId, tableFieldType, mapResultHandler);

        return mapResultHandler.getMappedResults();
    }

    @Override
    public String getTablePrefix(String recordTypeId) {
        RecordType recordType = recordTypeMapper.selectByPrimaryKey(recordTypeId);
        Fonds fonds = fondsMapper.selectByPrimaryKey(recordType.getFondsid());

        StringBuffer sb = new StringBuffer();
        sb.append(fonds.getFondsno()).append("_").append(recordType.getTypeno());
        return sb.toString().toLowerCase();
    }

    @Override
    public SearchPage selectVolumeRecord(String tableName, RecordExample example, SearchPage searchPage) {
        VolumeInnerResultHandler dd = new VolumeInnerResultHandler();
        dd.setStart(example.getStart());
        dd.setLimit(example.getLimit());
        danymicMapper.getVolumeInner(tableName, example, dd);
        searchPage.setItems(dd.getVolumeInnerMap());
        searchPage.setTotal(dd.getIndex());
        searchPage.setPages();
        return searchPage;
    }

    @Override
    public int addColumn(String tableName, List<Column> cols) {
        return danymicMapper.addColumn(tableName, cols);
    }

    @Override
    public int selectCountByCols(String s, RecordExample pieceExample) {
        return danymicMapper.selectCountByCols(s, pieceExample);
    }

    @Override
    public RecordType getPrePath(String volumeno) {
        RecordType recordType = null;
        List<RecordType> recordTypes = recordTypeMapper.selectByExample(new RecordTypeExample());
        for (RecordType rt : recordTypes) {
            String table = rt.getVolumetable();
            Map recordmap = danymicMapper.selectByRecordNo(table, volumeno);
            if (recordmap != null) {
                //prefix = table.substring(0, table.lastIndexOf("_"));
                //String id = (String) recordmap.get("id");
                //prePath = prefix + "/" + id;
                recordType = rt;
                break;
            }
        }
        return recordType;
    }

    @Override
    public void insertBatchDocuments(List<Document> documents, String documentTable) {
        danymicMapper.insertBatch(documents, documentTable);
    }

    @Override
    public String selectByRecordNo(String recordTable, String no) {
        Map record = danymicMapper.selectInnerByRecordNo(recordTable, no);
        String id = record == null ? "" : (String) record.get("id");
        return id;
    }

    @Override
    public RecordType getPiecePrefix(String temp) {
        RecordType recordType = null;
        List<RecordType> recordTypes = recordTypeMapper.selectByExample(new RecordTypeExample());
        for (RecordType rt : recordTypes) {
            String table = recordType.getVolumetable();
            String prefix = table.substring(0, table.lastIndexOf("_"));
            List<String> nos = new ArrayList<>(1);
            nos.add(temp);
            List<String> ids = selectPieceIdsByNos(prefix+RecordUtil.PIECE, nos);
            if(ids!=null&&ids.size()>0){
                break;
            }
        }
        return recordType;
    }


    @Override
    public List<String> selectPieceIdsByNos(String prefix, List<String> nos) {
        return danymicMapper.selectPieceIdsByNos(prefix,nos);
    }

    @Override
    public List<String> selectNosByPieceIds(String prefix, List<String> ids) {
        return danymicMapper.selectNosByPieceIds(prefix,ids);
    }


    void insertInfo(Map params) {
        danymicMapper.insertInfo(params);
    }


    public static class InfoClass {
        String columnid;
        String columnname;
        String columnvalue;

        public String getColumnid() {
            return columnid;
        }

        public void setColumnid(String columnid) {
            this.columnid = columnid;
        }

        public String getColumnname() {
            return columnname;
        }

        public void setColumnname(String columnname) {
            this.columnname = columnname;
        }

        public String getColumnvalue() {
            return columnvalue;
        }

        public void setColumnvalue(String columnvalue) {
            this.columnvalue = columnvalue;
        }
    }
}
