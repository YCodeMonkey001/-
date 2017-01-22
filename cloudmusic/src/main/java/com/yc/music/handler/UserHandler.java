package com.yc.music.handler;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.music.entity.User;
import com.yc.music.service.UserService;


@Controller
@RequestMapping("/user")
@SessionAttributes("loginUser")
public class UserHandler {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/register")
	public String register(User user,ModelMap map){
		boolean rw = userService.register(user);
		//System.out.println("user====="+user);
		if((rw+"").trim()=="true"){
			System.out.println("通过！！！");
			return "redirect:/page/login.jsp";
		}
		
		map.put("errorMsg","两次密码不一致");
		return "forward:/page/register.jsp";
		
		
	}

}
