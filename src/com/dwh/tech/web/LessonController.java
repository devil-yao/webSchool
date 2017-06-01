package com.dwh.tech.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dwh.tech.common.Status;
import com.dwh.tech.entity.Cart;
import com.dwh.tech.entity.Lesson;
import com.dwh.tech.entity.OrderList;
import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.PageResponse;
import com.dwh.tech.entity.User;
import com.dwh.tech.service.CartService;
import com.dwh.tech.service.LessonService;
import com.dwh.tech.service.OrderListService;
import com.dwh.tech.service.UserService;
import com.dwh.tech.util.TechUtil;

@Controller
public class LessonController {

	private static Logger logger = LoggerFactory.getLogger(LessonController.class);
	
	@Resource
	private LessonService lessonService;
	@Resource
	private UserService userService;
	@Resource
	private OrderListService orderListService;
	@Resource
	private CartService cartService;
	
	
	@RequestMapping("/lesson")
	public String intolesson(HttpServletRequest request){
		String name = request.getParameter("name");
		if(name != null && !"".equals(name)){
			request.setAttribute("name", name);
		}
		return "lesson";
	}
	
	@RequestMapping("/lessonAll")
	public void getlesson(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String current = request.getParameter("current");
		String rule = request.getParameter("name");
		String cateId = request.getParameter("cateId");
		logger.debug("========={}",rule);
		logger.debug("=========cateId{}",cateId);
		int cur = 0;
		int cate = 0;
		try{
			if(current != null && !"".equals(current)){
				cur = Integer.parseInt(current);
			}
			if(cateId != null && !"".equals(cateId)){
				cate = Integer.parseInt(cateId);
			}
		}catch(Exception e){
			logger.error("出错了",e.getMessage());
		}
		PageRequest page = PageRequest.build(cur, rule);
		PageResponse<Lesson> resp = new PageResponse<Lesson>();
		switch (cate) {
		case 0:
			resp = lessonService.getPage(page);
			break;

		default:
			resp.setPageCount(page.getPageCount());
			resp.setTotal(lessonService.getTotalByCateId(cate));
			resp.setList(lessonService.getPageByCateId(page, cate));
			break;
		}
		
		String result = JSON.toJSONString(resp);
		response.getWriter().write(result);
	}
	
	@RequestMapping(value = "/lessonDetail")
	public ModelAndView detail(@RequestParam(required = true)Integer classId,HttpServletRequest request){
		HttpSession session = request.getSession();
		if(classId == null || "".equals(classId)){
			return new ModelAndView("404");
		}
		Lesson lesson = lessonService.getById(classId);
		session.setAttribute("lesson", lesson);
		int techId = lesson.getTechId();
		User tech = userService.getTech(techId);
		session.setAttribute("tech", tech);
		lessonService.updateNumLook(classId);
		logger.debug("教师{}",tech);
		return new ModelAndView("lessonDetail");
	}
	
	@RequestMapping("/goodLesson")
	public void goodCourse(@RequestParam(required = true)Integer pageCount,HttpServletResponse response) throws IOException{
		PageRequest request = PageRequest.build(1, null);
		if(pageCount == null){
			return;
		}
		request.setPageCount(pageCount);
		PrintWriter out = response.getWriter();
		List<Lesson> list = lessonService.getGoodCourse(request);
		out.write(JSON.toJSONString(list));
		out.flush();
		out.close();
	}
	
	@RequestMapping("/payForLesson")
	public void pay(@RequestParam(required = true)Integer classId,HttpSession session,HttpServletResponse response) throws IOException{
		logger.debug("购买课程{}",classId);
		PrintWriter out = response.getWriter();
		User user = (User)session.getAttribute("user");
		//先判断购物车是否存在，存在修改状态
		Cart cart = cartService.getByClassId(classId, user.getId());
		if(cart != null && cart.getStatus() == Status.NOTPAY.getStatus()){
			cartService.updateCar( Status.PAY.getStatus(),cart.getCartId());
		}
		//判断是否重复购买
		OrderList ordre = orderListService.getOne(user.getId(),classId);
		if(ordre != null){
			out.write("无需重复购买");
		}else{
			OrderList orderList = new OrderList();
			orderList.setClassId(classId);
			orderList.setOrderNo(TechUtil.orderNo());
			orderList.setDes(Status.PAY.getDesc());
			orderList.setStatus(Status.PAY.getStatus());
			orderList.setPayTime(TechUtil.dateString(new Date()));
			orderList.setUserId(user.getId());
			orderListService.insertOrder(orderList);
			lessonService.updateNumBuy(classId);
			out.write("购买成功");
		}
		out.flush();
		out.close();
	}
	@RequestMapping("/confLess")
	public void confLess(@RequestParam(required = true)Integer classId,HttpSession session,HttpServletResponse response) throws IOException{
		User user = (User)session.getAttribute("user");
		PrintWriter out = response.getWriter();
		OrderList order = orderListService.getOne(user.getId(), classId);
		if(order == null){
			out.write("0");
		}else{
				out.write("1"); //是否重复购买
		}
		out.flush();
		out.close();
	}
	
}
