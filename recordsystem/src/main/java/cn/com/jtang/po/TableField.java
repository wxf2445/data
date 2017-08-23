package cn.com.jtang.po;

import java.util.List;

public class TableField {
	private String fieldid;
	private String type;
	private String name;
	private String recordTypeid;
	private String fieldNo;
	private String fieldName;
	private String length;
	private String tabletype;
	private String valueorindex;
	private String idorvalue;
	private String zeronum;
	private List<GeneralData> datas;
	public String getIdorvalue() {
		return idorvalue;
	}
	public void setIdorvalue(String idorvalue) {
		this.idorvalue = idorvalue;
	}
	public String getZeronum() {
		return zeronum;
	}
	public void setZeronum(String zeronum) {
		this.zeronum = zeronum;
	}
	public List<GeneralData> getDatas() {
		return datas;
	}
	public void setDatas(List<GeneralData> datas) {
		this.datas = datas;
	}
	public String getValueorindex() {
		return valueorindex;
	}
	public void setValueorindex(String valueorindex) {
		this.valueorindex = valueorindex;
	}
	public String getTabletype() {
		return tabletype;
	}
	public void setTabletype(String tabletype) {
		this.tabletype = tabletype;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public String getFieldid() {
		return fieldid;
	}
	public void setFieldid(String fieldid) {
		this.fieldid = fieldid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRecordTypeid() {
		return recordTypeid;
	}
	public void setRecordTypeid(String recordTypeid) {
		this.recordTypeid = recordTypeid;
	}
	public String getFieldNo() {
		return fieldNo;
	}
	public void setFieldNo(String fieldNo) {
		this.fieldNo = fieldNo;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
}
