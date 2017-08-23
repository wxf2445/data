package cn.com.jtang.service.impl;

import cn.com.jtang.dao.CategoryContentMapper;
import cn.com.jtang.po.CategoryContent;
import cn.com.jtang.po.CategoryContentExample;
import cn.com.jtang.service.CategoryService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ZJUXP on 2016-06-30.
 */
public class CategoryServiceImpl implements CategoryService {

    @Resource
    private CategoryContentMapper categoryContentMapper;

    @Override
    public List<CategoryContent> selectCategoryByNo(String no) {
        CategoryContentExample example = new CategoryContentExample();
        CategoryContentExample.Criteria criteria = example.createCriteria();

        criteria.andCategorynoEqualTo(no);

        return categoryContentMapper.selectByExample(example);
    }
}
