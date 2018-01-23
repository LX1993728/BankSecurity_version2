package com.anorng.bank.controller.page;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anorng.bank.service.TestService;

@Controller
public class TestController {
	
	@Autowired
	private TestService testService;
	
	@RequestMapping("/test")
	@ResponseBody
	public Object test() {
		Map<Object, Object> map = new HashMap<>();
		map.put("name", "刘勋");
		map.put("QQ", "2652790899");
		map.put("date", new Date());
		return map;
	}
	
	@RequestMapping("/index")
	public String index() {
		testService.test1();
		return "index";
	}
}
