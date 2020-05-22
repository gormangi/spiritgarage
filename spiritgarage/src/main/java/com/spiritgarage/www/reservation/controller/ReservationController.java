package com.spiritgarage.www.reservation.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spiritgarage.www.reservation.service.ReservationService;
import com.spiritgarage.www.reservation.vo.MaintenanceAreaVO;
import com.spiritgarage.www.reservation.vo.ReservationVO;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	@RequestMapping(value = "/reservation")
	public String reservation(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return "user/reservation";
	}
	
	@RequestMapping(value = "/reservation/reservationImageUpload")
	@ResponseBody
	public Map<String, Object> reservationImageUpload(HttpServletRequest request , HttpServletResponse response , @RequestParam MultipartFile upload) throws Exception{
		String folderName = "user_images";
		String imageUploadPath = request.getSession().getServletContext().getRealPath("/") + folderName + File.separator;
		String baseUrl = request.getRequestURL().toString().replace(request.getRequestURI().toString(),"");
		return service.reservationImageUpload(upload , folderName , imageUploadPath , baseUrl);
	}
	
	@RequestMapping(value = "/reservation/doReservation")
	@ResponseBody
	public boolean doReservation(ReservationVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.doReservation(vo);
	}
	
	@RequestMapping(value = "/reservationConfirm")
	public String reservationConfirm(ReservationVO vo , Model model , HttpServletRequest request , HttpServletResponse response) throws Exception{
		model.addAttribute("reservationName",vo.getReservationName());
		model.addAttribute("phone",vo.getPhone());
		return "user/reservation_confirm";
	}
	
	@RequestMapping(value = "/reservation/getMyResList")
	@ResponseBody
	public Map<String, Object> getMyResList(ReservationVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getMyResList(vo);
	}
	
	@RequestMapping(value = "/reservation/getMyResContent")
	@ResponseBody
	public ReservationVO getMyResContent(ReservationVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getReservation(vo);
	}
	
	@RequestMapping(value = "/reservation/myResCancel")
	@ResponseBody
	public boolean myResCancel(ReservationVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.myResCancel(vo);
	}
	
	@RequestMapping(value = "/reservation/getMaintenanceAreaList")
	@ResponseBody
	public List<MaintenanceAreaVO> getMaintenanceAreaList(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getMaintenanceAreaList();
	}
}
