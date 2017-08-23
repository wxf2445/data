package cn.com.jtang.service;

import cn.com.jtang.po.CategoryContent;

import java.util.List;

/**
 * Created by ZJUXP on 2016-06-30.
 */
public interface CategoryService {

    List<CategoryContent> selectCategoryByNo(String no);

}
