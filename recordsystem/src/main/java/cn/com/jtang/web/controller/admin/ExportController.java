package cn.com.jtang.web.controller.admin;

import cn.com.jtang.po.Document;
import cn.com.jtang.po.Fonds;
import cn.com.jtang.po.FondsExample;
import cn.com.jtang.po.Record;
import cn.com.jtang.po.RecordType;
import cn.com.jtang.po.User;
import cn.com.jtang.service.*;
import cn.com.jtang.service.impl.ExportServiceImpl.CountAndNums;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.common.SearchForm;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller
@RequestMapping("/export")
@SessionAttributes({
        "searchForm","datalists"
})
public class ExportController {
    @Value("${page.size}")
    private int PAGE_SIZE;
    @Resource
    private ExportService exportService;
    @Resource
    private FondsService fondsService;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private DanymicService danymicService;
    @Resource
    private DocumentService documentService;
    @Resource
    private RecordService recordService;
    @Resource
    private LogService logService;
    @Value("${fileserverpath}")
    private String FileServerPath;






    @RequiresAuthentication
    @RequiresPermissions(value = {"export"})
    @RequestMapping(
            value = "/directory",
            method = RequestMethod.POST
    )
    public void userManage(@RequestParam(
            value = "filename",
            required = true
    ) String filename, @RequestParam(
            value = "format",
            required = true
    ) String format, @RequestParam(
            value = "recordTypeId",
            required = true
    ) String recordTypeId, @RequestParam(
            value = "recordCategory",
            required = true
    ) String recordCategory, @RequestParam(
            value = "volumeid",
            required = true
    ) String volumeid, @RequestParam(
            value = "exporttype",
            required = true
    ) String exporttype,@RequestParam(
            value = "treetype",
            required = true
    ) String treetype,@RequestParam(
            value = "selectids",
            required = false
    ) List<String> selectids,ModelMap model, HttpServletResponse response) {
        JSONArray jsonArray = null;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        if("all".equals(treetype)){
            exportService.exportWord(byteArrayOutputStream,recordTypeId,recordCategory,null);
        }else if(RecordUtil.RECORD.equals(recordCategory)){
            exportService.exportWord(byteArrayOutputStream,recordTypeId,recordCategory,volumeid,null);
        }else {
            if("all".equals(exporttype)){
                List<String> searchIds = ((List)model.get("datalists"));
                exportService.exportWord(byteArrayOutputStream,recordTypeId,recordCategory,volumeid,searchIds);
            }else{
                exportService.exportWord(byteArrayOutputStream,recordTypeId,recordCategory,selectids);
            }
        }

        // 设置为下载文件弹框,和文件名编码
        String fileName = null;
        try {
            fileName = URLEncoder.encode(filename + "." + format, "UTF-8");
            if (fileName.length() > 150) {
                fileName = new String(fileName.getBytes("gb2312"), "ISO8859-1");
            }

            response.setHeader("Content-Disposition", "attachment; filename*=utf-8'zh_cn'"+ fileName);
            // 设置文件大小
            response.setContentLength(byteArrayOutputStream.size());
            ServletOutputStream outputStream = response.getOutputStream();
            // 6: 将PDF文件输出到流中去.
            byteArrayOutputStream.writeTo(outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    

    @ResponseBody
    @RequestMapping(
            value = "/batchexport",
            method = RequestMethod.POST
    )
    public Map<String, Object> batchexport(@RequestParam(
            value = "filename",
            required = true
    ) String filename, @RequestParam(
            value = "format",
            required = true
    ) String format, @RequestParam(
            value = "recordTypeId",
            required = true
    ) String recordTypeId, @RequestParam(
            value = "recordCategory",
            required = true
    ) String recordCategory, @RequestParam(
            value = "volumeid",
            required = true
    ) String volumeid, @RequestParam(
            value = "exporttype",
            required = true
    ) String exporttype,@RequestParam(
            value = "treetype",
            required = true
    ) String treetype,@RequestParam(
            value = "selectids",
            required = false
    ) List<String> selectids,ModelMap model, HttpServletResponse response) {

        Map<String,Object> result = new HashMap<>();
        List<String> paths = new ArrayList<String>();
        int lostFile = 0;
        String logs = "";
    	String tablefix = recordTypeService.selectByPrimaryKey(recordTypeId).getRecordtable().replace(RecordUtil.RECORD, "");
    	if(RecordUtil.PIECE.equals(recordCategory)){
    		logs+="批量导出按件";
        	for(String recordid:selectids){
        		Record record = recordService.selectByPrimaryKey(recordid, tablefix+RecordUtil.PIECE);
        		logs += "（"+record.getRecordno()+"）"+record.getSubject()+"、";
        		logs.substring(0, logs.length()-1);
            	for(Document document:documentService.selectByRecord(recordid, tablefix+RecordUtil.PIECEDOCUMENT)){
            		if(new File(FileServerPath+document.getPath()).exists())
            			paths.add(document.getPath());
            		else
            			lostFile++;
            			
            	}
        	}
    	}else{
    		logs+="批量导出卷内";
        	for(Record record:recordService.getByVolumeIds(selectids, tablefix+RecordUtil.RECORD)){
        		logs += "（"+record.getRecordno()+"）"+record.getSubject()+"、";
        		logs.substring(0, logs.length()-1);
            	for(Document document:documentService.selectByRecord(record.getId(), tablefix+RecordUtil.DOCUMENT)){
            		if(new File(FileServerPath+document.getPath()).exists())
            			paths.add(document.getPath());
            		else
            			lostFile++;
            	}
        	}
    		
    	}
    	logService.insert(logs);
    	result.put("paths", paths);
    	result.put("lostFile", lostFile);
        return result;
    }
    
    @RequiresAuthentication
    @RequiresPermissions(value = {"export"})
    @RequestMapping(
            value = "/all",
            method = RequestMethod.POST
    )
    public void all(@RequestParam(
            value = "recordTypeId",
            required = true
    ) String recordTypeId, @RequestParam(
            value = "type",
            required = true
    ) String type,@RequestParam(
            value = "filename",
            required = true
    ) String filename,@RequestParam(
            value = "format",
            required = true
    ) String format,ModelMap model, HttpServletResponse response) {
        JSONArray jsonArray = null;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        exportService.exportWord(byteArrayOutputStream,recordTypeId,type,null);

        // 设置为下载文件弹框,和文件名编码
        String fileName = null;
        try {
            fileName = URLEncoder.encode(filename + "." + format, "UTF-8");
            if (fileName.length() > 150) {
                fileName = new String(fileName.getBytes("gb2312"), "ISO8859-1");
            }
            response.setHeader("Content-Disposition", "attachment; filename*=utf-8'zh_cn'"+ fileName);
            // 设置文件大小
            response.setContentLength(byteArrayOutputStream.size());
            ServletOutputStream outputStream = response.getOutputStream();
            // 6: 将PDF文件输出到流中去.
            byteArrayOutputStream.writeTo(outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /*@RequiresAuthentication
    @RequiresPermissions(value = {"export"})
    @RequestMapping(
            value = "/searchForm",
            method = RequestMethod.POST
    )
    public void searchForm(@RequestParam(
            value = "filename",
            required = true
    ) String filename, @RequestParam(
            value = "format",
            required = true
    ) String format, @RequestParam(
            value = "recordTypeId",
            required = true
    ) String recordTypeId, @RequestParam(
            value = "recordCategory",
            required = true
    ) String recordCategory, @RequestParam(
            value = "volumeid",
            required = true
    ) String volumeid,ModelMap model, HttpServletResponse response) {

        String datastrings = JSONObject.toJSONString((List)model.get("datalists"));
        JSONArray jsonArray = JSON.parseArray(datastrings);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        exportService.exportWord(byteArrayOutputStream,recordTypeId,recordCategory,volumeid,jsonArray);

        // 设置为下载文件弹框,和文件名编码
        String fileName = null;
        try {
            fileName = URLEncoder.encode(filename + "." + format, "UTF-8");
            if (fileName.length() > 150) {
                fileName = new String(fileName.getBytes("gb2312"), "ISO8859-1");
            }

            response.setHeader("Content-Disposition", "attachment; filename*=utf-8'zh_cn'"+ fileName);
            // 设置文件大小
            response.setContentLength(byteArrayOutputStream.size());
            ServletOutputStream outputStream = response.getOutputStream();
            // 6: 将PDF文件输出到流中去.
            byteArrayOutputStream.writeTo(outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }*/
    
    @RequiresAuthentication
    @RequestMapping(
            value = "/exportExcelModal",
            method = RequestMethod.POST
    )
    public void exportExcelModal(@RequestParam(
            value = "recordtypeid",
            required = true
    ) String recordTypeId, @RequestParam(
            value = "type",
            required = true
    ) String type,ModelMap model, HttpServletResponse response) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();

        // 设置为下载文件弹框,和文件名编码
        String fileName = null;
        try {
            exportService.exportExcelModal(byteArrayOutputStream,recordTypeId,type);
            
        	RecordType recordType = recordTypeService.selectByPrimaryKey(recordTypeId);
        	Fonds fonds = fondsService.selectByPrimaryKey(recordType.getFondsid());
        	fileName = fonds.getName()+"-"+recordType.getName()+"-"+RecordUtil.getChineseType(type)+"模板";


            response.setHeader("Content-Disposition", "attachment; filename="+java.net.URLEncoder.encode(fileName, "UTF-8")+".xls");
            response.setContentType("application/msexcel");
            // 设置文件大小
            response.setContentLength(byteArrayOutputStream.size());
            ServletOutputStream outputStream = response.getOutputStream();
            
            
            byteArrayOutputStream.writeTo(outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequiresAuthentication
    @RequestMapping(
            value = "/getErrorExcel",
            method = RequestMethod.POST
    )
    public void getErrorExcel(
            @RequestParam(value = "file", required = false) MultipartFile file,@RequestParam(
            value = "recordtypeid",
            required = true
    ) String recordTypeId, @RequestParam(
            value = "type",
            required = true
    ) String type,@RequestParam(
            value = "errornums",
            required = true
    ) String errornums,@RequestParam(
            value = "successnums",
            required = true
    ) String successnums,@RequestParam(
            value = "isexcist",
            required = true
    ) String isexcist,@RequestParam(
            value = "novolumeno",
            required = true
    ) String novolumeno,@RequestParam(
            value = "nogeneraldata",
            required = true
    ) String nogeneraldata,ModelMap model, HttpServletResponse response) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();

        // 设置为下载文件弹框,和文件名编码
        String fileName = null;
        try {

        	RecordType recordType = recordTypeService.selectByPrimaryKey(recordTypeId);
        	fileName = fondsService.selectByPrimaryKey(recordType.getFondsid()).getName()+"-"+recordType.getName()+RecordUtil.getChineseType(type)+"未成功的条目";
        	
        	if(file.getOriginalFilename().toLowerCase().endsWith("xls")){
        		exportService.getErrorXls (byteArrayOutputStream, file.getInputStream(), recordTypeId, type,
                		errornums, successnums, isexcist, novolumeno, nogeneraldata);

                response.setHeader("Content-Disposition", "attachment; filename="+java.net.URLEncoder.encode(fileName, "UTF-8")+".xls");
                response.setContentType("application/msexcel");
                
        	}else if(file.getOriginalFilename().toLowerCase().endsWith("xlsx")){
        		exportService.getErrorXlsx(byteArrayOutputStream, file.getInputStream(), recordTypeId, type,
                		errornums, successnums, isexcist, novolumeno, nogeneraldata);
                response.setHeader("Content-Disposition", "attachment; filename="+java.net.URLEncoder.encode(fileName, "UTF-8")+".xlsx");
                response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        	}
            
            // 设置文件大小
            response.setContentLength(byteArrayOutputStream.size());
            ServletOutputStream outputStream = response.getOutputStream();
            
            
            byteArrayOutputStream.writeTo(outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
