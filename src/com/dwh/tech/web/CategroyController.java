package com.dwh.tech.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.dwh.tech.entity.Categroy;
import com.dwh.tech.service.CategroyService;

@Controller
public class CategroyController {

	private final Logger logger = LoggerFactory.getLogger(CategroyController.class);
	
	@Resource
	private CategroyService cateService;
	
	@RequestMapping("/getCate")
	public void selectCate(HttpServletResponse response) throws IOException{
		logger.debug("查询所有类别");
		List<Categroy> list = cateService.selectAll();
		PrintWriter out = response.getWriter();
		out.write(JSON.toJSONString(list));
		out.flush();
		out.close();
	}
	
}
