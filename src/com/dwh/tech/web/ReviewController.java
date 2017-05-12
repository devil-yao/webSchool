package com.dwh.tech.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.dwh.tech.common.Authority;
import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.PageResponse;
import com.dwh.tech.entity.Review;
import com.dwh.tech.entity.User;
import com.dwh.tech.service.ReviewService;
import com.dwh.tech.service.UserService;
import com.dwh.tech.util.TechUtil;

@Controller
public class ReviewController {

	@Resource
	private ReviewService reviewService;
	@Resource
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	/**
	 * 增加评论
	 * @throws IOException 
	 * 1 未登录 2发生错误 0正常 3教师用户
	 */
	@RequestMapping("/addView")
	public void addReview(HttpServletRequest request,HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		User user = (User)session.getAttribute("user");
		//判断是否登录
		if(user == null){
			out.write("1");
			return;
		}else if(user.getAuthority() == Authority.TEACHER.getAuthority()){
			out.write("3");
			return;
		}
		try {
			String conent = request.getParameter("conent");
			String classId = request.getParameter("classId");
			String time = TechUtil.dateString(new Date());
			Review re = new Review();
			re.setClassId(new Integer(classId));
			re.setReview(conent);
			re.setUserId(user.getId());
			re.setRevTime(time);
			reviewService.insert(re);
		} catch (Exception e) {
			// TODO: handle exception
			logger.debug("增加评论出错了{}",e);
			out.write("2");
			return;
		}
		out.write("0");
		out.flush();
		out.close();
	}
	@RequestMapping("/getReview")
	public void getReview(Integer current,Integer pageCount,HttpServletResponse response) throws IOException{
		PageRequest request = PageRequest.build(current, null);
		request.setPageCount(pageCount);
		int total = reviewService.countAll();
		List<Review> list = reviewService.getPage(request);
			PageResponse<Review> page = new PageResponse<>();
			page.setPageCount(pageCount);
			page.setTotal(total);
			
			List<Review> reviews = list.stream()
			.map(re->{
				int userId = re.getUserId();
				User user = userService.getById(userId);
				if(user != null){
					re.setHead(user.getHead());
					re.setName(user.getLogin_name());
				}
				return re;
			})
			.collect(Collectors.toList());
			page.setList(reviews);
			PrintWriter out = response.getWriter();
			out.write(JSON.toJSONString(page));
			out.flush();
			out.close();
	}
	 
}
