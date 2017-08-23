package cn.com.jtang.service;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.LogSearchForm;


/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface LogService {
	/**
	* 插入日志
	* @param event 时间。username自动读取
	* @return
	* @throws Exception
	*/
    int insert(String event);
    
    int insertCheck(String event);

    Page selectByLogSearchForm(LogSearchForm logSearchForm);

    void exportWord(ByteArrayOutputStream fileOutputStream,LogSearchForm logSearchForm);
}


//~ Formatted by Jindent --- http://www.jindent.com
