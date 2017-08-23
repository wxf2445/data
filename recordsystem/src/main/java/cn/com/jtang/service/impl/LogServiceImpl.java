package cn.com.jtang.service.impl;

import cn.com.jtang.dao.LogMapper;
import cn.com.jtang.po.Log;
import cn.com.jtang.po.LogExample;
import cn.com.jtang.po.RecordExample;
import cn.com.jtang.service.LogService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;
import cn.com.jtang.web.controller.form.LogSearchForm;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import sun.rmi.rmic.iiop.Type;

import javax.annotation.Resource;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("logService")
public class LogServiceImpl implements LogService {

    @Resource
    private LogMapper logMapper;

    private XSSFFont font_xlsx;
    private XSSFCellStyle style_xlsx;
    private XSSFCellStyle titleStyle_xlsx;
    
	@Override
	public int insert(String event) {
		Log log = new Log();
        org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();
        String username = (String) my.getPrincipal();
		log.setEvent(event);
		log.setOperator(username);
		return logMapper.insertSelective(log);
	}
	
	@Override
	public int insertCheck(String event) {
		Log log = new Log();
        org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();
        String username = (String) my.getPrincipal();
		log.setEvent(event);
		log.setOperator(username);
		log.setType("check");
		return logMapper.insertSelective(log);
	}

	@Override
	public Page selectByLogSearchForm(LogSearchForm logSearchForm) {
            Date start = logSearchForm.getStarttime();
            Date end = logSearchForm.getEndtime();
            Date current = new Date(System.currentTimeMillis());
            String key = logSearchForm.getKey();
    		LogExample example = new LogExample();
    		LogExample.Criteria criteria = example.createCriteria();
    		//criteria.and("status = 0");
            if (start != null) {
                if (end == null) {
                    end = current;
                } else if (end.after(current)) {
                    end = current;
                }

                if (start.before(end)) {
                    criteria.andCreatetimeBetween(start, end);
                } else if (start.equals(end)) {
                    criteria.andCreatetimeEqualTo(start);
                }

                logSearchForm.setStarttime(start);
                logSearchForm.setEndtime(end);
            }
           if ((key != null) && !"".equals(key)) {
        	   	criteria.and("operator like '%"+logSearchForm.getKey()+"%' || event like '%"+logSearchForm.getKey()+"%'");
            }
           
           if(logSearchForm.getOperator()!=null&&!logSearchForm.getOperator().equals("")){
         	   	criteria.and(" operator = '"+logSearchForm.getOperator()+"' ");
           }
        	   
           if(logSearchForm.getType()!=null&&!logSearchForm.getType().equals("")){
          	   	criteria.and(" type = '"+logSearchForm.getType()+"' ");
           }

        Page page = new Page(null, 0, logSearchForm.getPage(), logSearchForm.getSize());
        page.retrievePage(logMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        example.setOrderByClause("createtime desc");
        page.setItems(logMapper.selectByExample(example));
		return page;
	}

	@Override
	public void exportWord(ByteArrayOutputStream fileOutputStream,LogSearchForm logSearchForm) {
        Date start = logSearchForm.getStarttime();
        Date end = logSearchForm.getEndtime();
        Date current = new Date(System.currentTimeMillis());
        String key = logSearchForm.getKey();
		LogExample example = new LogExample();
		LogExample.Criteria criteria = example.createCriteria();
		//criteria.and("status = 0");
        if (start != null) {
            if (end == null) {
                end = current;
            } else if (end.after(current)) {
                end = current;
            }

            if (start.before(end)) {
                criteria.andCreatetimeBetween(start, end);
            } else if (start.equals(end)) {
                criteria.andCreatetimeEqualTo(start);
            }

            logSearchForm.setStarttime(start);
            logSearchForm.setEndtime(end);
        }
       if ((key != null) && !"".equals(key)) {
    	   	criteria.and("operator like '%"+logSearchForm.getKey()+"%' || event like '%"+logSearchForm.getKey()+"%'");
        }
       if(logSearchForm.getOperator()!=null&&!logSearchForm.getOperator().equals("")){
    	   	criteria.and(" operator = '"+logSearchForm.getOperator()+"' ");
      }
       if(logSearchForm.getType()!=null&&!logSearchForm.getType().equals("")){
      	   	criteria.and(" type = '"+logSearchForm.getType()+"' ");
       }

	    example.setOrderByClause("createtime desc");
	    List<Log> logs = logMapper.selectByExample(example);
	    XSSFWorkbook wb = new XSSFWorkbook();
		initXlsx(wb);
		XSSFSheet sheet = wb.createSheet("sheet1");
		int index = 0;
		XSSFRow row0 = sheet.createRow(index);
		XSSFCell cell = row0.createCell(index);
		cell.setCellValue("操作人");
		cell = row0.createCell(1);
		cell.setCellValue("操作内容");
		cell = row0.createCell(2);
		cell.setCellValue("操作时间");
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for(Log log:logs){
			XSSFRow row = sheet.createRow(++index);
			cell = row.createCell(0);
			cell.setCellValue(log.getOperator());
			cell = row.createCell(1);
			cell.setCellValue(log.getEvent());
			cell = row.createCell(2);
			cell.setCellValue(format1.format(log.getCreatetime()));
		}
		
        try {
			wb.write(fileOutputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    public void initXlsx(XSSFWorkbook wb) {
        // 创建字体样式

    	font_xlsx = wb.createFont();
        font_xlsx.setFontName("Verdana");
        font_xlsx.setBoldweight((short) 100);
        font_xlsx.setFontHeight((short) 100);
        font_xlsx.setColor(HSSFColor.BLACK.index);

        //标题样式
        XSSFFont titleFont = wb.createFont();
        titleFont.setFontName("Verdana");
        titleFont.setBold(true);
        titleFont.setFontHeight((short) 150);
        titleFont.setFontHeight((short) 300);
        titleFont.setColor(HSSFColor.BLACK.index);

        titleStyle_xlsx = wb.createCellStyle();
        titleStyle_xlsx.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        titleStyle_xlsx.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        titleStyle_xlsx.setFont(titleFont);

        // 创建单元格样式
        style_xlsx = wb.createCellStyle();
        style_xlsx.setShrinkToFit(true);
        style_xlsx.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style_xlsx.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        //style.setFillForegroundColor(HSSFColor.LIGHT_TURQUOISE.index);
        //style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);

        // 设置边框
        style_xlsx.setBottomBorderColor(HSSFColor.BLACK.index);
        style_xlsx.setLeftBorderColor(HSSFColor.BLACK.index);
        style_xlsx.setRightBorderColor(HSSFColor.BLACK.index);
        style_xlsx.setTopBorderColor(HSSFColor.BLACK.index);
        style_xlsx.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
        style_xlsx.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
        style_xlsx.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
        style_xlsx.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);

        //自动换行
        style_xlsx.setWrapText(true);

        style_xlsx.setFont(font_xlsx);// 设置字体F
    }
    
}
