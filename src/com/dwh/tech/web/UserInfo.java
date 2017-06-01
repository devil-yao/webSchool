package com.dwh.tech.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.dwh.tech.common.Constant;
import com.dwh.tech.entity.User;
import com.dwh.tech.service.UserService;
import com.dwh.tech.util.TechUtil;

@Controller
@MultipartConfig
public class UserInfo {

	private Logger logger = LoggerFactory.getLogger(UserInfo.class);
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/userinfo")
	public String userinfo(HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user == null){
			return "login";
		}
		return "userinfo";
	}
	
	@RequestMapping("/updateHead")
	public void updateInfo(HttpServletRequest request,HttpServletResponse response) throws IOException{
		logger.debug("更新用户头像");
		Part part = null;
		try {
//			ResourceBundle rb = ResourceBundle.getBundle( "spring/config", Locale.SIMPLIFIED_CHINESE);
			part = request.getPart("file");
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			if(part != null){
//				String path = rb.getString("image.path");
				String path = request.getServletContext().getInitParameter("filepath");
				String fileName = part.getSubmittedFileName();
				int split = fileName.indexOf(".");
				String old = fileName.substring(split);
				String newName = TechUtil.fileName()+old;
				String filePath = path+File.separatorChar+newName;
				part.write(filePath); 
				user.setHead(newName);
				userService.update(user);
				session.setAttribute("user", user);
			}
		} catch (Exception e) {
			response.getWriter().write("false");
			logger.error("修改头像出错",e);
		}
		PrintWriter out = response.getWriter();
		out.write("true");
		out.flush();
		out.close();
	}
	
	@RequestMapping("/updateinfo")
	public void updateinfo(HttpServletRequest request,HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String sex = request.getParameter("sex");
		String loginName = request.getParameter("loginName");
		
		if(phone != null && !"".equals(phone)){
			user.setPhone(phone);
		}
		
		if(email != null && !"".equals(email)){
			user.setEmail(email);
		}
		
		if(sex != null && !"".equals(sex)){
			user.setSex(sex);
		}
		
		if(loginName != null && !"".equals(loginName)){
			user.setLogin_name(loginName);
		}
		logger.debug("user{}",user);
		userService.update(user);
		session.setAttribute("user", user);
//		response.getWriter().write("true");
	}
	
	@RequestMapping("/updatePwd")
	public void updatePwd(HttpServletRequest request,HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		String oldPasssword = request.getParameter("oldPassword").trim();
		String newPasssword = request.getParameter("newPassword").trim();
		User u = userService.getUser(user.getPhone(), oldPasssword);
		JSONObject json = new JSONObject();
		if(u == null){
			json.put("code", Constant.OLDFAIL.getCode());
			json.put("desc", Constant.OLDFAIL.getDesc());
			response.getWriter().write(json.toJSONString());
			return;
		}
		if(oldPasssword.equals(newPasssword)){
			json.put("code", Constant.SAME.getCode());
			json.put("desc", Constant.SAME.getDesc());
			response.getWriter().write(json.toJSONString());
			return;
		}
		
		try{
		userService.updatePwd(user.getId(), newPasssword);
		json.put("code", Constant.SUCCESS.getCode());
		json.put("desc", Constant.SUCCESS.getDesc());
		response.getWriter().write(json.toJSONString());
		}catch(Exception e){
			json.put("code", Constant.FAIL.getCode());
			json.put("desc", Constant.FAIL.getDesc());
			response.getWriter().write(json.toJSONString());
		}
	}
}
