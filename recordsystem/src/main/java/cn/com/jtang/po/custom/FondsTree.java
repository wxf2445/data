package cn.com.jtang.po.custom;

import cn.com.jtang.po.Fonds;
import cn.com.jtang.po.RecordType;

import java.util.List;

/**
 * Created by ZJUXP on 2016-06-30.
 */
public class FondsTree {

    Fonds fonds;

    List<RecordType> recordTypes;

    public Fonds getFonds() {
        return fonds;
    }

    public void setFonds(Fonds fonds) {
        this.fonds = fonds;
    }

    public List<RecordType> getRecordTypes() {
        return recordTypes;
    }

    public void setRecordTypes(List<RecordType> recordTypes) {
        this.recordTypes = recordTypes;
    }


}
