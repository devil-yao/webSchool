package com.dwh.tech.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.dwh.tech.entity.Lesson;
import com.dwh.tech.entity.OrderList;
import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.PageResponse;
import com.dwh.tech.entity.User;
import com.dwh.tech.service.LessonService;
import com.dwh.tech.service.OrderListService;

@Controller
public class OrderListController {

	private Logger logger = LoggerFactory.getLogger(OrderListController.class);
	
	@Resource
	private OrderListService orderService;
	@Resource
	private LessonService lessonService;
	
	@RequestMapping(value = "/myOrder",method = RequestMethod.POST)
	public void getMyOrder(HttpServletRequest request, HttpServletResponse response,@RequestParam(required = true)Integer current,@RequestParam(required = true)Integer pageCount) throws IOException{
		logger.debug("我的订单current{},pageCount{}",current,pageCount);
		PrintWriter out = response.getWriter();
		User user = (User)request.getSession().getAttribute("user");
		PageRequest req = PageRequest.build(current, null);
		req.setPageCount(pageCount);
		PageResponse<OrderList> resp = new PageResponse<>();
		List<OrderList> list = orderService.selectByUserId(user.getId(), null, req.getStart(), req.getPageCount());
		List<OrderList> orders = new ArrayList<>();
		for (OrderList orderList : list) {
			Lesson lesson = lessonService.getById(orderList.getClassId());
			orderList.setLesson(lesson);
			orders.add(orderList);
		}
		resp.setList(orders);
		resp.setPageCount(pageCount);
		resp.setTotal(orderService.countAll(user.getId(), null));
		out.write(JSON.toJSONString(resp));
		logger.debug("得到我的订单resp{}",resp);
		out.flush();
		out.close();
	}
	
}
