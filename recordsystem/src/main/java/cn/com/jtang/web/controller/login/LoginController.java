package cn.com.jtang.web.controller.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import cn.com.jtang.po.User;
import cn.com.jtang.service.RegisterService;
import cn.com.jtang.service.ShiroUserService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.web.controller.form.common.UserCreateForm;
import cn.com.jtang.web.controller.form.login.LoginForm;

import com.google.code.kaptcha.Constants;
import com.wiscom.is.IdentityFactory;
import com.wiscom.is.IdentityManager;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUtils;
import javax.validation.Valid;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Controller
@SessionAttributes({"userId", "isAccess"})
public class LoginController {
    @Resource
    private ShiroUserService shiroUserService;
    @Resource
    private UserService userService;
    @Value("${fileserverpath}")
    private String FileServerPath;

    @Resource
    private RegisterService registerService;

    /**
     * Method description index
     *
     * @param model
     * @return Stringe
     */
    @RequestMapping(value = "/index")
    public String index(Model model) {
        return "index";
    }

    /**
     * Method description login
     *
     * @param model
     * @return String
     */
    @RequestMapping(
            value = "/login",
            method = RequestMethod.GET
    )
    public String login(Model model,HttpServletRequest request) {

    	/*Cookie all_cookies[] = request.getCookies();
        Cookie myCookie;
        String decodedCookieValue = null;
        if (all_cookies != null) {
            for(int i=0; i< all_cookies.length; i++) {
                myCookie = all_cookies[i];
                if( myCookie.getName().equals("iPlanetDirectoryPro") ) {
                    try {
						decodedCookieValue = URLDecoder.decode(myCookie.getValue(),"GB2312");
					} catch (UnsupportedEncodingException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
                }
            }
        }

    	IdentityFactory factory = null;
		try {
			factory = IdentityFactory.createFactory( FileServerPath+"/client.properties" );
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	IdentityManager im = factory.getIdentityManager();
    	
    	String curUser = "";
    	if (decodedCookieValue != null ) {
        	curUser = im.getCurrentUser( decodedCookieValue );
        }
    	if ( curUser.length()!=0 ){
    		User u = userService.selectByUserName(curUser);
			UserCreateForm userCreateForm = new UserCreateForm();
    		if(u==null){
    			userCreateForm.setRegisterName(curUser);
    			userCreateForm.setUserpassword("123");
                try {
					registerService.register(userCreateForm);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    		}

            UsernamePasswordToken token2 = new UsernamePasswordToken(curUser, "123");

            Subject user = SecurityUtils.getSubject();
            user.login(token2);
            System.out.println("Single login success!");
            return "forward:/index";
    		//String gotoURL = HttpUtils.getRequestURL(request).toString();
    		//String loginURL = im.getLoginURL() +"?goto=" + java.net.URLEncoder.encode(gotoURL);
    	}*/
        model.addAttribute("loginForm", new LoginForm());

        System.out.println("begin login:");
        return "login";
    }
    @RequestMapping(
            value = "/nonauthorize",
            method = RequestMethod.GET
    )
    public String nonauthorize(Model model) {

        return "/nonauthorize";
    }

    /**
     * Method description login
     *
     * @param loginForm
     * @param binding
     * @param redirectAttributes
     * @return String
     */
    @RequestMapping(
            value = "/login",
            method = RequestMethod.POST
    )
    public String login(@Valid
                        @ModelAttribute("loginForm") LoginForm loginForm, BindingResult binding, Model model,
                        @RequestParam(value = "validateCode", required = false) String submitCode,
                        @RequestParam(value = "rememberMe", required = false) boolean rememberMe, HttpSession session,
                        final RedirectAttributes redirectAttributes) {
        System.out.println("username:" + loginForm.getUsername());
        System.out.println("password:" + loginForm.getPassword());
        if (binding.hasErrors()) {
            redirectAttributes.addFlashAttribute("loginForm", loginForm);
            redirectAttributes.addFlashAttribute("errors", binding.getAllErrors());

            return "redirect:/login";
        }


        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);


        System.out.println("code:" + code);
        System.out.println("submitCode:" + submitCode);

        if (StringUtils.isEmpty(submitCode) || !StringUtils.equals(code,
                submitCode.toLowerCase())) {
            binding.addError(new
                    FieldError("loginForm", "validateCode", null, false, new String[]{
                    "loginform.validatecode.not.right"}, null,
                    "Validate Code not right!"));
            redirectAttributes.addFlashAttribute("loginForm", loginForm);
            redirectAttributes.addFlashAttribute("errors",
                    binding.getAllErrors());
            return "redirect:/login";
        }

        Subject user = SecurityUtils.getSubject();

        /*
         * if (user.isAuthenticated()) {
         *       user.logout();
         * }
         */
        UsernamePasswordToken token = new UsernamePasswordToken(loginForm.getUsername(), loginForm.getPassword());

        //token.setRememberMe(rememberMe);
        try {
            user.login(token);
            System.out.println("Login success!");
            return "forward:/index";
        } catch (AuthenticationException e) {
        	//String is_config = request.getRealPath("/client.properties");
            
        	
            String href = "redirect:/login";
            if ("account.notPass".equals(e.getMessage())) {
                User aUser = userService.selectByUserName(loginForm.getUsername());

                if (aUser.getCheckresult() != null && !aUser.getCheckresult()) {
                    aUser.setPwd("");
                    model.addAttribute("user", aUser);
                    return "reRegister";
                }
            } else {
                System.out.println("Login Error!");
                e.printStackTrace();
                token.clear();
                binding.addError(new FieldError("loginForm",
                        "password",
                        null,
                        false,
                        new String[]{e.getMessage()},
                        null,
                        "Username or Password not match!"));
                redirectAttributes.addFlashAttribute("loginForm", loginForm);
                redirectAttributes.addFlashAttribute("errors", binding.getAllErrors());

            }
            return href;
        }
    }

    /**
     * Method description logout
     *
     * @param model
     * @return String
     */
    @RequestMapping(value = "/login/logout")
    public String logout(Model model) {

        /*
         *  Subject currentUser = SecurityUtils.getSubject();
         *
         * currentUser.logout();
         */
        return "redirect:/logout";
    }

    /**
     * Method description validatorCode
     *
     * @param validateCode
     * @param session
     * @return boolean
     */
    @RequestMapping(
            value = "/validatorCode",
            method = RequestMethod.POST
    )
    @ResponseBody
    public boolean validatorCode(@RequestParam(
            value = "validateCode",
            required = true
    ) String validateCode, HttpSession session) {
        boolean status;
        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);

        if (code.equals(validateCode)) {
            status = true;
        } else {
            status = false;
        }

        return status;
    }

    /**
     * Method description setPassword
     *
     * @param model
     * @return String
     */
    @RequestMapping(
            value = "/setPassword",
            method = RequestMethod.GET
    )
    public String setPassword(Model model) {
        return "setPassword";
    }

}


//~ Formatted by Jindent --- http://www.jindent.com
