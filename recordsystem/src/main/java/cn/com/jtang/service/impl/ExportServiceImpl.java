package cn.com.jtang.service.impl;

import cn.com.jtang.dao.DefaultExportMapper;
import cn.com.jtang.po.*;
import cn.com.jtang.service.DanymicService;
import cn.com.jtang.service.ExportService;
import cn.com.jtang.service.GeneralDataService;
import cn.com.jtang.service.LogService;
import cn.com.jtang.service.OutputOrderService;
import cn.com.jtang.service.RecordService;
import cn.com.jtang.service.RecordTypeService;
import cn.com.jtang.service.RecordVolumeService;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.RecordUtil;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.PrintSetup;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * Created by ZJUXP on 2016-07-20.
 */
@Service("exportService")
public class ExportServiceImpl implements ExportService {

    @Resource
    private DanymicService danymicService;
    @Resource
    private DefaultExportMapper defaultExportMapper;
    @Resource
    private RecordTypeService recordTypeService;
    @Resource
    private OutputOrderService outputOrderService;
    @Resource
    private RecordService recordService;
    @Resource
    private GeneralDataService generalDataService;
    @Resource
    private RecordVolumeService recordVolumeService;
    @Resource
    private LogService logService;

    private HSSFFont font;
    private HSSFCellStyle style;
    private HSSFCellStyle titleStyle;

    private XSSFFont font_xlsx;
    private XSSFCellStyle style_xlsx;
    private XSSFCellStyle titleStyle_xlsx;
    //pixels
    public final static Short A4_Height = 297;
    public final static Short A4_CONTENT_Height = 297 - 60;
    public final static Short A4_Width = 600;
    public final static Short A4_RealWidth = 210;
    public final static float Title_Height = 100;
    public final static float Th_Height = 33;
    public final static Short PointsRatio = 20;

    //mm to inch
    public final static float mmToODOInch = 25.4f;


	@Override
	public DefaultExport getDefaultStyle () {
		List<DefaultExport> defaultExports = defaultExportMapper.selectByExample(new DefaultExportExample());
		return defaultExports!=null&&defaultExports.size()>0?defaultExports.get(0):null;
	}

	@Override
    public void exportWord(ByteArrayOutputStream fileOutputStream, List<String> cols, List<String> colnames, JSONArray datas, DefaultExport outputOrder) {
        HSSFWorkbook wb = new HSSFWorkbook();
        init(wb);
        font.setFontHeightInPoints(outputOrder.getFontsize());
        // 创建Excel的工作sheet,对应到一个excel文档的tab
        HSSFSheet sheet = wb.createSheet("sheet1");

        sheet.setDisplayGridlines(false);
        sheet.setPrintGridlines(false);
        sheet.setHorizontallyCenter(true);
        sheet.setMargin(HSSFSheet.LeftMargin, outputOrder.getLeftmargin() / mmToODOInch); //页边距（左）
        sheet.setMargin(HSSFSheet.RightMargin, outputOrder.getRightmargin() / mmToODOInch); //页边距（右）
        sheet.setMargin(HSSFSheet.TopMargin, outputOrder.getTopmargin() / mmToODOInch); //页边距（上）
        sheet.setMargin(HSSFSheet.BottomMargin, outputOrder.getBottommargin() / mmToODOInch); //页边距（下）

		if(outputOrder.getColwidth().indexOf("-")==-1){
			sheet.setDefaultColumnWidth(Integer.parseInt(outputOrder.getColwidth()));
		}else{
			List<String> dd = new ArrayList(Arrays.asList(outputOrder.getColwidth().split("-")));
			for (int colindex = 0; colindex < dd.size(); colindex++) {
				sheet.setColumnWidth(colindex, Integer.parseInt(dd.get(colindex)) / 2 * 256);
			}
		}

        //header
        HSSFHeader header = sheet.getHeader();
        //HSSFHeader.
        header.setCenter(outputOrder.getTitle());

        //footer
        HSSFFooter footer = (HSSFFooter) sheet.getFooter();
        footer.setCenter(outputOrder.getTitle());

        //分页
        sheet.setAutobreaks(false);

        PrintSetup printSetup = sheet.getPrintSetup();
        short paperSize = outputOrder.getStyle().equals("A4") ? HSSFPrintSetup.A4_PAPERSIZE : HSSFPrintSetup.A3_PAPERSIZE;
        printSetup.setPaperSize(paperSize);
        printSetup.setLandscape(outputOrder.getDirection());
        // 设置excel每列宽度 列宽单位：0.1inch（英寸）
        //sheet.setDefaultColumnWidth((int)(outputOrder.getColwidth()/mmToODOInch));
        //short firstDefaultRowHeight = (short)((A4_CONTENT_Height-Title_Height-Th_Height)*mmToODOInch/outputOrder.getPagesize());
        float firstDefaultRowHeight = outputOrder.getLineheight() / mmToODOInch;
        //short noTitleDefaultRowHeight = (short)((A4_CONTENT_Height-Th_Height)/outputOrder.getPagesize()*mmToODOInch);
        //short noTitleDefaultRowHeight = (short)((A4_CONTENT_Height-Th_Height)/outputOrder.getPagesize()*mmToODOInch);
        sheet.setDefaultRowHeightInPoints(firstDefaultRowHeight * 20);

        //title
        int rownum = 0;
        HSSFRow col0 = sheet.createRow(rownum++);
        col0.setHeightInPoints(Title_Height / mmToODOInch * 20);
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, cols.size() - 1));
        HSSFCell titleCell = col0.createCell(0);

        titleCell.setCellValue(outputOrder.getTitle());
        titleCell.setCellStyle(titleStyle);

        //th
        HSSFRow colRow = sheet.createRow(rownum);
        colRow.setHeightInPoints(Th_Height / mmToODOInch * 20);
        int i = 0;
        for (String colName : colnames) {
            HSSFCell cell = colRow.createCell(i++);
            cell.getCellStyle().cloneStyleFrom(style);
            cell.setCellValue(colName);
        }

        rownum++;
        for (int j = 0; j < datas.size(); j++) {

            colRow = sheet.createRow(rownum++);
            /*if(j>9){
                colRow.setHeight(firstDefaultRowHeight);
            }*/
            /*if (j != 0 && j % outputOrder.getPagesize() == 0) {
                sheet.setRowBreak(j);//設置每多少行分頁打印
            }*/
            Object data = datas.get(j);
            Object datavalue = null;

            int cellnum = 0;
            for (String key : cols) {
                if (data instanceof JSONObject) {
                    datavalue = ((JSONObject) data).get(key);
                } else if (data instanceof HashMap) {
                    datavalue = ((HashMap) data).get(key);
                }
                HSSFCell cell = colRow.createCell(cellnum++);
                cell.getCellStyle().cloneStyleFrom(style);
                datavalue = datavalue == null ? "" : datavalue;
                String dString = String.valueOf(datavalue);
                /*if(dString.length()>4){
                    StringBuffer sb = new StringBuffer();
                    int end=0;
                    int all = dString.length();
                    for(int index = 0 ;index<all;index = index+ 4){
                        end = index + 4 >all?all:index+4;
                        sb.append(dString.substring(index,end)).append("\n");
                    }
                    dString = sb.toString();
                }*/
                cell.setCellValue(dString);
            }
        }

        try {
            wb.write(fileOutputStream);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    @Override
    public void exportWord(ByteArrayOutputStream fileOutputStream, String recordTypeId, String recordCategory, String volumeid, List<String> searchIds) {
        String tablePrefix = danymicService.getTablePrefix(recordTypeId);

        String tableName = tablePrefix + recordCategory;
		DefaultExport outputOrder = outputOrderService.selectByTypeIdAndCategory(recordTypeId, recordCategory);
		List<String> selectFields = null;//基础字段+通用值字段
		List<String> basicFields = null;//基础字段+通用值字段
		List<TableField> tableFields = null;//自定义选择字段
		if(outputOrder!=null){
			String order = ((OutputOrder)outputOrder).getOutputcolorder();
			selectFields = new ArrayList<>(Arrays.asList(order.split("-")));
			basicFields = new ArrayList<>(selectFields);
			tableFields = recordTypeService.getCustomIndexFields(recordTypeId, recordCategory);
			Iterator it = tableFields.iterator();
			while (it.hasNext()) {
				TableField tableField = (TableField) it.next();
				if (!selectFields.contains(tableField.getFieldName())) {
					it.remove();
				} else {
					basicFields.remove(tableField.getFieldName());
				}
			}
		} else{
			outputOrder =  getDefaultStyle();
			selectFields = recordTypeService.getBasicFields(recordTypeId, recordCategory);
			basicFields = new ArrayList<>(selectFields);
			tableFields = recordTypeService.getCustomIndexFields(recordTypeId, recordCategory);
		}
		//get volumeinner
		RecordExample example = new RecordExample();
		RecordExample.Criteria criteria = example.createCriteria();
		if (!StringUtils.isEmpty(volumeid)) {
			criteria.andVolumeidEqualTo(volumeid);
		}
		if(searchIds!=null&&searchIds.size()>0){
			criteria.andTargetIdIn(searchIds);
		}
		JSONArray jsonArray = null;
		jsonArray = new JSONArray();
		List<TableField> customValueFields = recordTypeService.getCustomValueFields(recordTypeId, recordCategory);//自定义选择字段
		for(TableField tf:customValueFields){
			if(!basicFields.contains(tf.getFieldName()))
				basicFields.add(tf.getFieldName());
		}
		List<Object> records = danymicService.selectByCols(basicFields, tableFields, tableName, example);
		String logs = "";
		jsonArray.addAll(records);

		for(Object record :jsonArray)
			logs += ((JSONObject)record).getString("subject")+"、";
		logs.substring(0, logs.length()-1);
        logService.insert("批量导出了"+jsonArray.size()+"条记录（"+logs+"）");
		System.out.println(jsonArray);
		//JSONArray datas = getDatas();
		for(TableField tf:tableFields){
			if(!basicFields.contains(tf.getFieldName()))
				basicFields.add(tf.getFieldName());
		}
		Map colmap = danymicService.getColMapValue(recordTypeId, recordCategory);
		List<String> colnames = new ArrayList<>();
		for (String col : basicFields) {
			if (colmap.containsKey(col)) {
				colnames.add((String) colmap.get(col));
			}
		}
		exportWord(fileOutputStream, basicFields, colnames, jsonArray, outputOrder);
    }

    @Override
    public void exportWord(ByteArrayOutputStream byteArrayOutputStream, String recordTypeId, String recordCategory, List<String> selectids) {
        String tablePrefix = danymicService.getTablePrefix(recordTypeId);

        String tableName = tablePrefix + recordCategory;
		DefaultExport outputOrder = outputOrderService.selectByTypeIdAndCategory(recordTypeId, recordCategory);

		List<String> selectFields = null;//基础字段+通用值字段
		List<String> basicFields = null;//基础字段+通用值字段
		List<TableField> tableFields = null;//自定义选择字段
		if(outputOrder!=null){
			String order = ((OutputOrder)outputOrder).getOutputcolorder();
			selectFields = new ArrayList<>(Arrays.asList(order.split("-")));
			basicFields = new ArrayList<>(selectFields);
			tableFields = recordTypeService.getCustomIndexFields(recordTypeId, recordCategory);
			Iterator it = tableFields.iterator();
			while (it.hasNext()) {
				TableField tableField = (TableField) it.next();
				if (!basicFields.contains(tableField.getFieldName())) {
					it.remove();
				} else {
					basicFields.remove(tableField.getFieldName());
				}
			}
		}else{
			outputOrder = getDefaultStyle();
			selectFields = recordTypeService.getBasicFields(recordTypeId, recordCategory);
			basicFields = new ArrayList<>(selectFields);
			tableFields = recordTypeService.getCustomIndexFields(recordTypeId, recordCategory);
		}

        RecordExample example = new RecordExample();
        RecordExample.Criteria criteria = example.createCriteria();
        if (selectids != null && !selectids.isEmpty()) {
            criteria.andThisIdIn(selectids);
        }
        JSONArray jsonArray = new JSONArray();
		List<TableField> customValueFields = recordTypeService.getCustomValueFields(recordTypeId, recordCategory);//自定义选择字段
		for(TableField tf:customValueFields){
			if(!basicFields.contains(tf.getFieldName()))
				basicFields.add(tf.getFieldName());
		}
        List<Object> records = danymicService.selectByCols(basicFields, tableFields, tableName, example);
        jsonArray.addAll(records);
        System.out.println(jsonArray);
        String logs = "";
		for(Object record :jsonArray)
			logs += ((JSONObject)record).getString("subject")+"、";
		logs.substring(0, logs.length()-1);
        logService.insert("批量导出了"+jsonArray.size()+"条记录（"+logs+"）");
        
        //JSONArray datas = getDatas();
		for(TableField tf:tableFields){
			if(!basicFields.contains(tf.getFieldName()))
				basicFields.add(tf.getFieldName());
		}
        Map colmap = danymicService.getColMapValue(recordTypeId, recordCategory);
        List<String> colnames = new ArrayList<>();
        for (String col : basicFields) {
            if (colmap.containsKey(col)) {
                colnames.add((String) colmap.get(col));
            }
        }

        exportWord(byteArrayOutputStream, basicFields, colnames, jsonArray, outputOrder);
    }



    public void init(HSSFWorkbook wb) {
        // 创建字体样式

        font = wb.createFont();
        font.setFontName("Verdana");
        font.setBoldweight((short) 100);
        font.setFontHeight((short) 100);
        font.setColor(HSSFColor.BLACK.index);

        //标题样式
        HSSFFont titleFont = wb.createFont();
        titleFont.setFontName("Verdana");
        titleFont.setBold(true);
        titleFont.setFontHeight((short) 150);
        titleFont.setFontHeight((short) 300);
        titleFont.setColor(HSSFColor.BLACK.index);

        titleStyle = wb.createCellStyle();
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        titleStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        titleStyle.setFont(titleFont);

        // 创建单元格样式
        style = wb.createCellStyle();
        style.setShrinkToFit(true);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        //style.setFillForegroundColor(HSSFColor.LIGHT_TURQUOISE.index);
        //style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);

        // 设置边框
        style.setBottomBorderColor(HSSFColor.BLACK.index);
        style.setLeftBorderColor(HSSFColor.BLACK.index);
        style.setRightBorderColor(HSSFColor.BLACK.index);
        style.setTopBorderColor(HSSFColor.BLACK.index);
        style.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
        style.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
        style.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
        style.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);

        //自动换行
        style.setWrapText(true);

        style.setFont(font);// 设置字体F
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
/*
    public static void main(String[] args) throws Exception {
        // 创建Excel的工作书册 Workbook,对应到一个excel文档
        HSSFWorkbook wb = new HSSFWorkbook();
        // 创建Excel的工作sheet,对应到一个excel文档的tab
        HSSFSheet sheet = wb.createSheet("sheet1");

        // 设置excel每列宽度
        sheet.setColumnWidth(0, 4000);
        sheet.setColumnWidth(1, 3500);

        // 创建字体样式
        HSSFFont font = wb.createFont();
        font.setFontName("Verdana");
        font.setBoldweight((short) 100);
        font.setFontHeight((short) 300);
        font.setColor(HSSFColor.BLUE.index);

        // 创建单元格样式
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        style.setFillForegroundColor(HSSFColor.LIGHT_TURQUOISE.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);

        // 设置边框
        style.setBottomBorderColor(HSSFColor.RED.index);
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);

        style.setFont(font);// 设置字体

		*/
/*	// 创建Excel的sheet的一行
        HSSFRow row = sheet.createRow(0);
		row.setHeight((short) 500);// 设定行的高度
		// 创建一个Excel的单元格
		HSSFCell cell = row.createCell(0);

		// 合并单元格(startRow，endRow，startColumn，endColumn)
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 2));

		// 给Excel的单元格设置样式和赋值
		cell.getCellStyle().cloneStyleFrom(style);
		cell.setCellValue("hello world");

		// 设置单元格内容格式
		HSSFCellStyle style1 = wb.createCellStyle();
		style1.setDataFormat(HSSFDataFormat.getBuiltinFormat("h:mm:ss"));

		style1.setWrapText(true);// 自动换行

		row = sheet.createRow(1);

		// 设置单元格的样式格式

		cell = row.createCell(0);
		cell.setCellStyle(style1);
		cell.setCellValue(new Date());

		// 创建超链接
		HSSFHyperlink link = new HSSFHyperlink(HSSFHyperlink.LINK_URL);
		link.setAddress("http://www.baidu.com");
		cell = row.createCell(1);
		cell.setCellValue("百度");
		cell.setHyperlink(link);// 设定单元格的链接
*//*


        HSSFRow row = sheet.createRow(0);//创建行
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("序列号");

        cell = row.createCell(1);
        cell.setCellValue("设备名称");

        cell = row.createCell(2);
        cell.setCellValue("温度");

        cell = row.createCell(3);
        cell.setCellValue("采集时间");


        FileOutputStream os = new FileOutputStream("e:\\workbook.xls");
        wb.write(os);
        os.close();
    }
*/

	@Override
	public void exportExcelModal(ByteArrayOutputStream fileOutputStream,
			String recordTypeId, String type ) {
		
		List<TableField> colnames = recordTypeService.getAllTableField(recordTypeId, type);
		
		// 创建Excel的工作书册 Workbook,对应到一个excel文档
        HSSFWorkbook wb = new HSSFWorkbook();
        init(wb);
        // 创建Excel的工作sheet,对应到一个excel文档的tab
        HSSFSheet sheet = wb.createSheet("sheet1");
	// 创建Excel的sheet的一行
        HSSFRow row = sheet.createRow(0);
		// 创建一个Excel的单元格
        int k = 0;
        if(type.equals(RecordUtil.RECORD)){
    		HSSFCell cell = row.createCell(k++);
    		//cell.getCellStyle().cloneStyleFrom(style);
    		//cell.setCellStyle(style);
    		cell.setCellValue("案卷号");
        }
		for(int i=0;i<colnames.size();i++){
			if(colnames.get(i).getFieldName().equals(RecordUtil.FONDSID))
				continue;
			HSSFCell cell = row.createCell(k++);
			// 给Excel的单元格设置样式和赋值
			//cell.getCellStyle().cloneStyleFrom(style);
    		//cell.setCellStyle(style);
			cell.setCellValue(colnames.get(i).getName());
		}
        try {
			wb.write(fileOutputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public CountAndNums uploadXls(InputStream inputStream, String recordTypeId,
			String type,String cover,HttpSession session) {
    	List<Integer> isexcist = new ArrayList<Integer>();
    	List<Integer> novolumeno = new ArrayList<Integer>();
    	List<Integer> nogeneraldata = new ArrayList<Integer>();
    	List<Integer> errornums = new ArrayList<Integer>();
    	List<Integer> successnums = new ArrayList<Integer>();
    	int count = 0;
		UploadRecordSession uploadRecordSession = new UploadRecordSession();
        try {
			
        	RecordType recordType = recordTypeService.selectByPrimaryKey(recordTypeId);
        	String tableprefix = recordType.getRecordtable().replace(RecordUtil.RECORD, "");
        	
			HSSFWorkbook wb = new HSSFWorkbook(inputStream);
			HSSFSheet sheet = wb.getSheet("sheet1");
			int rowNum=sheet.getLastRowNum();
			HSSFRow row0 = sheet.getRow(0);
			int columnNum=row0.getPhysicalNumberOfCells();

			List<String> colnames = new ArrayList<String>();
			List<String> colfieldnames = new ArrayList<String>();
			for(int i=0;i<columnNum;i++){
				HSSFCell cell = row0.getCell(i,HSSFRow.CREATE_NULL_AS_BLANK);
				String cellvalue = "";
				if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING)
					cellvalue = cell.getStringCellValue();
				else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC)
					cellvalue = (int)(cell.getNumericCellValue()/1)+"";
				colnames.add(cellvalue);
			}
			
			List<TableField> tfs = recordTypeService.getAllTableField(recordTypeId, type);
			Map<String,List<GeneralData>> map = new HashMap<String, List<GeneralData>>();
			
			List<Integer> indexcolnum = new ArrayList<Integer>();
			List<String> tffieldnames = new ArrayList<String>();
			for(TableField tf:tfs){
				tffieldnames.add(tf.getName());
			}
			int j=-1;
			int id_index = 0;
			int subject_index = 0;
			for(String colname:colnames){
				j++;
				if(type.equals(RecordUtil.RECORD)&&colname.equals("案卷号")){
					colfieldnames.add("volumeid");
					continue;
				}
				boolean iswork = false;
				for(TableField tf:tfs){
					if(colname.equals(tf.getName())){
						if(colname.equals("档号")||colname.equals("案卷号"))
							id_index = j;
						if(tf.getFieldName().equals(RecordUtil.SUBJECT))
							subject_index = j;
						if(tf.getFieldName().equals(RecordUtil.YEAR)||tf.getFieldName().equals(RecordUtil.DEPARTMENT)||tf.getFieldName().equals(RecordUtil.DEADLINE)||
								(tf.getValueorindex()!=null&&tf.getValueorindex().equals(1+""))){
							indexcolnum.add(j);
							map.put(j+"", generalDataService.getAllGeneralData(tf.getFieldName()));
						}
						colfieldnames.add(tf.getFieldName());
						iswork = true;
						break;
					}
				}
				if(!iswork){
					return null;
				}
			}
			for(int i=1;i<=rowNum;i++){
				uploadRecordSession.setNumber(i-1);
				uploadRecordSession.setTotal(rowNum);
				
				boolean isnovolumeno = false;
		        HSSFRow row = sheet.getRow(i);
		        if(row==null)break;
				List<String> colvalues = new ArrayList<String>();
				boolean haved = false;
				int k=0;
				if(type.equals(RecordUtil.RECORD)){
					HSSFCell cell = row.getCell(k++,HSSFRow.CREATE_NULL_AS_BLANK);
					String cellvalue = "";
					if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING)
						cellvalue = cell.getStringCellValue();
					else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC)
						cellvalue = (int)(cell.getNumericCellValue()/1)+"";

/*					if(!recordVolumeService.isExistByNo(cellvalue)){
						novolumeno.add(i);
						continue;
					};*/
					
					String volumeid = recordVolumeService.getVolumeidByVolumeNo(cellvalue, tableprefix+RecordUtil.VOLUME);
					if(volumeid==null){
						isnovolumeno = true;
						break;
					}
					colvalues.add(volumeid);
				}

				if(isnovolumeno){
					novolumeno.add(i);
					continue;
				}
				
				boolean isexcisted = false;
				for(;k<columnNum;k++){
					HSSFCell cell = row.getCell(k,HSSFRow.CREATE_NULL_AS_BLANK);
					String cellvalue = "";
					if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING)
						cellvalue = cell.getStringCellValue();
					else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC)
						cellvalue = (int)(cell.getNumericCellValue()/1)+"";
					

					if(subject_index == k){
						uploadRecordSession.setSubject(cellvalue);
					}
					
					if(k==id_index)
						if(recordVolumeService.isExistByNo(cellvalue)){
							if(cover.equals("true")){
								recordVolumeService.deleteByNo(cellvalue, tableprefix, type, recordTypeId);
							}else{
								isexcisted = true;
								break;
							}
						}
					
					if(indexcolnum.contains(k)){
						haved = false;
						List<GeneralData> gds= map.get(k+"");
						for(GeneralData gd:gds){
							System.out.println(gd.getName()+" "+cellvalue);
							if(gd.getName().equals(cellvalue)){
								haved = true;
								colvalues.add(gd.getId());
								break;
							}
						}
						if(!haved)
							break;
					}else{
						colvalues.add(cellvalue);
					}
				}
				if(isexcisted){
					isexcist.add(i);
					continue;
				}
				
				if(!haved){
					nogeneraldata.add(i);
					continue;
				}
				try{
					count+=recordService.insert(colfieldnames, colvalues,tableprefix+type,IDGenerator.generator());
					successnums.add(i);
					session.setAttribute("uploadRecordSession",uploadRecordSession);
				}catch(Exception e){
					e.printStackTrace();
					errornums.add(i);
				}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
        CountAndNums countAndNums = new CountAndNums();
        countAndNums.setCount(count);
        
        countAndNums.setErrornums(errornums);
        countAndNums.setSuccessnums(successnums);
        countAndNums.setIsexcist(isexcist);
        countAndNums.setNogeneraldata(nogeneraldata);
        countAndNums.setNovolumeno(novolumeno);
        session.removeAttribute("uploadRecordSession");
		return countAndNums;
	}
	@Override
	public CountAndNums uploadSlsx(InputStream inputStream, String recordTypeId,
			String type,String cover,HttpSession session) {
    	List<Integer> isexcist = new ArrayList<Integer>();
    	List<Integer> novolumeno = new ArrayList<Integer>();
    	List<Integer> nogeneraldata = new ArrayList<Integer>();
    	List<Integer> errornums = new ArrayList<Integer>();
    	List<Integer> successnums = new ArrayList<Integer>();
    	int count = 0;
		UploadRecordSession uploadRecordSession = new UploadRecordSession();
        try {
			
        	RecordType recordType = recordTypeService.selectByPrimaryKey(recordTypeId);
        	String tableprefix = recordType.getRecordtable().replace(RecordUtil.RECORD, "");
        	
        	XSSFWorkbook  wb = new XSSFWorkbook (inputStream);
        	XSSFSheet sheet = wb.getSheet("sheet1");
			int rowNum=sheet.getLastRowNum();
			XSSFRow row0 = sheet.getRow(0);
			int columnNum=row0.getPhysicalNumberOfCells();

			List<String> colnames = new ArrayList<String>();
			List<String> colfieldnames = new ArrayList<String>();
			for(int i=0;i<columnNum;i++){
				XSSFCell cell = row0.getCell(i,XSSFRow.CREATE_NULL_AS_BLANK);
				String cellvalue = "";
				if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING)
					cellvalue = cell.getStringCellValue();
				else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC)
					cellvalue = (int)(cell.getNumericCellValue()/1)+"";
				colnames.add(cellvalue);
			}
			
			List<TableField> tfs = recordTypeService.getAllTableField(recordTypeId, type);
			Map<String,List<GeneralData>> map = new HashMap<String, List<GeneralData>>();
			
			List<Integer> indexcolnum = new ArrayList<Integer>();
			List<String> tffieldnames = new ArrayList<String>();
			for(TableField tf:tfs){
				tffieldnames.add(tf.getName());
			}
			int j=-1;
			int id_index = 0;
			int subject_index = 0;
			for(String colname:colnames){
				j++;
				if(type.equals(RecordUtil.RECORD)&&colname.equals("案卷号")){
					colfieldnames.add("volumeid");
					continue;
				}
				boolean iswork = false;
				for(TableField tf:tfs){
					if(colname.equals(tf.getName())){
						if(colname.equals("档号")||colname.equals("案卷号"))
							id_index = j;
						if(tf.getFieldName().equals(RecordUtil.SUBJECT))
							subject_index = j;
						if(tf.getFieldName().equals(RecordUtil.YEAR)||tf.getFieldName().equals(RecordUtil.DEPARTMENT)||tf.getFieldName().equals(RecordUtil.DEADLINE)||
								(tf.getValueorindex()!=null&&tf.getValueorindex().equals(1+""))){
							indexcolnum.add(j);
							map.put(j+"", generalDataService.getAllGeneralData(tf.getFieldName()));
						}
						colfieldnames.add(tf.getFieldName());
						iswork = true;
						break;
					}
				}
				if(!iswork){
					return null;
				}
			}
			for(int i=1;i<=rowNum;i++){
				uploadRecordSession.setNumber(i-1);
				uploadRecordSession.setTotal(rowNum);
				
				boolean isnovolumeno = false;
		        XSSFRow row = sheet.getRow(i);
		        if(row==null)break;
				List<String> colvalues = new ArrayList<String>();
				boolean haved = false;
				int k=0;
				if(type.equals(RecordUtil.RECORD)){
					XSSFCell cell = row.getCell(k++,XSSFRow.CREATE_NULL_AS_BLANK);
					String cellvalue = "";
					if(cell.getCellType()==XSSFCell.CELL_TYPE_STRING)
						cellvalue = cell.getStringCellValue();
					else if(cell.getCellType()==XSSFCell.CELL_TYPE_NUMERIC)
						cellvalue = (int)(cell.getNumericCellValue()/1)+"";

/*					if(!recordVolumeService.isExistByNo(cellvalue)){
						novolumeno.add(i);
						continue;
					};*/
					
					String volumeid = recordVolumeService.getVolumeidByVolumeNo(cellvalue, tableprefix+RecordUtil.VOLUME);
					if(volumeid==null){
						isnovolumeno = true;
						break;
					}
					colvalues.add(volumeid);
				}

				if(isnovolumeno){
					novolumeno.add(i);
					continue;
				}
				
				boolean isexcisted = false;
				for(;k<columnNum;k++){
					XSSFCell cell = row.getCell(k,XSSFRow.CREATE_NULL_AS_BLANK);
					String cellvalue = "";
					if(cell.getCellType()==XSSFCell.CELL_TYPE_STRING)
						cellvalue = cell.getStringCellValue();
					else if(cell.getCellType()==XSSFCell.CELL_TYPE_NUMERIC)
						cellvalue = (int)(cell.getNumericCellValue()/1)+"";
					

					if(subject_index == k){
						uploadRecordSession.setSubject(cellvalue);
					}
					
					if(k==id_index)
						if(recordVolumeService.isExistByNo(cellvalue)){
							if(cover.equals("true")){
								recordVolumeService.deleteByNo(cellvalue, tableprefix, type, recordTypeId);
							}else{
								isexcisted = true;
								break;
							}
						}
					
					if(indexcolnum.contains(k)){
						haved = false;
						List<GeneralData> gds= map.get(k+"");
						for(GeneralData gd:gds){
							System.out.println(gd.getName()+" "+cellvalue);
							if(gd.getName().equals(cellvalue)){
								haved = true;
								colvalues.add(gd.getId());
								break;
							}
						}
						if(!haved)
							break;
					}else{
						colvalues.add(cellvalue);
					}
				}
				if(isexcisted){
					isexcist.add(i);
					continue;
				}
				
				if(!haved){
					nogeneraldata.add(i);
					continue;
				}
				try{
					count+=recordService.insert(colfieldnames, colvalues,tableprefix+type,IDGenerator.generator());
					successnums.add(i);
					session.setAttribute("uploadRecordSession",uploadRecordSession);
				}catch(Exception e){
					e.printStackTrace();
					errornums.add(i);
				}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
        CountAndNums countAndNums = new CountAndNums();
        countAndNums.setCount(count);
        
        countAndNums.setErrornums(errornums);
        countAndNums.setSuccessnums(successnums);
        countAndNums.setIsexcist(isexcist);
        countAndNums.setNogeneraldata(nogeneraldata);
        countAndNums.setNovolumeno(novolumeno);
        session.removeAttribute("uploadRecordSession");
		return countAndNums;
	}

	

	@Override
	public void getErrorXls(ByteArrayOutputStream fileOutputStream,InputStream inputStream, String recordTypeId, String type,
			String errornums, String successnums, String isexcist,
			String novolumeno, String nogeneraldata) {
		
		HSSFWorkbook wb = null;
		try {
			wb = new HSSFWorkbook(inputStream);
	        init(wb);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		HSSFSheet sheet = wb.getSheet("sheet1");
		HSSFRow row0 = sheet.getRow(0);
		int lastcol = row0.getPhysicalNumberOfCells();
		HSSFCell cell = row0.createCell(lastcol);
		
		//cell.setCellStyle(style);
		cell.getCellStyle().cloneStyleFrom(style);
		cell.setCellValue("失败原因");
		
		if(isexcist!=null&&!isexcist.equals("")){
			String [] isexcists = isexcist.split(",");
			for(String isexcistss:isexcists){
				int num1 = Integer.valueOf(isexcistss);
				HSSFRow row = sheet.getRow(num1);
				cell = row.createCell(lastcol);
				cell.getCellStyle().cloneStyleFrom(style);
				if(type.equals(RecordUtil.VOLUME))
					cell.setCellValue("案卷号已经存在");
				else
					cell.setCellValue("档号已经存在");
			}
		}

		if(novolumeno!=null&&!novolumeno.equals("")){
			String [] novolumenos = novolumeno.split(",");
			for(String novolumenoss:novolumenos){
				int num1 = Integer.valueOf(novolumenoss);
				HSSFRow row = sheet.getRow(num1);
				cell = row.createCell(lastcol);
				cell.getCellStyle().cloneStyleFrom(style);
				cell.setCellValue("案卷号不存在");
			}
		}

		if(nogeneraldata!=null&&!nogeneraldata.equals("")){
			String [] nogeneraldatas = nogeneraldata.split(",");
			for(String nogeneraldatass:nogeneraldatas){
				int num1 = Integer.valueOf(nogeneraldatass);
				HSSFRow row = sheet.getRow(num1);
				cell = row.createCell(lastcol);
				cell.getCellStyle().cloneStyleFrom(style);
				cell.setCellValue("通用数据不匹配");
			}
		}

		if(errornums!=null&&!errornums.equals("")){
			String [] errornumss = errornums.split(",");
			for(String errornum:errornumss){
				int num1 = Integer.valueOf(errornum);
				HSSFRow row = sheet.getRow(num1);
				cell = row.createCell(lastcol);
				cell.getCellStyle().cloneStyleFrom(style);
				cell.setCellValue("请检查数据格式是否对应。如：顺序号必须为数字。题名过长等");
			}
		}
		

		int num2 = sheet.getLastRowNum();
		if(successnums!=null && !successnums.equals("")){
			String [] successnumss = successnums.split(",");
			for(int i=successnumss.length-1;i>=0;i--){
				String successnum = successnumss[i];
				int num1 = Integer.valueOf(successnum);
				if(num1==num2)
					sheet.removeRow(sheet.getRow(num1));
				else
					sheet.shiftRows(Integer.valueOf(successnum)+1,num2,-1);
			}
		}
		
        try {
			wb.write(fileOutputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void getErrorXlsx(ByteArrayOutputStream fileOutputStream,InputStream inputStream, String recordTypeId, String type,
			String errornums, String successnums, String isexcist,
			String novolumeno, String nogeneraldata) {
		
		XSSFWorkbook wb = null;
		try {
			wb = new XSSFWorkbook(inputStream);
	        initXlsx(wb);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		XSSFSheet sheet = wb.getSheet("sheet1");
		XSSFRow row0 = sheet.getRow(0);
		int lastcol = row0.getPhysicalNumberOfCells();
		XSSFCell cell = row0.createCell(lastcol);
		
		//cell.setCellStyle(style);
		cell.getCellStyle().cloneStyleFrom(style_xlsx);
		cell.setCellValue("失败原因");
		
		if(isexcist!=null&&!isexcist.equals("")){
			String [] isexcists = isexcist.split(",");
			for(String isexcistss:isexcists){
				int num1 = Integer.valueOf(isexcistss);
				XSSFRow row = sheet.getRow(num1);
				cell = row.createCell(lastcol);
				cell.getCellStyle().cloneStyleFrom(style_xlsx);
				if(type.equals(RecordUtil.VOLUME))
					cell.setCellValue("案卷号已经存在");
				else
					cell.setCellValue("档号已经存在");
			}
		}

		if(novolumeno!=null&&!novolumeno.equals("")){
			String [] novolumenos = novolumeno.split(",");
			for(String novolumenoss:novolumenos){
				int num1 = Integer.valueOf(novolumenoss);
				XSSFRow row = sheet.getRow(num1);
				cell = row.createCell(lastcol);
				cell.getCellStyle().cloneStyleFrom(style_xlsx);
				cell.setCellValue("案卷号不存在");
			}
		}

		if(nogeneraldata!=null&&!nogeneraldata.equals("")){
			String [] nogeneraldatas = nogeneraldata.split(",");
			for(String nogeneraldatass:nogeneraldatas){
				int num1 = Integer.valueOf(nogeneraldatass);
				XSSFRow row = sheet.getRow(num1);
				cell = row.createCell(lastcol);
				cell.getCellStyle().cloneStyleFrom(style_xlsx);
				cell.setCellValue("通用数据不匹配");
			}
		}

		if(errornums!=null&&!errornums.equals("")){
			String [] errornumss = errornums.split(",");
			for(String errornum:errornumss){
				int num1 = Integer.valueOf(errornum);
				XSSFRow row = sheet.getRow(num1);
				cell = row.createCell(lastcol);
				cell.getCellStyle().cloneStyleFrom(style_xlsx);
				cell.setCellValue("请检查数据格式是否对应。如：顺序号必须为数字。题名过长等");
			}
		}
		

		int num2 = sheet.getLastRowNum();
		if(successnums!=null && !successnums.equals("")){
			String [] successnumss = successnums.split(",");
			for(int i=successnumss.length-1;i>=0;i--){
				String successnum = successnumss[i];
				int num1 = Integer.valueOf(successnum);
				if(num1==num2)
					sheet.removeRow(sheet.getRow(num1));
				else
					sheet.shiftRows(Integer.valueOf(successnum)+1,num2,-1);
			}
		}
		
        try {
			wb.write(fileOutputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	@Override
	public int updateDefaultStyle (DefaultExport setting) {
		int num = 0;
		if(defaultExportMapper.selectByPrimaryKey(setting.getEid())!=null){
			num = defaultExportMapper.updateByPrimaryKeySelective(setting);
		}else{
			setting.setEid(IDGenerator.generator());
			num = defaultExportMapper.insertSelective(setting);
		}
		return num;
	}


	public class CountAndNums{
		int count ;
		List<Integer> errornums ;
		List<Integer> successnums ;
		List<Integer> isexcist ;
		List<Integer> novolumeno ;
		List<Integer> nogeneraldata ;
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
		public List<Integer> getErrornums() {
			return errornums;
		}
		public void setErrornums(List<Integer> errornums) {
			this.errornums = errornums;
		}
		public List<Integer> getSuccessnums() {
			return successnums;
		}
		public void setSuccessnums(List<Integer> successnums) {
			this.successnums = successnums;
		}
		public List<Integer> getIsexcist() {
			return isexcist;
		}
		public void setIsexcist(List<Integer> isexcist) {
			this.isexcist = isexcist;
		}
		public List<Integer> getNovolumeno() {
			return novolumeno;
		}
		public void setNovolumeno(List<Integer> novolumeno) {
			this.novolumeno = novolumeno;
		}
		public List<Integer> getNogeneraldata() {
			return nogeneraldata;
		}
		public void setNogeneraldata(List<Integer> nogeneraldata) {
			this.nogeneraldata = nogeneraldata;
		}
	}


	@Override
	public List<Map> uploadXlsInfo(InputStream inputStream, List<Info> infos) {
		List<Map> maps = new ArrayList<Map>();
		
		HSSFWorkbook wb = null;
		try {
			wb = new HSSFWorkbook (inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	HSSFSheet sheet = wb.getSheet("sheet1");
		int rowNum=sheet.getLastRowNum();
		HSSFRow row0 = sheet.getRow(0);
		int columnNum=row0.getPhysicalNumberOfCells();


		int[] ints = new int[infos.size()];
		
		if(columnNum>infos.size())
			return null;
		
    	for(int i=0;i<infos.size();i++){
    		for(int k=0;k<columnNum;k++){
    	        HSSFRow row = sheet.getRow(0);
    			HSSFCell cell = row.getCell(k,HSSFRow.CREATE_NULL_AS_BLANK);
    			String cellvalue = "";
    			if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING)
    				cellvalue = cell.getStringCellValue();
    			else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC)
    				cellvalue = (int)(cell.getNumericCellValue()/1)+"";
    			if(infos.get(i).getColumnname().equals(cellvalue)){
    				ints[k] = i;
    			}
    		}
    	}

		for(int i=1;i<=rowNum;i++){
	        HSSFRow row = sheet.getRow(i);
	        if(row==null)break;
	        
	        Map map = new HashMap();
			for(int k=0;k<columnNum;k++){
				HSSFCell cell = row.getCell(k,HSSFRow.CREATE_NULL_AS_BLANK);
				String cellvalue = "";
				if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING)
					cellvalue = cell.getStringCellValue();
				else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC)
					cellvalue = (int)(cell.getNumericCellValue()/1)+"";
				if(cellvalue.length()>Integer.parseInt(infos.get(ints[k]).getColumnwidth())){
					return null;
				}
				map.put(infos.get(ints[k]).getColumnname(), cellvalue.replace(",", "，"));
			}
			maps.add(map);
		}
		
	
		return maps;
	}

	@Override
	public List<Map> uploadXlsxInfo(InputStream inputStream, List<Info> infos) {
		List<Map> maps = new ArrayList<Map>();
		
		XSSFWorkbook wb = null;
		try {
			wb = new XSSFWorkbook (inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	XSSFSheet sheet = wb.getSheet("sheet1");
		int rowNum=sheet.getLastRowNum();
		XSSFRow row0 = sheet.getRow(0);
		int columnNum=row0.getPhysicalNumberOfCells();


		int[] ints = new int[infos.size()];
		
		if(columnNum>infos.size())
			return null;
		
    	for(int i=0;i<infos.size();i++){
    		for(int k=0;k<columnNum;k++){
    	        XSSFRow row = sheet.getRow(0);
    			XSSFCell cell = row.getCell(k,XSSFRow.CREATE_NULL_AS_BLANK);
    			String cellvalue = "";
    			if(cell.getCellType()==XSSFCell.CELL_TYPE_STRING)
    				cellvalue = cell.getStringCellValue();
    			else if(cell.getCellType()==XSSFCell.CELL_TYPE_NUMERIC)
    				cellvalue = (int)(cell.getNumericCellValue()/1)+"";
    			if(infos.get(i).getColumnname().equals(cellvalue)){
    				ints[k] = i;
    			}
    		}
    	}

		for(int i=1;i<=rowNum;i++){
	        XSSFRow row = sheet.getRow(i);
	        if(row==null)break;
	        
	        Map map = new HashMap();
			for(int k=0;k<columnNum;k++){
				XSSFCell cell = row.getCell(k,XSSFRow.CREATE_NULL_AS_BLANK);
				String cellvalue = "";
				if(cell.getCellType()==XSSFCell.CELL_TYPE_STRING)
					cellvalue = cell.getStringCellValue();
				else if(cell.getCellType()==XSSFCell.CELL_TYPE_NUMERIC)
					cellvalue = (int)(cell.getNumericCellValue()/1)+"";
				if(cellvalue.length()>Integer.parseInt(infos.get(ints[k]).getColumnwidth())){
					return null;
				}
				map.put(infos.get(ints[k]).getColumnname(), cellvalue.replace(",", "，"));
			}
			maps.add(map);
		}
		
	
		return maps;
		}
}
