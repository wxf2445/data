package cn.com.jtang.po.custom;

import cn.com.jtang.po.Fonds;

import java.io.Serializable;
import java.util.Date;

public class FondsView extends Fonds implements Serializable {

    String storeHouse;

    public String getStoreHouse() {
        return storeHouse;
    }

    public void setStoreHouse(String storeHouse) {
        this.storeHouse = storeHouse;
    }
}