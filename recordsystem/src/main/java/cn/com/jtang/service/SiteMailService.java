package cn.com.jtang.service;

import java.util.List;

import cn.com.jtang.po.StationMail;
import cn.com.jtang.po.StationMailExample;
import cn.com.jtang.util.Page;

public interface SiteMailService {
	public int sendEmail(StationMail record);
	public  Page selectByExample(StationMailExample example, Page paramPage);
	public StationMail selectByPrimaryKey(String mailid);
	public int deleteByPrimaryKey(String mailid);
	 public int updateByPrimaryKeyWithBLOBs(StationMail record);
	 public List<StationMail> selectByExample(StationMailExample example);
}
