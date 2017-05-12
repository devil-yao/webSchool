package com.dwh.tech.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.dwh.tech.common.Status;
import com.dwh.tech.entity.Admin;
import com.dwh.tech.entity.Categroy;
import com.dwh.tech.entity.Lesson;
import com.dwh.tech.entity.OrderList;
import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.PageResponse;
import com.dwh.tech.entity.Question;
import com.dwh.tech.entity.User;
import com.dwh.tech.entity.Video;
import com.dwh.tech.service.AdminService;
import com.dwh.tech.service.CartService;
import com.dwh.tech.service.CategroyService;
import com.dwh.tech.service.LessonService;
import com.dwh.tech.service.OrderListService;
import com.dwh.tech.service.QuestionService;
import com.dwh.tech.service.TeacherService;
import com.dwh.tech.service.UserService;
import com.dwh.tech.service.VideoService;
import com.dwh.tech.util.TechUtil;

@Controller
@MultipartConfig
public class AminController {

	private Logger logger = LoggerFactory.getLogger(AminController.class);
	
	@Resource
	private AdminService adminService;
	@Resource
	private UserService userSvice;
	@Resource
	private TeacherService teacherService;
	@Resource
	private CartService cart;
	@Resource
	private OrderListService order;
	@Resource
	private LessonService lesson;
	@Resource
	private CategroyService categroyService;
	@Resource
	private VideoService videoService;
	@Resource
	private QuestionService questionService;
	
	@RequestMapping("/admin")
	public String intoAdmin(HttpServletRequest request){
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		if(admin == null){
			return "redirect:/adminlogin";
		}
		return "admin";
	}
	
	@RequestMapping("/outlogin")
	public String outlogin(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		return "redirect:/adminlogin";
	}
	
	@RequestMapping("/userList")
	public String intoUser(HttpServletRequest request){
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		if(admin == null){
			return "redirect:/adminlogin";
		}
		return "userList";
	}
	
	/**
	 * 条件查询用户
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/getParam",method=RequestMethod.POST)
	public void getUser(HttpServletRequest request,HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		String regex = "^1[3578]\\d{9}$";
		String userId = request.getParameter("userId");
		String keyWord = request.getParameter("keyWord");
		String status = request.getParameter("isavalible");
		Integer id = null;
		User user = new User();
		
		if(userId != null && !"".equals(userId)){
			try {
				id = new Integer(userId);
			} catch (Exception e) {
				// TODO: handle exception
				id = null;
			}
		}
		
		Integer userStatus = null;
		if(status != null && !"".equals(status) && !"0".equals(status)){
			try {
				userStatus = new Integer(status);
			} catch (Exception e) {
				// TODO: handle exception
				userStatus = null;
			}
		}
		user.setId(id);
		user.setStatus(userStatus);
		if(keyWord != null && !"".equals(keyWord)){
			if(keyWord.matches(regex)){
				user.setPhone(keyWord);
			}else{
				user.setLogin_name(keyWord);
			}
		}
		
		List<User> list = userSvice.getByParam(user);
		out.write(JSON.toJSONString(list));
		out.flush();
		out.close();
	}
	
	@RequestMapping("/adminlogin")
	public String adminLogin(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("message");
		session.removeAttribute("sys_status");
		session.removeAttribute("sysName");
		return "loginadmin";
	}
	
	@RequestMapping("/adminIndex")
	public String admin(HttpServletRequest request){
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		if(admin == null){
			return "redirect:/adminlogin";
		}
		return "indexadmin";
	}
	
	/**
	 * 登录校验
	 * @param request
	 * @return
	 */
	@RequestMapping("/adminLoginConfig")
	public String configLogin(HttpServletRequest request){

		String loginName = request.getParameter("loginName").trim();
		String password = request.getParameter("loginPwd").trim();
		Admin admin = adminService.select(loginName, password);
		HttpSession session = request.getSession();
		session.removeAttribute("message");
		session.removeAttribute("type");
		session.removeAttribute("sysName");
		if(admin == null){
			session.setAttribute("sysName", loginName);
			session.setAttribute("message", "用户名密码错误");
			return "loginadmin";
		}
		int status = admin.getStatus();
		logger.debug("用户状态{}",status);
		if(status == Status.ICE.getStatus()){
			session.setAttribute("sys_status", "1");
			return "loginadmin";
		}else{
			session.setAttribute("admin", admin);
			return "redirect:/admin";
		}
		
		
	}

	/**
	 * 修改用户状态，冻结，解冻等
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/updateStatus")
	public void updateStatus(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String type = request.getParameter("type").trim();
		String userId = request.getParameter("userId").trim();
		PrintWriter out = response.getWriter();
		int count = 0;
		try {
		switch (type) {
//		1冻结 2：解冻
		case "1":
			count = userSvice.updateStatus(new Integer(userId), Status.ICE.getStatus());
			break;
		case "2":
			count = userSvice.updateStatus(new Integer(userId), Status.NORMAL.getStatus());
			break;
		}
		} catch (Exception e) {
			// TODO: handle exception
			out.write("error");
			out.flush();
			out.close();
			return;
		}
//		userSvice.update(user);
		if(count <= 0){
			out.write("error");
		}else{
			out.write("success");
		}
		out.flush();
		out.close();
		
	}

	//查询该用户订单情况
	@RequestMapping("/order_{userId}")
	public String orderManage(@PathVariable("userId") Integer userId,HttpServletRequest request){
		if(userId == null){
			return "404";
		}
		HttpSession session = request.getSession();
		OrderList ol = new OrderList();
		if(userId != null && userId != 0){
			ol.setUserId(userId);
		}
		String orderNo = request.getParameter("orderNo");
		String id = request.getParameter("showName");
		String state = request.getParameter("states");
		if(orderNo != null && !"".equals(orderNo)){
			ol.setOrderNo(orderNo);
		}
		
		if(id != null && !"".equals(id)){
			try {
				ol.setUserId(new Integer(id));
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
		if(state != null && !"".equals(state)){
			try {
				ol.setStatus(new Integer(state));
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		List<OrderList> list = order.searchByUserId(ol);
		List<OrderList> orders = list.stream().map(o->{
			Lesson l = lesson.getById(o.getClassId());
			User u = userSvice.getById(o.getUserId());
			o.setLesson(l);
			o.setUser(u);
			return o;
		}).collect(Collectors.toList());
		session.setAttribute("orderListAll", orders);
		return "orderManager";
	}
	
	@RequestMapping("/teacherList")
	public String teacher(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		if(admin == null){
			return "redirect:/adminlogin";
		}
		return "teacherList";
	}
	
	/**
	 * 查询所有教师情况
	 * @param current
	 * @param pageCount
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/adminGetTeacher")
	public void adminGetTeacher(HttpServletRequest request,Integer current,Integer pageCount,HttpServletResponse response) throws IOException{
		logger.debug("当前页数{}",current); 
		String techName = request.getParameter("teacherNme");
		String type = request.getParameter("lessontype");
		User uu = new User();
		if(techName != null && !"".equals(techName)){
			uu.setLogin_name(techName);
		}
		if(type != null && !"".equals(type) && !"0".equals(type)){
			try {
				uu.setCateId(new Integer(type));
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		PrintWriter out = response.getWriter();
		PageRequest req = PageRequest.build(current, null);
		req.setPageCount(pageCount);
		List<User> list = teacherService.getTeacherPageByParam(req, uu);
		List<User> techs = list.stream()
				.map(t->{
					Categroy ca = categroyService.selectById(t.getCateId());
					if(ca != null){
						t.setCateName(ca.getCateName());
					}
					return t;
				}).collect(Collectors.toList());
		int count = teacherService.count();
		PageResponse<User> resp = new PageResponse<>();
		resp.setList(techs);
		resp.setPageCount(pageCount);
		resp.setTotal(count);
		out.write(JSON.toJSONString(resp));
		out.flush();
		out.close();
		}
	
	@RequestMapping("/myLesson")
	public String intoMylesson(HttpServletRequest request){
		HttpSession session = request.getSession();
		String techId = request.getParameter("techId");
		
		if(techId == null || "".equals(techId)){
			return "404";
		}
		Admin admin = (Admin)session.getAttribute("admin");
		if(admin == null){
			return "redirect:/adminlogin";
		}
		return "myLesson";
	}
	/**
	 * 查询该教师所有课程
	 * @param techId
	 * @param current
	 * @param pageCount
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/adminGetmyLesson")
	public void getMylesson(Integer techId,Integer current,Integer pageCount,
			HttpServletResponse response) throws IOException{
		PageRequest req = PageRequest.build(current, null);
		req.setPageCount(pageCount);
		int total = lesson.countMyLesson(techId);
		List<Lesson> list = lesson.getPageByTecId(techId, req.getStart(), req.getPageCount());
		List<Lesson> less = list.stream()
				.map(t->{
					Categroy ca = categroyService.selectById(t.getCateId());
					t.setCateName(ca.getCateName());
					return t;
				}).collect(Collectors.toList());
		PageResponse<Lesson> resp = new PageResponse<>();
		resp.setList(less);
		resp.setPageCount(pageCount);
		resp.setTotal(total);
		PrintWriter out = response.getWriter();
		out.write(JSON.toJSONString(resp));
		out.flush();
		out.close();
	}
	
	@RequestMapping("/updateInfo")
	public String updateInfo(Integer techId,HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		if(admin == null){
			return "redirect:/adminlogin";
		}
		if(techId == null){
			return "404";
		}
		
		User user = userSvice.getTech(techId);
		if(user == null){
			return "404";
		}else{
			Categroy ca = categroyService.selectById(user.getCateId());
			if(ca != null){
				user.setCateName(ca.getCateName());
			}
			request.setAttribute("tech", user);
		}
		return "updateInfo";
	}
	
	/**
	 * 更新教师信息
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@RequestMapping("/updateTeacher")
	public String updaetTeacher(HttpServletRequest request) throws IOException, ServletException{
		
		String loginName = request.getParameter("techName");
		Integer userId = null;
		Integer cateId = null;
		try {
			userId = new Integer(request.getParameter("userid"));
			cateId = new Integer(request.getParameter("cateId"));
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("operater", false);
			return "updateInfo";
		}
		
		String desc = request.getParameter("career");
		String phone = request.getParameter("phone");
		User user = new User();
		user.setCateId(cateId);
		user.setId(userId);
		user.setDec(desc);
		user.setPhone(phone);
		user.setLogin_name(loginName);
		
		Part part = request.getPart("uploadfile");
		if(part != null && part.getSize() > 0){
			logger.debug("文件名{}",part.getSize());
			String fileName = part.getSubmittedFileName();
			String end = fileName.substring(fileName.lastIndexOf("."));
			String name = TechUtil.fileName()+end;
			try {
				part.write("D:\\Tomcat\\images"+File.separatorChar+name);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				request.setAttribute("operater", false);
				return "updateInfo";
			}
			user.setHead(name);
		}
		teacherService.update(user);
		User u = userSvice.getTech(userId);
		logger.debug("用户{}",u);
		logger.debug("用户{}",userId);
		Categroy ca = categroyService.selectById(u.getCateId());
		if(ca != null){
			u.setCateName(ca.getCateName());
		}
		request.setAttribute("tech", u);
		request.setAttribute("operater", true);
		return "updateInfo";
	}
	
	@RequestMapping("/lessAdd")
	public String lessAdd(HttpServletRequest request){
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		if(admin == null){
			return "redirect:/adminlogin";
		}
		return "lessonAdd";
	}
	
	@RequestMapping("/getTeacher")
	public void getTeacher(HttpServletResponse response) throws IOException{
		List<User> list = teacherService.getAllTeacher();
		PrintWriter out = response.getWriter();
		out.write(JSON.toJSONString(list));
		out.flush();
		out.close();
	}
	
	/**
	 * 增加课程
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@RequestMapping("/addLesson")
	public String add(HttpServletRequest request) throws IOException, ServletException{
//		video lessName cateId classNum techId uploadfile
		Enumeration<String> en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String string =  en.nextElement();
			logger.debug("课程{}",string);
		}
		//得到课程名字
		String lessName = request.getParameter("lessName");
		//得到类别id
		String cateId = request.getParameter("cateId");
		//得到课时数
		String classNum = request.getParameter("classNum");
		//得到教师id
		String techId = request.getParameter("techId");
		//得到教师姓名
		String tName = request.getParameter("tName");
		//得到教师姓名
		String price = request.getParameter("price");
			
		
		try {
			Part part = request.getPart("uploadfile");
			if(part == null || part.getSize() == 0 || part.getContentType() == null){
				request.setAttribute("status", false);
				return "lessonAdd";
			}
			String fileName = part.getSubmittedFileName();
			String end = fileName.substring(fileName.lastIndexOf("."));
			String name = TechUtil.fileName()+end;
			part.write("D:\\Tomcat\\images\\lesson"+File.separatorChar+name);
			
			Lesson le = new Lesson();
			
			Integer cid = new Integer(cateId);
			Integer num = new Integer(classNum);
			Integer tid = new Integer(techId);
			int classId = lesson.selectId();
			
			le.setTechId(tid);
			le.setClassName(lessName);
			le.setPrice(new Double(price));
			le.setClassNum(num);
			le.setPicture(name);
			le.setTechName(tName);
			le.setCateId(cid);
			le.setClassId(classId+1);
			le.setNumBuy(0);
			le.setNumLook(0);
			le.setStatus(Status.NORMAL.getStatus());
			lesson.insert(le);
			for (int i = 1; i <= num; i++) {
				Part video = request.getPart("video_"+i);
				logger.debug("增加课程{},{}",video.getSize(),video.getName());
				if(video == null || video.getSize() == 0 || video.getContentType() == null){
					request.setAttribute("status", false);
					return "lessonAdd";
				}
				String videoName = video.getSubmittedFileName();
				String type = videoName.substring(videoName.lastIndexOf("."));
				String url = TechUtil.fileName()+type;
				video.write("D:\\Tomcat\\images"+File.separatorChar+url);
				String chapterName = request.getParameter("chapter_"+i);
				Video v = new Video();
				v.setChapterName(chapterName);
				v.setClassId(classId+1);
				v.setPost(name);
				v.setSort(i);
				v.setUrl(url);
				videoService.insert(v);
			}
		} catch (Exception e) {
			logger.debug("增加课程错误{}",e);
			request.setAttribute("status", false);
			return "lessonAdd";
		}
			request.setAttribute("status", true);
		return "lessonAdd";
	}
	
	@RequestMapping("/addQuestion")
	public String addQuestion(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		if(admin == null){
			return "redirect:/adminlogin";
		}
		return "addQuestion";
	}
	
	/**
	 * 增加试题
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/addExam")
	public String addExam(HttpServletRequest request,HttpServletResponse response){
//		question cateId answer choiceA choiceB choiceC choiceD
		String question = request.getParameter("question");
		String cateId = request.getParameter("cateId");
		String answer = request.getParameter("answer");
		String choiceA = request.getParameter("choiceA");
		String choiceB = request.getParameter("choiceB");
		String choiceC = request.getParameter("choiceC");
		String choiceD = request.getParameter("choiceD");
		Question quest = new Question();
		quest.setAnswer(answer);
		quest.setChoiceA(choiceA);
		quest.setAnswer(answer);
		quest.setChoiceB(choiceB);
		quest.setChoiceC(choiceC);
		quest.setChoiceD(choiceD);
		quest.setTitle(question);
		try {
			quest.setTypeId(new Integer(cateId));
			questionService.insert(quest);
		} catch (Exception e) {
			// TODO: handle exception
			logger.debug("增加试题{}",e);
			request.setAttribute("operater", false);
			return "addQuestion";
		}	
		request.setAttribute("operater", true);
		return "addQuestion";
	}
	
}
