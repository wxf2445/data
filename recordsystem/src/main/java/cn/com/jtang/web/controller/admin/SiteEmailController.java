package cn.com.jtang.web.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.druid.stat.TableStat.Mode;

import cn.com.jtang.po.StationMail;
import cn.com.jtang.po.StationMailExample;
import cn.com.jtang.po.User;
import cn.com.jtang.po.UserExample;
import cn.com.jtang.service.ShiroUserService;
import cn.com.jtang.service.SiteMailService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.Page;
import cn.com.jtang.util.PageView;
import cn.com.jtang.web.controller.form.SiteEmailForm;

@Controller
@RequestMapping("/siteEmail")
public class SiteEmailController {
	@Resource
	private UserService userService;
	
	@Resource
	private SiteMailService siteMailService;
	
	@Resource
	private ShiroUserService shiroUserService;
	
	/**进入站内邮件页面
	 * 
	 * @param model
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="manage",method=RequestMethod.GET)
	public String manage(ModelMap model){
		   org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();
	        String username = (String) my.getPrincipal();
	        StationMailExample example = new StationMailExample();
	        example.setOrderByClause("create_time desc");
	        StationMailExample.Criteria criteria = example.createCriteria();
	        criteria.andFormUserEqualTo(username);
	        Page page = new Page(null, 0, 1, 10);
	        Page pageObj = siteMailService.selectByExample(example,page);
	        model.addAttribute("pageObj", new PageView(pageObj));
		return "index/systemmanage/emailManage";
	}
	
	/**进入站内邮件页面
	 * 
	 * @param model
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="send",method=RequestMethod.GET)
	public String sendManage(ModelMap model){
		 org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();
        String username = (String) my.getPrincipal();
		UserExample example = new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andUsernameNotEqualTo(username);
		model.addAttribute("userList",userService.selectByExample(example));
		return "index/systemmanage/siteEmail";
	}
	/**搜索返回结果
	 * 
	 * @param searchKey
	 * @return
	 */
	@RequestMapping(value="search",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> search(@RequestParam(value="searchKey",required=true)String searchKey){
		Map<String,Object> map = new HashMap<String, Object>();
		 org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();
        String username = (String) my.getPrincipal();
		UserExample example = new UserExample();
		UserExample.Criteria criteria = example.createCriteria();
		criteria.andUsernameLike("%"+searchKey+"%");
		criteria.andUsernameNotEqualTo(username);
		List<User> userList = userService.selectByExample(example);
		map.put("userList", userList);
		return map;
	}
	/**邮件发送
	 * 
	 * @param siteEmailForm
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="send",method=RequestMethod.POST)
	public String send(@ModelAttribute("siteEmailForm")SiteEmailForm siteEmailForm,RedirectAttributes redirectAttributes){
		List<String> toUsers = siteEmailForm.getRecipients();
		String fromUser = siteEmailForm.getUsername();
		String title = siteEmailForm.getTheme();
		String content = siteEmailForm.getContent();
		Date date = new Date();
		for(String toUser:toUsers){
			try {
				StationMail record = new StationMail();
				String id = IDGenerator.generator();
				record.setMailid(id);
				record.setFormUser(fromUser);
				record.setToUser(toUser);
				record.setTitle(title);
				record.setContent(content);
				record.setCreateTime(date);
				record.setIsRead(false);
				siteMailService.sendEmail(record);
				redirectAttributes.addFlashAttribute("sendinfo","发送成功！");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				redirectAttributes.addFlashAttribute("sendinfo","发送失败，请给"+toUser+"及以后的用户重新发送");
				break;
			}
		}
		return "redirect:/siteEmail/send";
	}
	
	@RequiresAuthentication
	@RequestMapping(value="/info",method=RequestMethod.GET)
	public String mialInfo(@RequestParam(value="mailid",required=true) String mailid,ModelMap model){
	   org.apache.shiro.subject.Subject my = SecurityUtils.getSubject();
        String username = (String) my.getPrincipal();
		StationMail mail = siteMailService.selectByPrimaryKey(mailid);
		String fromUser = mail.getFormUser();
		String toUser = mail.getToUser();
		String userName = "";
		if(username.equals(fromUser)){
			userName = toUser;
			model.addAttribute("userType", "接收人信息");
		}else if(username.equals(toUser)){
			userName = fromUser;
			mail.setIsRead(true);
			model.addAttribute("userType", "发送人信息");
		}
		User user = userService.selectByUserName(userName);
		model.addAttribute("user", user);
		model.addAttribute("mail", mail);
		try {
			siteMailService.updateByPrimaryKeyWithBLOBs(mail);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "index/systemmanage/mailInfo";
	}
}
