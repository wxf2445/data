package cn.com.jtang.web.controller.form;

import cn.com.jtang.po.Record;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * Created by ZJUXP on 2016-07-05.
 */
public class InfoTypeForm extends RecordForm {

    private List<String> lists;
    private List<String> deleteDocIds;
    private Integer colSize;
    private Integer listSize;
    private String mode;
    private String description;
    public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	private List<MultipartFile> resFile;

    public List<String> getDeleteDocIds() {
        return deleteDocIds;
    }

    public void setDeleteDocIds(List<String> deleteDocIds) {
        this.deleteDocIds = deleteDocIds;
    }
    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }


    public List<MultipartFile> getResFile() {
        return resFile;
    }

    public void setResFile(List<MultipartFile> resFile) {
        this.resFile = resFile;
     }

    public List<String> getLists() {
        return lists;
    }

    public void setLists(List<String> lists) {
        this.lists = lists;
    }

    public Integer getColSize() {
        return colSize;
    }

    public void setColSize(Integer colSize) {
        this.colSize = colSize;
    }

    public Integer getListSize() {
        return listSize;
    }

    public void setListSize(Integer listSize) {
        this.listSize = listSize;;
    }


}
