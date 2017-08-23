package cn.com.jtang.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.com.jtang.dao.StationMailMapper;
import cn.com.jtang.po.StationMail;
import cn.com.jtang.po.StationMailExample;
import cn.com.jtang.service.SiteMailService;
import cn.com.jtang.util.Md5Util;
import cn.com.jtang.util.Page;
import cn.com.jtang.web.controller.form.SiteEmailForm;

@Service("siteMailService")
@Transactional
public class SiteMailServiceImpl implements SiteMailService {
	@Resource
	private StationMailMapper siteMapper;

/**
 * 邮件发送存储	
 * @param siteEmailForm
 * @return
 */
	public int sendEmail(StationMail record){
		return siteMapper.insertSelective(record);
	}
	/**分页查询
	 * 
	 * @param toUser
	 * @return
	 */
	 public Page selectByExample(StationMailExample example, Page page)
	  {
		 page.retrievePage(this.siteMapper.countByExample(example));
	    example.setStart((page.getPageNum() - 1) * page.getPageSize());
	    example.setLimit(page.getPageSize());
	    page.setItems(this.siteMapper.selectByExample(example));
	    return page;
	  }
	 
	 
	/**
	 * 普遍查询
	 * @param example
	 * @return
	 */
		 public List<StationMail> selectByExample(StationMailExample example)
		  {
		    return siteMapper.selectByExample(example);
		  }
		 
	/**记录删除
	 * 
	 * @param mailid
	 * @return
	 */
	 public int deleteByPrimaryKey(String mailid){
		 return siteMapper.deleteByPrimaryKey(mailid);
	 }
	 
	 /**主键查询
	  * 
	 * @param mailid
	 * @return
	  */
	 public StationMail selectByPrimaryKey(String mailid){
		 return siteMapper.selectByPrimaryKey(mailid);
	 }
	 
	 /**数据更新
	  * 
	  * @param record
	  * @return
	  */
	 public int updateByPrimaryKeyWithBLOBs(StationMail record){
		 return siteMapper.updateByPrimaryKeyWithBLOBs(record);
	 }
}
