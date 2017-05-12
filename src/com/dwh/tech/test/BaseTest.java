package com.dwh.tech.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring/spring-servlet.xml"})
public class BaseTest {

	@Test
	public void test(){
		String s = "11";
		String str = "onclick='window.location.href="+"'"+"updateInfo?techId="+s+""+"'"+"' ";
		System.out.println(str);
	}
	
}
