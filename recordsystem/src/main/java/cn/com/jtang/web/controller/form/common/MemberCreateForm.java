package cn.com.jtang.web.controller.form.common;

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
 * @author zhm
 * @version 1.0.0, 16/03/31
 */
@Component("memberCreateForm")
@GroupSequence({
        First.class, Second.class, Third.class, MemberCreateForm.class
})
public class MemberCreateForm implements Serializable {


    @NotBlank(
            message = "{memberCreateForm.name.not.empty}",
            groups = {First.class}
    )
    private String name;
    private Boolean sex;
    private String grade;
    private String profession;
    private String work;

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
