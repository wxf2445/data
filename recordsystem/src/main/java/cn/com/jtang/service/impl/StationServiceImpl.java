package cn.com.jtang.service.impl;

import java.util.List;

import cn.com.jtang.dao.StationMapper;
import cn.com.jtang.po.Station;
import cn.com.jtang.po.StationExample;
import cn.com.jtang.service.StationService;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.StationForm;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by ZJUXP on 2016-06-21.
 */
@Service("stationService")
public class StationServiceImpl implements StationService {

    @Resource
    private StationMapper stationMapper;

	@Override
	public int insert(String title,String event) {
		Station Station = new Station();
        org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();
        String username = (String) my.getPrincipal();
		Station.setTitle(title);
		Station.setEvent(event);
		Station.setOperator(username);
		return stationMapper.insertSelective(Station);
	}

	@Override
	public Page selectByStationForm(StationForm stationForm) {
		StationExample example = new StationExample();
		StationExample.Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo("1");

        Page page = new Page(null, 0, stationForm.getPage(), stationForm.getSize());
        page.retrievePage(stationMapper.countByExample(example));
        example.setStart((page.getPageNum() - Page.ONE) * page.getPageSize());
        example.setLimit(page.getPageSize());
        example.setOrderByClause("createtime desc");
        page.setItems(stationMapper.selectByExample(example));
		return page;
	}


	@Override
	public String deleteByPrimaryKey(String id) {
		return stationMapper.deleteById(id);
	}

	@Override
	public List<Station> getTop8Station() {
		StationExample example = new StationExample();
		StationExample.Criteria criteria = example.createCriteria();
        example.setStart(0);
        example.setLimit(8);
        criteria.andStatusEqualTo("1");
        example.setOrderByClause("createtime desc");
		return stationMapper.selectByExample(example);
	}

	@Override
	public Station getOneStation(String id) {
		return stationMapper.getOneStation(id);
	}
    
}
