package cn.com.jtang.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.com.jtang.dao.ServerMapper;
import cn.com.jtang.po.Server;
import cn.com.jtang.po.ServerExample;
import cn.com.jtang.service.ServerService;
import cn.com.jtang.util.Page;

@Service("/serverService")
public class ServerServiceImpl implements ServerService{
	@Resource
	private ServerMapper serverMapper;
	
	/**分页查询
	 * 
	 * @param example
	 * @param page
	 * @return
	 */
	 public Page selectByExample(ServerExample example, Page page)
	  {
		 page.retrievePage(this.serverMapper.countByExample(example));
	    example.setStart((page.getPageNum() - 1) * page.getPageSize());
	    example.setLimit(page.getPageSize());
	    page.setItems(this.serverMapper.selectByExample(example));
	    return page;
	  }
	 
	 /**服务器设置更新
	  * 
	  * @param record
	  * @return
	  */
	 public int updateByExample(Server record){
		 return this.serverMapper.updateByPrimaryKey(record);
	 }
	 
	 /**根据主键id查询
	  * 
	  * @param id
	  * @return
	  */
	 public Server selectByPrimaryKey(String id){
		 return this.serverMapper.selectByPrimaryKey(id);
	 }
}
