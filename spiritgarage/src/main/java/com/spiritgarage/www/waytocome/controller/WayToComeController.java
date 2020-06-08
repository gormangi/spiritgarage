package com.spiritgarage.www.waytocome.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WayToComeController {
	
	@RequestMapping(value = "/wayToCome")
	public String wayToCome(Model model , HttpServletRequest request , HttpServletResponse response) throws Exception{
		model.addAttribute("viewDivision","wayToComePage");
		return "user/way_to_come";
	}
	
}
