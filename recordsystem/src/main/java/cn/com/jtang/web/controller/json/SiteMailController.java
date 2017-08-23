package cn.com.jtang.web.controller.json;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import cn.com.jtang.po.StationMail;
import cn.com.jtang.po.StationMailExample;
import cn.com.jtang.service.SiteMailService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;

/**
 * Class description
 *
 * @author 
 * @version 1.0.0, 16/03/31
 */
@Controller("jsonSiteMailController")
@RequestMapping("/json/siteMail")
public class SiteMailController {
	@Resource
	private SiteMailService siteMailService;
	
	/**查询
	 *  
	 * @param startTime
	 * @param endTime
	 * @param userName
	 * @param formid
	 * @return
	 */
	@RequestMapping(value="/search",method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String,Object> deleteMail(
			@RequestParam(value="startTime",required=true)String startTime,
			@RequestParam(value="endTime",required=true)String endTime,
			@RequestParam(value="userName",required=true)String userName,
			@RequestParam(value="formid",required=true)String formid,
			@RequestParam(value="n",required=false)Integer n
			){
			HashMap<String,Object> map = new HashMap<String,Object>();
			org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();
	        String username = (String) my.getPrincipal();
	        Date date1 =StrToDate(startTime);
	        Date date2 =StrToDate(endTime);
			if(formid.equals("sendSearch")){
		        StationMailExample example = new StationMailExample();
		        example.setOrderByClause("create_time desc");
		        StationMailExample.Criteria criteria = example.createCriteria();
		        criteria.andFormUserEqualTo(username);
		        if(date1 != null){
		        	   criteria.andCreateTimeGreaterThanOrEqualTo(date1);
		        }
		        if(date2 != null){
		        	   criteria.andCreateTimeLessThanOrEqualTo(date2);
		        }
		        if(!userName.isEmpty()){
		        criteria.andToUserLike("%"+userName+"%");
		        }
		        Page page = new Page(null, 0, n !=null?n.intValue():1, 10);
		        PageView pageObj = new PageView( siteMailService.selectByExample(example,page));
		        Page pages =  pageObj.getPage();
		        map.put("items", pages.getItems());
		        map.put("nowPage",pages.currentPage());
		        map.put("firstPage", pages.firstPage());
		        map.put("lastPage", pages.lastPage());
		        map.put("showPages", pageObj.showPages());
			}else{
				StationMailExample example = new StationMailExample();
		        example.setOrderByClause("create_time desc");
		        StationMailExample.Criteria criteria = example.createCriteria();
		        criteria.andToUserEqualTo(username);
		        if(date1 != null){
		        	   criteria.andCreateTimeGreaterThanOrEqualTo(date1);
		        }
		        if(date2 != null){
		        	   criteria.andCreateTimeLessThanOrEqualTo(date2);
		        }
		        if(!userName.isEmpty()){
		        	  criteria.andFormUserLike("%"+userName+"%");
		        }
		        Page page = new Page(null, 0, n !=null?n.intValue():1, 10);
		        PageView pageObj = new PageView( siteMailService.selectByExample(example,page));
		        Page pages =  pageObj.getPage();
		        map.put("items", pages.getItems());
		        map.put("nowPage",pages.currentPage());
		        map.put("firstPage", pages.firstPage());
		        map.put("lastPage", pages.lastPage());
		        map.put("showPages", pageObj.showPages());
			}
	       return map;
	}
	
	/**
	* 字符串转换成日期
	* @param str
	* @return date
	*/
	private static Date StrToDate(String str) {
	   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	   Date date = null;
	   if(!str.isEmpty()){
	   try {
				date = format.parse(str);
			} catch (java.text.ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	   }
	   return date;
	}
}


//~ Formatted by Jindent --- http://www.jindent.com
