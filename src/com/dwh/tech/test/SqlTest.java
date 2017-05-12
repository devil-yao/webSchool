
package com.dwh.tech.test;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.dwh.tech.common.Status;
import com.dwh.tech.dao.CartDao;
import com.dwh.tech.entity.Cart;
import com.dwh.tech.entity.Lesson;
import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.PageResponse;
import com.dwh.tech.entity.User;
import com.dwh.tech.service.LessonService;
import com.dwh.tech.service.QuestionService;
import com.dwh.tech.service.UserService;

public class SqlTest extends BaseTest{
	
	@Resource
	private UserService service;
	@Resource
	private CartDao cartDao;
	@Resource
	private QuestionService qservice;
	
	@Resource
	private LessonService lessonService;
	
	@Test
	public void testBatch(){
		List<Integer> list = new ArrayList<>();
//		for (int i = 0; i < 100; i++) {
			list.add(1);
			list.add(1);
//		}
		qservice.selectBatch(list);
	}
	
	@Test
	public void sqlTest(){
		User user = new User();
		user.setLogin_name("dwh");
		user.setPassword("123456");
		user.setId(1);
		user.setAuthority(1);
		user.setSex("女");
		service.update(user);
		System.out.println(user.getId());
		System.out.println(service.getUser("dwh","123456"));
		System.out.println(service.check(null, "2"));
	}
	
	@Test
	public void cart(){
		List<Cart> carts = cartDao.select(1,null,1);
		System.out.println(carts);
	}
	
	@Test
	public void page(){
		PageRequest request = PageRequest.build(1, "");
		PageResponse<Lesson> resp = lessonService.getPage(request);
		System.out.println(resp);
	}
	@Test
	public void enumTest(){
		for (Status st : Status.values()) {
			System.out.println(st.toString());
		}
	}
	
}

