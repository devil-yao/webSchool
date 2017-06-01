package com.dwh.tech.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.dwh.tech.entity.Lesson;
import com.dwh.tech.entity.User;
import com.dwh.tech.service.LessonService;
import com.dwh.tech.service.UserService;

@Controller
public class TechDetail {

	Logger logger = LoggerFactory.getLogger(TechDetail.class);
	
	@Resource
	private UserService UserService;
	
	@Resource
	private LessonService lessonService;
	
	@RequestMapping("/tech")
	public String techDetail(HttpServletRequest request,@RequestParam(required = true)Integer techId){
		logger.debug("tech=>techId{}",techId);
		if(techId == null || "".equals(techId)){
			return "404";
		}
		User user = UserService.getTech(techId);
		request.setAttribute("techInfo", user);
		return "techer";
	}
	
	@RequestMapping("/getLesson")
	public void getLesson(@RequestParam(required = true)Integer techId,HttpServletResponse response) throws IOException{
		if(techId == null){
			return ;
		}
		List<Lesson> list = lessonService.getByTecId(techId);
		PrintWriter out = response.getWriter();
		out.write(JSON.toJSONString(list));
		logger.debug("得到我的课程{}",list);
		out.flush();
		out.close();
	}
}
