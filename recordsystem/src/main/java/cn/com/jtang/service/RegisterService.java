package cn.com.jtang.service;

import cn.com.jtang.po.User;
import cn.com.jtang.web.controller.form.common.UserCreateForm;

import java.io.IOException;


public interface RegisterService {
	
	public User register(UserCreateForm form) throws IOException;
	
}
