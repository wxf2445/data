package cn.com.jtang.web.controller.register;

import cn.com.jtang.service.RegisterService;
import cn.com.jtang.util.MailUtil;
import cn.com.jtang.web.controller.form.common.UserCreateForm;
import cn.com.jtang.web.controller.form.login.LoginForm;
import com.google.code.kaptcha.Constants;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class RegisterController {

    @Resource
    private RegisterService registerService;


    @Value("${superemail}")
    private String superemail;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(
            @ModelAttribute("registerForm") UserCreateForm registerForm,
            Model model) {


        return "register/register";
    }

    /**
     * 企业用户注册
     *
     * @param registerForm
     * @param validateCode
     * @param session
     * @param redirectAttributes
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerSave(
            @ModelAttribute("registerForm") UserCreateForm registerForm,
            @RequestParam(value = "validateCode", required = false) String validateCode,
            HttpSession session,
            RedirectAttributes redirectAttributes,
            HttpServletRequest request, ModelMap model) {
        String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        if (StringUtils.isEmpty(validateCode) || code == null || !code.equals(validateCode.toLowerCase())) {
            redirectAttributes.addFlashAttribute("registerstatus", "validateerror");
            return "redirect:/register";
        }
        try {
            registerService.register(registerForm);
            if (!model.containsAttribute("loginForm")) {
                model.addAttribute("loginForm", new LoginForm());
            }
            model.addAttribute("registerstatus", "success");
            Date now = new Date();
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
            String registertime = sf.format(now);
            String content = "";
            String name = registerForm.getRegisterName();
            String email = registerForm.getEmail();
            try {
                content = "用户" + name + "于" + registertime + "注册了账号!" + "(联系电话:" + registerForm.getPhone() + ";邮箱" + email + "),请及时处理！";
                MailUtil.sendMail("有新用户注册", content, superemail);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("registerstatus", "validateerror");
            return "redirect:/register";
        }
        return "/login";

    }

    @RequestMapping(value = "/register/modifypassword", method = RequestMethod.POST)
    public String modifypassword(
            @ModelAttribute("modifyPwdForm") UserCreateForm modifyPwdForm,
            Model model) {


        return "redirect:/login";
    }

    @RequestMapping(value = "/success")
    public String success() {
        return "success";
    }

    @RequestMapping(value = "/findpassword/modifypwd", method = RequestMethod.GET)
    public String modifypwd(
            @RequestParam(value = "email", required = true) String email,
            @RequestParam(value = "id", required = true) String id,
            ModelMap model) {


        model.addAttribute("findpassword", "failure");

        return "redirect:/login/forgetpassword";
    }


}