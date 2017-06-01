package com.dwh.tech.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.dwh.tech.common.Authority;
import com.dwh.tech.common.Status;
import com.dwh.tech.entity.Admin;
import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.PageResponse;
import com.dwh.tech.entity.User;
import com.dwh.tech.service.TeacherService;
import com.dwh.tech.service.UserService;
import com.dwh.tech.util.TechUtil;

@Controller
@MultipartConfig
public class Teacher {

	Logger logger = LoggerFactory.getLogger(Teacher.class);
	@Resource
	private TeacherService teacherService;
	@Resource
	private UserService userService;
	
	
	@RequestMapping("/techList")
	public String intoTechList(){
		return "techList";
	}
	
	@RequestMapping("/getTech")
	public void getTeacher(HttpServletRequest request,@RequestParam(required = true)Integer current,HttpServletResponse response) throws IOException{
		String type = request.getParameter("type").trim();
		PageRequest  req = PageRequest.build(current, null);
		PrintWriter out = response.getWriter();
		switch (type) {
		case "1":
			PageResponse<User> page = teacherService.getPage(req);
			out.write(JSON.toJSONString(page));
			logger.debug("查询到的教师{}",page);
			break;

		case "2":
			String cateId = request.getParameter("cateId").trim();
			if(cateId == null || "".equals(cateId)){
				break;
			}
			PageResponse<User> pa = new PageResponse<>();
			pa.setPageCount(req.getPageCount());
			Integer cate = new Integer(cateId);
			int total = teacherService.countByCateId(cate);
			pa.setTotal(total);
			pa.setList(teacherService.getByCateId(req, cate));
			out.write(JSON.toJSONString(pa));
			logger.debug("根据类别查询到的教师{}",pa);
			break;
			
		}
		out.flush();
		out.close();
	}
	
	@RequestMapping("/iteacher")
	public void iteacher(@RequestParam(required = true)Integer pageCount,HttpServletResponse response) throws IOException{
		if(pageCount == null){
			return;
		}
		PageRequest request = PageRequest.build(1, null);
		request.setPageCount(pageCount);
		List<User> list = teacherService.getAllTeacherPage(request);
		PrintWriter out = response.getWriter();
		out.write(JSON.toJSONString(list));
		out.flush();
		out.close();
	}

	@RequestMapping("/addTech")
	public String addTeacher(HttpServletRequest request){
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		if(admin == null){
			return "redirect:/adminlogin";
		}
		request.removeAttribute("operater");
		return "teacherAdd";
	}
	
	/**
	 * 增加教师操作
	 * @param request
	 * @return
	 */
	@RequestMapping("/addTechoperator")
	public String addOperator(HttpServletRequest request){
		request.removeAttribute("operater");
		try {
			String techName = request.getParameter("techName");
			String cateId = request.getParameter("cateId");
			String phone = request.getParameter("phone");
			logger.debug("类别id{}",cateId);
			String desc = request.getParameter("career");
			Part part = request.getPart("uploadfile");
			if(part != null){
				String fil = part.getSubmittedFileName();
				String fileName = TechUtil.fileName()+fil.substring(fil.lastIndexOf("."));
				part.write(request.getServletContext().getInitParameter("filepath")+File.separatorChar+fileName);
				logger.debug("techName{}",techName);
				User user = new User();
				user.setCateId(new Integer(cateId));
				user.setLogin_name(techName);
				user.setPassword("123456");
				user.setPhone(phone);
				user.setAuthority(Authority.TEACHER.getAuthority());
				user.setStatus(Status.NORMAL.getStatus());
				user.setDec(desc);
				user.setHead(fileName);
				userService.insert(user);
			}else{
				request.setAttribute("operater", false);
				return "teacherAdd";
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("添加教师失败{}",e);
			request.setAttribute("operater", false);
			return "teacherAdd";
		}
		
		request.setAttribute("operater", true);
		return "teacherAdd";
	}
	
}
