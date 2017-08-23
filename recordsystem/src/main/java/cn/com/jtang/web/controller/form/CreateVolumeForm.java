package cn.com.jtang.web.controller.form;

import cn.com.jtang.po.RecordVolume;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ZJUXP on 2016-07-06.
 */
public class CreateVolumeForm extends RecordVolumeForm implements Serializable {

    Integer sequence;

    List<String> recordIds;

    public Integer getSequence () {
        return sequence;
    }

    public void setSequence (Integer sequence) {
        this.sequence = sequence;
    }

    public List<String> getRecordIds() {
        return recordIds;
    }

    public void setRecordIds(List<String> recordIds) {
        this.recordIds = recordIds;
    }
}
