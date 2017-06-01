package com.dwh.tech.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.dwh.tech.common.Status;
import com.dwh.tech.entity.Cart;
import com.dwh.tech.entity.CartDetail;
import com.dwh.tech.entity.Lesson;
import com.dwh.tech.entity.OrderList;
import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.PageResponse;
import com.dwh.tech.entity.User;
import com.dwh.tech.service.CartService;
import com.dwh.tech.service.LessonService;
import com.dwh.tech.service.OrderListService;
import com.dwh.tech.util.TechUtil;
@Controller
public class CartOperator {

	private Logger logger = LoggerFactory.getLogger(CartOperator.class);
	
	@Resource
	private CartService cartService;
	@Resource
	private LessonService lessonService;
	@Resource
	private OrderListService orderListService;
	
	@RequestMapping("/cart")
	public String intoCart(HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user != null){
		return "cart";
		}else{
			return "redirect:/";
		}
		}
	
	@RequestMapping(value = "/mycart",method=RequestMethod.POST)
//	@ResponseBody
	public void detail(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String cur = request.getParameter("current");
		String pageCount = request.getParameter("pageCount");
		if(user != null){
			int current = Integer.parseInt(cur);
			int pageCo = Integer.parseInt(pageCount);
			PageRequest req = PageRequest.build(current, null);
			req.setPageCount(pageCo);
			PageResponse<Cart> page = 
					cartService.selectPage(user.getId(), req,Status.NOTPAY.getStatus());
			List<CartDetail> detail = new ArrayList<>();
			if(page != null && page.getList() != null){
				List<Cart> list = page.getList();
				for (Cart cart : list) {
					Lesson lesson = lessonService.getById(cart.getClassId());
					if(lesson == null){
//						return null;
						continue;
					}
					CartDetail cd = new CartDetail();
					cd.setClassId(lesson.getClassId());
					cd.setCartId(cart.getCartId());
					cd.setTechId(cart.getTechId());
					cd.setHead(lesson.getPicture());
					cd.setLessonName(lesson.getClassName());
					cd.setPrice(lesson.getPrice());
					cd.setTeachName(lesson.getTechName());
					cd.setTime(lesson.getClassTime());
					for(Status st:Status.values()){
						if(cart.getStatus() == st.getStatus()){
						cd.setStatus(st.getDesc());
						}
					}
					detail.add(cd);
				}
			}
			PageResponse<CartDetail> resp = new PageResponse<>();
			resp.setList(detail);
			resp.setPageCount(page.getPageCount());
			resp.setTotal(page.getTotal());
			logger.debug("购物车详情:{}",resp);
			out.write(JSON.toJSONString(resp));
			}else{
				out.write("null");
			}
		out.flush();
		out.close();
	}
	@RequestMapping("/addCart")
	public void addCart(HttpServletRequest request,HttpServletResponse response,@RequestParam(required = true)Integer classId) throws IOException, ServletException{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		PrintWriter out = response.getWriter();
		if(user == null){
			out.write("false");
			return;
		}
		Cart cart = cartService.getByClassId(classId,user.getId());
		if(cart == null){
			OrderList irder = orderListService.getOne(user.getId(), classId);
			if(irder!= null){
				out.write("false");
				return;
			}
			Cart newcart = new Cart();
			newcart.setClassId(classId);
			newcart.setStatus(Status.NOTPAY.getStatus());
			Lesson lesson = lessonService.getById(classId);
			newcart.setTechId(lesson.getTechId());
			newcart.setUserId(user.getId());
			logger.debug("购物车{}",newcart);
			cartService.add(newcart);
		}else{
			
			out.write("false");
			out.flush();
			out.close();
		}
	}
	@RequestMapping("/getCount")
	public void getCount(@RequestParam(required = true)Integer userId,HttpServletResponse response) throws IOException{
		logger.debug("参数{}",userId);
		PrintWriter out = response.getWriter();
		if(userId == null || "".equals(userId)){
			out.write("0");
		}else{
			int count = cartService.count(userId);
			out.write(""+count);
		}
		out.flush();
		out.close();
	}
	
	@RequestMapping("/deleteCart")
	public void deleteCart(@RequestParam(required = true)Integer cartId,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		if(cartId == null){
			return;
		}
		cartService.deleteCart(cartId);
		out.write("true");
		out.flush();
		out.close();
	} 
	
	@RequestMapping("/payCart")
	public void payCart(@RequestParam(required = true)Integer cartId,@RequestParam(required = true)Integer classId,HttpServletResponse response,HttpServletRequest request) throws IOException{
		logger.debug("支付参数cartId{},classId{}",cartId,classId);
		PrintWriter out = response.getWriter();
		if(cartId == null || classId == null){
			out.write("false");
			out.flush();
			out.close();
			return;
		}
		User user = (User)request.getSession().getAttribute("user");
		OrderList orderList = new OrderList();
		orderList.setClassId(classId);
		orderList.setOrderNo(TechUtil.orderNo());
		orderList.setDes(Status.PAY.getDesc());
		orderList.setStatus(Status.PAY.getStatus());
		orderList.setPayTime(TechUtil.dateString(new Date()));
		orderList.setUserId(user.getId());
		orderListService.insertOrder(orderList);
		cartService.updateCar(Status.PAY.getStatus(), cartId);
		lessonService.updateNumBuy(classId);
		out.write("true");
		out.flush();
		out.close();
	} 
	
}
