package com.dwh.tech.web;

import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dwh.tech.entity.User;
import com.dwh.tech.service.QuestionService;

@Controller
public class ExamController {

	@Resource
	private QuestionService questionService;
	
	private final int questNum = 10;
	
	@RequestMapping("/examChoose")
	public String choose(HttpServletRequest request){
		return "examtype";
	}
	
	
	@RequestMapping("/exam")
	public String intoExam(HttpServletRequest request,Integer type){
		HttpSession session = request.getSession();
		User u = (User)session.getAttribute("user");
		if(u==null){
			return "login";
		}
		if(type == null){
			return "404";
		}
		//查询id
		List<Integer> count = questionService.selectId(type);
		if(count == null || count.size() == 0){
			return "404";
		}
		Boolean flag = count.size()>questNum?true:false;
		Set<Integer> set = new HashSet<>();
		if(flag){
			while(set.size()<questNum){
				int index = new Random().nextInt(questNum);
				set.add(count.get(index));
			}
			List<Integer> ids = set.stream().collect(Collectors.toList());
			request.setAttribute("question", questionService.selectBatch(ids));
		}else{
			request.setAttribute("question", questionService.selectBatch(count));
		}
		return "exam";
	}

	
}
