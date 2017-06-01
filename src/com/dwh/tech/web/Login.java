package com.dwh.tech.web;


import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dwh.tech.common.Status;
import com.dwh.tech.entity.User;
import com.dwh.tech.service.UserService;

@Controller
public class Login {

	private Logger logger = LoggerFactory.getLogger(Login.class);	
	@Resource
	private UserService userService;
	
	@RequestMapping(value="/loginConfirm",method=RequestMethod.POST)
	public void loginConfirm(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
			logger.debug("请求{}",request);	
			PrintWriter out = response.getWriter();
			String phone = request.getParameter("phone");
			String pwd = request.getParameter("password");
			User user = userService.getUser(phone,pwd);
			HttpSession session = request.getSession();
			if(user != null){
				if(user.getStatus() == Status.ICE.getStatus()){
					out.write("3");
				}else{
					session.setAttribute("user", user);
					out.write("1");
				}
				
			}else{
				out.write("2");
			}
			out.flush();
			out.close();
	}
	@RequestMapping("/login")
	public String login(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user != null){
			return "index";
		}else{
			return "login";
		}
		
	}
	@RequestMapping(value="/regin",method=RequestMethod.POST)
	public void regin(HttpServletRequest request,HttpServletResponse response){
		String phone = request.getParameter("phone");
		String loginName = request.getParameter("loginName");
		if((phone == null || "".equals(phone))&& (loginName == null || "".equals(loginName))) {
			return;
		}
		Boolean flag = userService.check(phone,loginName);
		try {
			response.getWriter().println(String.valueOf(flag));
		} catch (IOException e) {
			logger.debug("出错了{}",e);
		}
		
	}
	@RequestMapping(value="/regUser",method=RequestMethod.POST)
	public void regUser(HttpServletRequest request,HttpServletResponse response){
		String phone = request.getParameter("phone");
		String loginName = request.getParameter("loginName");
		String password = request.getParameter("password");
		User user = new User();
		user.setLogin_name(loginName);
		user.setPassword(password);
		user.setPhone(phone);
		user.setHead("head.jpg");
		user.setCateId(0);
		Boolean flag = userService.insert(user);
		try {
			response.getWriter().println(String.valueOf(flag));
		} catch (IOException e) {
			logger.debug("出错了{}",e);
		}
		
	}
	
}
