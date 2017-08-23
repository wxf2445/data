package cn.com.jtang.web.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.aspectj.apache.bcel.classfile.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.code.kaptcha.Constants;

import cn.com.jtang.po.User;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.Md5Util;

@Controller
@RequestMapping("setPwd")
public class ResetPwdController{
	@Resource
	private UserService userService;
	/**
	 * 跳转到密码修改页面
	 * @return
	 */
	@RequiresAuthentication
	@RequestMapping(value="manage",method=RequestMethod.GET)
	public String manage(){
		return "index/systemmanage/setPwd";
	}
	
	/**
	 * 密码对比
	 */
	@RequestMapping(value="checkPwd",method=RequestMethod.GET)
	@ResponseBody
	public Boolean checkPwd(
			@RequestParam(value="username",required=true)String username,
			@RequestParam(value="oldPwd",required=true)String oldPwd){
		User user = userService.selectByUserName(username);
		String userpwd = user.getPwd();
		String oldpwd = Md5Util.getMD5(username+oldPwd);
		return userpwd.equals(oldpwd);
	}
	
	/**
	 * 验证码对比
	 */
	@RequestMapping(value="checkValidCode",method=RequestMethod.GET)
	@ResponseBody
	public Boolean checkValidCode(@RequestParam(value="validCode",required=true)String validCode,HttpSession session){
		String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		return code.equals(validCode);
	}
	
	/**
	 * 密码保存
	 */
	@RequestMapping(value="save",method=RequestMethod.POST)
	public String save(@RequestParam(value="newPwd",required=true)String newPwd,
			@RequestParam(value="username",required=true)String username,
			RedirectAttributes redirectAttributes){
			User user = userService.selectByUserName(username);
			user.setPwd(Md5Util.getMD5(username+newPwd));
			int i = userService.updateByPrimaryKey(user);
			if(i == 1){
				redirectAttributes.addFlashAttribute("setPwdInfo", true);
				return "redirect:/login";
			}else{
				redirectAttributes.addFlashAttribute("setPwdInfo", false);
				return "redirect:/setPwd/manage";
			}
	}
}
