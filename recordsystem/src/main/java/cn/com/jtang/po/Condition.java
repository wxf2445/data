package cn.com.jtang.po;



public class Condition{
	String fieldname;
	String value;
	public Condition(String fieldname,String value){
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