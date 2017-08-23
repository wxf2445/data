package cn.com.jtang.web.controller.json;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;

import cn.com.jtang.po.Server;
import cn.com.jtang.po.ServerExample;
import cn.com.jtang.service.ServerService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;

@Controller("jsonServerController")
@RequestMapping("/json/server")
public class ServerController {
	@Resource
	private ServerService serverService;
	
	/**获取分页数据
	 * 
	 * @param n
	 * @param type
	 * @return
	 */
	@RequestMapping(value="data",method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> getServerData(@RequestParam(value="n",required=false) Integer n,
			@RequestParam(value="type",required=true) String type){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ServerExample example = new ServerExample();
		ServerExample.Criteria criteria = example.createCriteria();
		criteria.andServerTypeEqualTo(type);
		Page page = new Page(null, 0, n != null?n.intValue():1, 10);
		PageView obj = new PageView(serverService.selectByExample(example, page));
		Page pageObj = obj.getPage();
		map.put("items",pageObj.getItems());
		map.put("showPages", obj.getShowPages());
		map.put("nowPage",pageObj.currentPage());
		map.put("firstPage", pageObj.firstPage());
		map.put("lastPage", pageObj.lastPage());
		return map;
	}
	
	/**
	 * 核对服务器用户名
	 * @param id
	 * @param username
	 * @return
	 */
	@RequestMapping(value="/check/name",method=RequestMethod.POST)
	@ResponseBody
	public boolean checkName(@RequestParam(value="id",required=true)String id,@RequestParam(value="username",required=true) String username){
		Server record = serverService.selectByPrimaryKey(id);
		return record.getServerUsername().equals(username);
	}
	
	/**
	 * 核对服务器密码
	 * @param id
	 * @param pwd
	 * @return
	 */
	@RequestMapping(value="/check/pwd",method=RequestMethod.POST)
	@ResponseBody
	public boolean checkPwd(@RequestParam(value="id",required=true)String id,@RequestParam(value="pwd",required=true) String pwd){
		Server record = serverService.selectByPrimaryKey(id);
		return record.getServerPwd().equals(pwd);
	}
	
	/**
	 * 核对验证码
	 * @param session
	 * @param code
	 * @return
	 */
	@RequestMapping(value="/check/code",method=RequestMethod.POST)
	@ResponseBody
	public boolean checkCode(HttpSession session,@RequestParam(value="code",required=true) String code){
		String imgCode = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		return code.equals(imgCode);
	}
}
