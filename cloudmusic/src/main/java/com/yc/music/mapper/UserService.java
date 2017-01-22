package com.yc.music.mapper;

import com.yc.ccs.entity.User;

public interface UserService {
	 void resetPassword(String username,String randPassword);

	User login(User user);
}
