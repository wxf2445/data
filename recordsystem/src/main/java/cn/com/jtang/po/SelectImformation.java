package cn.com.jtang.po;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.jtang.util.RecordUtil;

public class SelectImformation {
	String tablename;
	String recordid;
	String title;
	String recordNo;
	List<Field> fields;
	public SelectImformation(String tablename,String recordid,List<TableField> fields){
		this.tablename = tablename.toLowerCase();
		this.recordid = recordid;
		this.fields = new ArrayList<Field>();
		for(TableField tf:fields){
			Field f = new Field();
			f.setFieldname(tf.getFieldName());
			f.setName(tf.getName());
			if(tf.getValueorindex()!=null&&tf.getValueorindex().equals("1"))
				f.setValueorindex(tf.getValueorindex());
			this.fields.add(f);
		}
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public List<Field> getField() {
		return fields;
	}
	public void setField(List<Field> field) {
		this.fields = field;
	}
	public List<Field> setFieldByMap(Map<String,Object> field) {
		for(int i=0;i<this.fields.size();i++){
			this.fields.get(i).setFieldvalue(field.get(this.fields.get(i).getFieldname())+"");
			if(this.fields.get(i).getFieldname().equals("subject"))
				this.title = field.get(this.fields.get(i).getFieldname())+"";
			if(this.fields.get(i).getFieldname().equals("recordNo"))
				this.recordNo = field.get(this.fields.get(i).getFieldname())+"";
		}
		return this.fields;
	}
	public String getRecordid() {
		return recordid;
	}
	public void setRecordid(String recordid) {
		this.recordid = recordid;
	}
	/*Map<String,Object> map = new HashMap<>()*/;
	public String getTitle() {
		return title;
	}
	public String getRecordNo() {
		return recordNo;
	}
	public void setRecordNo(String recordNo) {
		this.recordNo = recordNo;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<Field> getFields() {
		return fields;
	}
	public void setFields(List<Field> fields) {
		this.fields = fields;
	}
	public class Field{
		String fieldname;
		String name;
		String fieldvalue;
		String valueorindex;
		public String getValueorindex() {
			return valueorindex;
		}
		public void setValueorindex(String valueorindex) {
			this.valueorindex = valueorindex;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getFieldname() {
			return fieldname;
		}
		public void setFieldname(String fieldname) {
			this.fieldname = fieldname;
		}
		public String getFieldvalue() {
			return fieldvalue;
		}
		public void setFieldvalue(String fieldvalue) {
			this.fieldvalue = fieldvalue;
		}
	}
}
