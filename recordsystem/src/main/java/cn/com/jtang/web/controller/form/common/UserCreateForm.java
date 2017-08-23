package cn.com.jtang.web.controller.form.common;

import cn.com.jtang.web.controller.validation.First;
import cn.com.jtang.web.controller.validation.Second;
import cn.com.jtang.web.controller.validation.Third;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.GroupSequence;
import java.io.Serializable;

/**
 * Class description
 *
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Component("userCreateForm")
@GroupSequence({
        First.class, Second.class, Third.class, UserCreateForm.class
})
public class UserCreateForm implements Serializable {


    @NotBlank(
            message = "{userCreateForm.registerName.not.empty}",
            groups = {First.class}
    )
    private String registerName;
    @NotBlank(
            message = "{userCreateForm.userpassword.not.empty}",
            groups = {Second.class}
    )
    private String userpassword;
    private String email;
    private String phone;
    private String tempusername;
    private String description;
    private MultipartFile applydata;
    private Integer role;
    public String getTempusername() {
        return tempusername;
    }

    public void setTempusername(String tempusername) {
        this.tempusername = tempusername;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public String getRegisterName() {
        return registerName;
    }

    public void setRegisterName(String registerName) {
        this.registerName = registerName;
    }

    public MultipartFile getApplydata() {
        return applydata;
    }

    public void setApplydata(MultipartFile applydata) {
        this.applydata = applydata;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

}


//~ Formatted by Jindent --- http://www.jindent.com
