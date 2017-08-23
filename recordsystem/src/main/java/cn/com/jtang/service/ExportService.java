package cn.com.jtang.service;

import cn.com.jtang.po.DefaultExport;
import cn.com.jtang.po.Info;
import cn.com.jtang.po.OutputOrder;
import cn.com.jtang.service.impl.ExportServiceImpl.CountAndNums;

import com.alibaba.fastjson.JSONArray;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

/**
 * Created by ZJUXP on 2016-07-20.
 */
public interface ExportService {

    DefaultExport getDefaultStyle();

    void exportWord(ByteArrayOutputStream fileOutputStream, List<String> cols, List<String> colnames, JSONArray datas, DefaultExport outputOrder);

    void exportWord(ByteArrayOutputStream fileOutputStream, String recordTypeId, String recordCategory, String volumeid, List<String> searchIds);

    void exportWord(ByteArrayOutputStream byteArrayOutputStream, String recordTypeId, String recordCategory, List<String> selectids);

    void exportExcelModal(ByteArrayOutputStream byteArrayOutputStream, String recordTypeId, String type );
    
    CountAndNums uploadXls(InputStream inputStream, String recordTypeId, String type ,String cover,HttpSession session);
    
    CountAndNums uploadSlsx(InputStream inputStream, String recordTypeId, String type ,String cover,HttpSession session);
    
    void getErrorXls(ByteArrayOutputStream fileOutputStream,InputStream inputStream, String recordTypeId,String type,
    		String errornums,String successnums,String isexcist,String novolumeno,String nogeneraldata);
    
    void getErrorXlsx(ByteArrayOutputStream fileOutputStream,InputStream inputStream, String recordTypeId,String type,
    		String errornums,String successnums,String isexcist,String novolumeno,String nogeneraldata);

    int updateDefaultStyle (DefaultExport setting);
    
    List<Map> uploadXlsInfo(InputStream inputStream, List<Info> infos);
    
    List<Map> uploadXlsxInfo(InputStream inputStream, List<Info> infos);
} 
