package com.dwh.tech.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dwh.tech.common.Status;
import com.dwh.tech.entity.OrderList;
import com.dwh.tech.entity.User;
import com.dwh.tech.entity.Video;
import com.dwh.tech.service.OrderListService;
import com.dwh.tech.service.VideoService;

@Controller
public class VideoController {

	private Logger logger = LoggerFactory.getLogger(VideoController.class);
	
	@Resource
	private OrderListService orderListService;
	@Resource
	private VideoService videoService;
	
	@RequestMapping("/video_{classId}")
	public String intoWatch(HttpServletRequest request,@PathVariable("classId") Integer classId){
		logger.debug("classId{}",classId);
		//判断是否购买
		if(classId == null){
			return "404";
		}
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user == null){
			return "redirect:/login";
		}
		OrderList order = orderListService.getOne(user.getId(), classId);
		if(order == null || order.getStatus() != Status.PAY.getStatus()){
			return "404";
		}
		List<Video> videos = videoService.getByClssId(classId);
		request.setAttribute("videos", videos);
		return "video";
	}
	
}
