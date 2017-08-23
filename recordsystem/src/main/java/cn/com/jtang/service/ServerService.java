package cn.com.jtang.service;

import cn.com.jtang.po.Server;
import cn.com.jtang.po.ServerExample;
import cn.com.jtang.util.Page;

public interface ServerService {
	 public Page selectByExample(ServerExample example, Page page);
	 public int updateByExample(Server record);
	 public Server selectByPrimaryKey(String id);
}
