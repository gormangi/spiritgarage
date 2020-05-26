package com.spiritgarage.www.category.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spiritgarage.www.category.service.CategoryService;
import com.spiritgarage.www.main.vo.BlogRssVO;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
	@RequestMapping(value = "/category/getCategoryMenuList")
	@ResponseBody
	public List<String> getCategoryMenuList(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getCategoryMenuList();
	}
	
	@RequestMapping(value = "/category")
	public String categoryListView(Model model , BlogRssVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		model.addAttribute("viewDivision","categoryPage");
		model.addAttribute("category",vo.getCategory());
		return "user/category_list";
	}
	
}
