package com.dwh.tech.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Index {

	private final Logger logger = LoggerFactory.getLogger(Index.class);
	
	@RequestMapping("/index")
	public String index(){
		
		return "index";
	}
	
	@RequestMapping("/exit")
	public void exit(HttpServletRequest request,HttpServletResponse response){
		try {
//			session.getAttribute("user")
			request.getSession().removeAttribute("user");
			logger.debug("========={}",request.getSession().getAttribute("user"));
			response.getWriter().write("true");
		} catch (IOException e) {
			
		}
	}
	
}
