package cn.com.jtang.po;

import java.util.ArrayList;
import java.util.List;

import cn.com.jtang.util.RecordUtil;


public class CreateTable {
	private String recordTableName;
	private String volumeTableName;
	private String documentTableName;
	private String pieceTableName;
	private String pieceDocumentTableName;
	private List<TableFields> record_fields_value;
	private List<TableFields> piece_fields_value;
	private List<TableFields> volume_fields_value;
	public CreateTable(String fondNo,String recordType,String record_fields,String piece_fields,String volume_fields){
		this.recordTableName = fondNo+"_"+recordType+RecordUtil.RECORD;
		this.volumeTableName = fondNo+"_"+recordType+RecordUtil.VOLUME;
		this.documentTableName = fondNo+"_"+recordType+RecordUtil.DOCUMENT;
		this.pieceTableName = fondNo+"_"+recordType+RecordUtil.PIECE;
		this.pieceDocumentTableName = fondNo+"_"+recordType+RecordUtil.PIECEDOCUMENT;
		String [] field ;
		if(record_fields!=null){
			field = record_fields.split(",");
			record_fields_value = new ArrayList<TableFields>();
			for(int i=0;i<field.length;i++){
				String[] fieldss = field[i].split(":");
				TableFields tableFields = new TableFields();
				tableFields.setFieldName(fieldss[0]);
				tableFields.setFieldLength(fieldss[1]);
				record_fields_value.add(tableFields);
			}
		}
		if(piece_fields!=null){
			field = piece_fields.split(",");
			piece_fields_value = new ArrayList<TableFields>();
			for(int i=0;i<field.length;i++){
				String[] fieldss = field[i].split(":");
				TableFields tableFields = new TableFields();
				tableFields.setFieldName(fieldss[0]);
				tableFields.setFieldLength(fieldss[1]);
				piece_fields_value.add(tableFields);
			}
		}
		if(volume_fields!=null){
			field = volume_fields.split(",");
			volume_fields_value = new ArrayList<TableFields>();
			for(int i=0;i<field.length;i++){
				String[] fieldss = field[i].split(":");
				TableFields tableFields = new TableFields();
				tableFields.setFieldName(fieldss[0]);
				tableFields.setFieldLength(fieldss[1]);
				volume_fields_value.add(tableFields);
			}
		}
	}

	public String getPieceDocumentTableName() {
		return pieceDocumentTableName;
	}

	public void setPieceDocumentTableName(String pieceDocumentTableName) {
		this.pieceDocumentTableName = pieceDocumentTableName;
	}
	public String getPieceTableName() {
		return pieceTableName;
	}

	public void setPieceTableName(String pieceTableName) {
		this.pieceTableName = pieceTableName;
	}
	public String getDocumentTableName() {
		return documentTableName;
	}
	public void setDocumentTableName(String documentTableName) {
		this.recordTableName = documentTableName;
	}
	public String getRecordTableName() {
		return recordTableName;
	}
	public void setRecordTableName(String recordTableName) {
		this.recordTableName = recordTableName;
	}
	public String getVolumeTableName() {
		return volumeTableName;
	}
	public void setVolumeTableName(String volumeTableName) {
		this.volumeTableName = volumeTableName;
	}
	public List<TableFields> getRecord_fields_value() {
		return record_fields_value;
	}

	public void setRecord_fields_value(List<TableFields> record_fields_value) {
		this.record_fields_value = record_fields_value;
	}

	public List<TableFields> getPiece_fields_value() {
		return piece_fields_value;
	}

	public void setPiece_fields_value(List<TableFields> piece_fields_value) {
		this.piece_fields_value = piece_fields_value;
	}
	private static class TableFields{
		String fieldName;
		String fieldLength;
		public String getFieldName() {
			return fieldName;
		}
		public void setFieldName(String fieldName) {
			this.fieldName = fieldName;
		}
		public String getFieldLength() {
			return fieldLength;
		}
		public void setFieldLength(String fieldLength) {
			this.fieldLength = fieldLength;
		}
	}
}
