package cn.com.jtang.po;

import java.util.ArrayList;
import java.util.List;

public class InsertExample {
	private String tableName;
	private List<Attribute> fields_value;
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public List<Attribute> getFields() {
		return fields_value;
	}
	public void setFields(List<Attribute> fields) {
		this.fields_value = fields;
	}
	public InsertExample(String tableName,String fields){
		this.tableName = tableName;
		String [] field = fields.split(",");
		fields_value = new ArrayList<Attribute>();
		for(int i=0;i<field.length;i++){
			String[] fieldss = field[i].split(":");
			Attribute attribute = new Attribute();
			attribute.setAttributeName(fieldss[0]);
			attribute.setAttributeValue(fieldss[1]);
			fields_value.add(attribute);
		}
	}
	private static class Attribute{
		private String attributeName;
		private String attributeValue;
		public String getAttributeName() {
			return attributeName;
		}
		public void setAttributeName(String attributeName) {
			this.attributeName = attributeName;
		}
		public String getAttributeValue() {
			return attributeValue;
		}
		public void setAttributeValue(String attributeValue) {
			this.attributeValue = attributeValue;
		}
		
	}
}
