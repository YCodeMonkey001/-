package com.yc.music.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.music.entity.User;
import com.yc.music.mapper.UserMapper;
import com.yc.music.service.UserService;
import com.yc.music.util.Encrypt;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public boolean register(User user) {
		user.setUser_pwd(Encrypt.md5AndSha(user.getUser_pwd()));
		return userMapper.register(user)>0;
	}

}
