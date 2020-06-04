package com.spiritgarage.www.main.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spiritgarage.www.main.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping("/")
	public String main(Model model , HttpServletRequest request , HttpServletResponse respones) throws Exception{
		model.addAttribute("viewDivision","mainPage");
		return "user/main";
	}
	
	@RequestMapping("/main/headerInfo")
	@ResponseBody
	public Map<String, Object> headerInfo(HttpServletRequest request , HttpServletResponse respones) throws Exception{
		return service.getHeaderInfo();
	}
	
	@RequestMapping("/main/getBlogInfoList")
	@ResponseBody
	public Map<String, Object> getBlogInfoList(HttpServletRequest request , HttpServletResponse respones) throws Exception{
		return service.getBlogInfoList();
	}
	
	@RequestMapping(value = "/main/getMainNoticeList")
	@ResponseBody
	public Map<String, Object> getMainNoticeList(HttpServletRequest request , HttpServletResponse respones) throws Exception{
		return service.getMainNoticeList();
	}
	
	@RequestMapping(value = "/main/getMainFooter")
	@ResponseBody
	public Map<String, Object> getMainFooter(HttpServletRequest request , HttpServletResponse respones) throws Exception{
		return service.getMainFooter();
	}
	
}
