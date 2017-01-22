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

import com.yc.ccs.entity.User;
import com.yc.ccs.service.UserService;

@Controller
@RequestMapping("/user")
@SessionAttributes("loginUser")
public class UserHandler {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/forget")
	public String forget(String username,String email,HttpServletRequest request){
		LogManager.getLogger().debug("请求UserHandler进行forget的操作。。。");
		LogManager.getLogger().debug("请求数据username:"+username+",email:"+email);
		
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom("y2840369162@163.com");
			helper.setTo(email);
			helper.setSubject("找回密码");
			//String hrefStr = session.getServletContext().getContext("/user/getpassword")+"?username="+username;
			String hrefStr = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getServletContext().getContextPath() + "/user/getpassword?username=" + username;
			System.out.println(hrefStr);
			helper.setText("<a href='" + hrefStr + "'>找回密码</a>"+"<br>如果连接不可用拷贝" + hrefStr , true);
			mailSender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			return "redirect:/page/forgetPassword.jsp";
		}
		return "redirect:/page/forgetSuccess.jsp";
		
	}
	
	@RequestMapping("/getpassword")
	public String getpassword(String username, HttpSession session) {
		Random rand = new Random();
		String randPassword = rand.nextInt(900000) + 100000 + "";
		System.out.println("新密码是："+randPassword);
		userService.resetPassword(username, randPassword);
		//业务处理重置密码
		session.setAttribute("newPassword", randPassword);
		return "redirect:/page/getpasswordSuccess.jsp";
	}
	
	@RequestMapping("/login")
	public String login(User user,ModelMap map){
		user = userService.login(user);
		System.out.println("user====="+user);
		if(user !=null){
			map.put("loginUser", user);
			System.out.println("通过！！！");
			return "redirect:/page/manage.jsp";
		}
		
		map.put("errorMsg","用户名或密码错误");
		return "forward:/login.jsp";
		
		
	}

}
