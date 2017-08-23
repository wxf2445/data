package cn.com.jtang.service;

import java.util.List;

import cn.com.jtang.po.Station;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.StationForm;


/**
 * Interface description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
public interface StationService {
	/**
	* 插入日志
	* @param event 时间。username自动读取
	* @return
	* @throws Exception
	*/
    int insert(String title,String event);
    
    String deleteByPrimaryKey(String id);

    Page selectByStationForm(StationForm stationForm);

    List<Station> getTop8Station();

    Station getOneStation(String id);
}


//~ Formatted by Jindent --- http://www.jindent.com
