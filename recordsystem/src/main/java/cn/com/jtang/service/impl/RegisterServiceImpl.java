package cn.com.jtang.service.impl;

import cn.com.jtang.po.User;
import cn.com.jtang.service.RegisterService;
import cn.com.jtang.service.UserService;
import cn.com.jtang.util.IDGenerator;
import cn.com.jtang.util.Md5Util;
import cn.com.jtang.web.controller.form.common.UserCreateForm;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Date;


@Service("registerService")
@Transactional
public class RegisterServiceImpl implements RegisterService {


    @Resource
    private UserService userService;


    @Override
    @Transactional
    public User register(UserCreateForm form) throws IOException {
        // TODO Auto-generated method stub


        User user = new User();
        user.setUserid(IDGenerator.generator());
        user.setUsername(form.getRegisterName());
        String password = Md5Util.getMD5(form.getRegisterName() + form.getUserpassword());
        user.setPwd(password);
        user.setRoleid(2);
        user.setIsdelete(false);
        user.setEmail(form.getEmail());
        user.setPhone(form.getPhone());
        user.setCheckresult(true);

        MultipartFile file = form.getApplydata();

        //FileInputStream fileInputStream = new FileInputStream(file.getInputStream());
        //String path = cn.com.jtang.util.FileUtils.getFilePath(user.getUserid());
        //path += file.getOriginalFilename();
        //cn.com.jtang.util.FileUtils.saveFile(file.getInputStream(), path);

        //user.setApplydata(path);
        user.setCreatetime(new Date());
        userService.insert(user);

        return user;
    }

}
