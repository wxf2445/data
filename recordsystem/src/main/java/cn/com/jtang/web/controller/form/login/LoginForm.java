package cn.com.jtang.web.controller.form.login;

import cn.com.jtang.web.controller.validation.First;
import cn.com.jtang.web.controller.validation.Second;
import cn.com.jtang.web.controller.validation.Third;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

import javax.validation.GroupSequence;
import java.io.Serializable;

/**
 * Class description
 *
 *
 * @version        1.0.0, 16/03/31
 * @author         zhm    
 */
@Component("loginForm")
@GroupSequence( {
    First.class, Second.class, Third.class, LoginForm.class
})
public class LoginForm implements Serializable{
    @NotBlank(
        message = "{loginform.username.not.empty}",
        groups  = { First.class }
    )
    private String username;
    @NotBlank(
        message = "{loginform.password.not.empty}",
        groups  = { Second.class }
    )
    private String password;

    /**
     * Method description getPassword
     *
     *
     * @return String 
     */
    public String getPassword() {
        return password;
    }

    /**
     * Method description setPassword
     *
     *
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Method description getUsername
     *
     *
     * @return String 
     */
    public String getUsername() {
        return username;
    }

    /**
     * Method description setUsername
     *
     *
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
