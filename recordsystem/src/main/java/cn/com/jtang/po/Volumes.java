package cn.com.jtang.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import cn.com.jtang.service.RecordTypeService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.RecordUtil;

import com.mysql.fabric.xmlrpc.base.Array;

public class Volumes implements Serializable {
	public List<Volume> volumes ;
    @Resource
    private RecordTypeService recordTypeService;
	
	public Volumes(List<Map<String,Object>> maps,String recordtypeid,List<TableField> tableField){
		this.volumes = new ArrayList<>();
		if(maps.size()>0){
			for(Map<String,Object> map:maps)
				this.volumes.add(new Volume(map,tableField));
		}
	}
	
	public List<Volume> getVolumes() {
		return volumes;
	}
	public void setVolumes(List<Volume> volumes) {
		this.volumes = volumes;
	}
	
	public class Volume{
		String volumeId;
		String volumeSubject;
		List<VolumeField> volumeFields;
		public Volume(Map<String,Object> map,List<TableField> tableFields){
			this.volumeFields = new ArrayList<>();
				for(TableField tableField:tableFields){
					if("id".equals(tableField.getFieldName())){
						this.volumeId = (String) map.get("id");
						continue;
					}
					if("subject".equals(tableField.getFieldName()))
						this.volumeSubject = (String) map.get("subject");
					VolumeField volumeField = new VolumeField(tableField.getFieldName(),map.get(tableField.getFieldName())+"");
					this.volumeFields.add(volumeField);
				}
		}

		public List<VolumeField> getVolumeFields() {
			return volumeFields;
		}
		public void setVolumeFields(List<VolumeField> volumeFields) {
			this.volumeFields = volumeFields;
		}

		public String getVolumeId() {
			return volumeId;
		}

		public void setVolumeId(String volumeId) {
			this.volumeId = volumeId;
		}

		public String getVolumeSubject() {
			return volumeSubject;
		}

		public void setVolumeSubject(String volumeSubject) {
			this.volumeSubject = volumeSubject;
		}
	}

    public class VolumeField{
    	String name;
    	String fieldvalue;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getFieldvalue() {
			return fieldvalue;
		}
		public void setFieldvalue(String fieldvalue) {
			this.fieldvalue = fieldvalue;
		}
		public VolumeField(String name,String value){
			this.name = name;
			this.fieldvalue = value;
		}
    }
}