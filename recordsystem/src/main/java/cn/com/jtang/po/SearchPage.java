package cn.com.jtang.po;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by ZJUXP on 2016-09-02.
 */
public class SearchPage {
    private int total;
    private int page;
    private int size;
    private int totalpage;

    public int getTotalpage() {
        return totalpage;
    }

    private List<Integer> pages;

    public List<Integer> getPages() {
        return pages;
    }

    public void setPages() {
        pages = new ArrayList<>();
        totalpage = (total+1)/size ;
        for(int i = 1; i<=totalpage ;i++){
            pages.add(i);
        }
    }

    private Map<String,?> items;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Map<String, ?> getItems() {
        return items;
    }

    public void setItems(Map<String, ?> items) {
        this.items = items;
    }
    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

}
