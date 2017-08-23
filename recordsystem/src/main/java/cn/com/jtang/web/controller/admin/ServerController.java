package cn.com.jtang.web.controller.admin;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.com.jtang.po.Server;
import cn.com.jtang.po.ServerExample;
import cn.com.jtang.service.ServerService;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;

@Controller
@RequestMapping("/server")
public class ServerController {
	@Resource
	private ServerService serverService;
	
	/**进入服务器管理界面
	 * 
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="manage",method=RequestMethod.GET)
	public String manage(ModelMap model){
		ServerExample example = new ServerExample();
		ServerExample.Criteria criteria = example.createCriteria();
		criteria.andServerTypeEqualTo("data");
		Page page = new Page(null, 0, 1, 10);
		Page obj = serverService.selectByExample(example, page);
		model.addAttribute("server", new PageView(obj));
		return "index/systemmanage/serverManage";
	}
	
	/**
	 * 进入服务器修改界面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public String edit(@RequestParam(value="id",required=true)String id,ModelMap model){
		model.put("server", serverService.selectByPrimaryKey(id));
		return "index/systemmanage/serverEdit";
	}
	
	@RequiresAuthentication
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String save(@RequestParam(value="newUsername",required=true)String newUsername,
			@RequestParam(value="newPwd",required=true)String newPwd,
			@RequestParam(value="serverid",required=true)String serverid,RedirectAttributes redirectAttributes){
		Server record = serverService.selectByPrimaryKey(serverid);
		record.setServerUsername(newUsername);
		record.setServerPwd(newPwd);
		record.setEditTime(new Date());
		try {
			serverService.updateByExample(record);
			redirectAttributes.addFlashAttribute("reusltInfo", true);
			return "redirect:/server/manage";
		} catch (Exception e) {
			// TODO: handle exception
			redirectAttributes.addFlashAttribute("reusltInfo", false);
			return "redirect:/server/edit";
		}
	}
}
