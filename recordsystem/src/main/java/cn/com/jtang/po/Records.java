package cn.com.jtang.po;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Records {
	List<Record> records;
	
	public Records(List<Map<String,Object>> recordsMap,List<TableField> recordFields,String volumeid){
		records = new ArrayList<>();
		for(Map<String,Object> map:recordsMap)
			records.add(new Record(map,recordFields, volumeid));
	}
	
	public class Record{
		String volumeid;
		String id;
		List<Field> fields ;
		
		
		public Record(Map<String,Object> record,List<TableField> recordFields,String volumeid){
			this.volumeid = volumeid;
			fields = new ArrayList<>();
			for(TableField recordField:recordFields ){
				fields.add(new Field(recordField.getFieldName(),""+record.get(recordField.getFieldName())));
				if("id".equals(recordField.getFieldName())){
					this.id = record.get(recordField.getFieldName())+"";
				}
			}
		}
		
		
		public List<Field> getFields() {
			return fields;
		}
		public void setFields(List<Field> fields) {
			this.fields = fields;
		}
		public String getVolumeid() {
			return volumeid;
		}
		public void setVolumeid(String volumeid) {
			this.volumeid = volumeid;
		}
		public String getId() {
			return id;
		}


		public void setId(String id) {
			this.id = id;
		}
	}
	
	public class Field{
		String fieldname;
		String value;
		
		
		public Field(String fieldname,String value){
			this.fieldname = fieldname;
			this.value = value;
		}
		
		
		
		public String getFieldname() {
			return fieldname;
		}
		public void setFieldname(String fieldname) {
			this.fieldname = fieldname;
		}
		public String getValue() {
			return value;
		}
		public void setValue(String value) {
			this.value = value;
		}
	}

	public List<Record> getRecords() {
		return records;
	}
	public void setRecords(List<Record> records) {
		this.records = records;
	}
}
