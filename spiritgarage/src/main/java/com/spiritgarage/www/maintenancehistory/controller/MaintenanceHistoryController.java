package com.spiritgarage.www.maintenancehistory.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spiritgarage.www.admin.vo.MaintenanceHistoryVO;
import com.spiritgarage.www.maintenancehistory.service.MaintenanceHistoryService;

@Controller
public class MaintenanceHistoryController {
	
	@Autowired
	private MaintenanceHistoryService service;

	@RequestMapping(value = "/maintenanceHistory")
	public String maintenanceHistory(Model model , MaintenanceHistoryVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		model.addAttribute("viewDivision","maintenanceHistoryPage");
		model.addAttribute("phone",vo.getPhone());
		model.addAttribute("carRegNum",vo.getCarRegNum());
		return "user/maintenance_history";
	}
	
	@RequestMapping(value = "/maintenanceHistory/getMaintenanceHistoryList")
	@ResponseBody
	public Map<String, Object> getMaintenanceHistoryList(MaintenanceHistoryVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getMaintenanceHistoryList(vo);
	}
	
	@RequestMapping(value = "/maintenanceHistoryDetail")
	public String maintenanceHistoryDetail(MaintenanceHistoryVO vo , Model model , HttpServletRequest request , HttpServletResponse response) throws Exception{
		model.addAttribute("maintenanceHistorySeq",vo.getMaintenanceHistorySeq());
		model.addAttribute("phone",vo.getPhone());
		model.addAttribute("carRegNum",vo.getCarRegNum());
		model.addAttribute("viewDivision","maintenanceHistoryPage");
		return "user/maintenance_history_detail";
	}
	
	@RequestMapping(value = "/maintenanceHistory/getMaintenanceHistoryInfo")
	@ResponseBody
	public Map<String, Object> getMaintenanceHistoryInfo(MaintenanceHistoryVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getMaintenanceHistoryInfo(vo);
	}
}
