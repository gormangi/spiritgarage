package com.spiritgarage.www.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spiritgarage.www.admin.service.AdminService;
import com.spiritgarage.www.admin.vo.MainSlideVO;
import com.spiritgarage.www.admin.vo.MaintenanceHistoryDetailVO;
import com.spiritgarage.www.admin.vo.MaintenanceHistoryVO;
import com.spiritgarage.www.admin.vo.MngrVO;
import com.spiritgarage.www.admin.vo.NoticeVO;
import com.spiritgarage.www.category.vo.BlogCategoryVO;
import com.spiritgarage.www.main.vo.MainFooterVO;
import com.spiritgarage.www.reservation.vo.MaintenanceAreaVO;
import com.spiritgarage.www.reservation.vo.ReservationVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping(value = "/admin")
	public String login(HttpServletRequest request , HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		if((MngrVO)session.getAttribute("mngrInfo") != null) {
			return "redirect:/admin/mngrManagement";
		}else {
			return ".login";
		}
	}
	
	@RequestMapping(value = "/admin/loginValidation")
	@ResponseBody
	public Map<String, Object> loginValidation(MngrVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		return service.loginValidation(vo,session);
	}
	
	@RequestMapping(value = "/admin/logout")
	public String logout(HttpServletRequest request , HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		session.removeAttribute("mngrInfo");
		return "redirect:/admin";
	}
	
	@RequestMapping(value = "/admin/mngrManagement")
	public String mngrManagement(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return "admin/mngr_management";
	}
	
	@RequestMapping(value = "/admin/getMngrManagementList")
	@ResponseBody
	public Map<String, Object> getMngrManagementList(MngrVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getMngrManagementList(vo);
	}
	
	@RequestMapping(value = "/admin/mngrAddIdDupCheck")
	@ResponseBody
	public boolean mngrAddIdDupCheck(MngrVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.mngrAddIdDupCheck(vo);
	}
	
	@RequestMapping(value = "/admin/mngrAddNameDupCheck")
	@ResponseBody
	public boolean mngrAddNameDupCheck(MngrVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.mngrAddNameDupCheck(vo);
	}
	
	@RequestMapping(value = "/admin/mngrAdd")
	@ResponseBody
	public boolean mngrAdd(MngrVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.mngrAdd(vo);
	}
	
	@RequestMapping(value = "/admin/getMngrInfo")
	@ResponseBody
	public MngrVO getMngrInfo(MngrVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getMngrInfo(vo);
	}
	
	@RequestMapping(value = "/admin/mngrModify")
	@ResponseBody
	public boolean mngrModify(MngrVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.mngrModify(vo);
	}
	
	@RequestMapping(value = "/admin/mngrUseModify")
	@ResponseBody
	public boolean mngrUseModify(MngrVO vo, HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.mngrUseModify(vo);
	}
	
	@RequestMapping(value = "/admin/reservationManagement")
	public String reservationManagement(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return "admin/reservation_management";
	}
	
	@RequestMapping(value = "/admin/getMaintenanceAreaList")
	@ResponseBody
	public Map<String, Object> getMaintenanceAreaList(MaintenanceAreaVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getMaintenanceAreaList(vo);
	}
	
	@RequestMapping(value = "/admin/maintenanceAreaAdd")
	@ResponseBody
	public Map<String, Object> maintenanceAreaAdd(MaintenanceAreaVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.maintenanceAreaAdd(vo);
	}
	
	@RequestMapping(value = "/admin/maintenanceAreaDel")
	@ResponseBody
	public boolean maintenanceAreaDel(MaintenanceAreaVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.maintenanceAreaDel(vo);
	}
	
	@RequestMapping(value = "/admin/getReservationList")
	@ResponseBody
	public Map<String, Object> getReservationList(ReservationVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getReservationList(vo);
	}
	
	@RequestMapping(value = "/admin/getCalendarReservationList")
	@ResponseBody
	public List<Map<String, Object>> getCalendarReservationList(ReservationVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getCalendarReservationList(vo);
	}
	
	@RequestMapping(value = "/admin/getReservationInfo")
	@ResponseBody
	public ReservationVO reservationInfo(ReservationVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getReservationInfo(vo);
	}
	
	@RequestMapping(value = "/admin/reservationCancel")
	@ResponseBody
	public boolean reservationCancel(ReservationVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.reservationCancel(vo);
	}
	
	@RequestMapping(value = "/admin/reservationRep")
	@ResponseBody
	public boolean reservationRep(ReservationVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.reservationRep(vo);
	}
	
	@RequestMapping(value = "/admin/noticeManagement")
	public String noticeManagement(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return "admin/notice_management";
	}
	
	@RequestMapping(value = "/admin/getNoticeManagementList")
	@ResponseBody
	public Map<String, Object> getNoticeManagementList(NoticeVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getNoticeManagementList(vo);
	}
	
	@RequestMapping(value = "/admin/noticeReg")
	public String noticeReg(Model model , HttpServletRequest request , HttpServletResponse response) throws Exception{
		model.addAttribute("rMod","N");
		return "admin/notice_reg";
	}
	
	@RequestMapping(value = "/admin/noticeImageUpload")
	@ResponseBody
	public Map<String, Object> noticeImageUpload(HttpServletRequest request , HttpServletResponse response , @RequestParam MultipartFile upload) throws Exception{
		String folderName = "user_images";
		String imageUploadPath = request.getSession().getServletContext().getRealPath("/") + folderName + File.separator;
		String baseUrl = request.getRequestURL().toString().replace(request.getRequestURI().toString(),"");
		return service.noticeImageUpload(upload , folderName , imageUploadPath , baseUrl);
	}
	
	@RequestMapping(value = "/admin/noticeWrite")
	@ResponseBody
	public Map<String, Object> noticeWrite(NoticeVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MngrVO mngrInfo = (MngrVO)session.getAttribute("mngrInfo");
		vo.setRegMngrId(mngrInfo.getId());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String dateFolderName = format.format(today);
		String folderName = "user_images";
		vo.setDateFolderName(dateFolderName);
		vo.setFolderName(folderName);
		vo.setThumbnailUploadPath(request.getSession().getServletContext().getRealPath("/") + folderName + File.separator + dateFolderName + File.separator);
		vo.setBaseUrl(request.getRequestURL().toString().replace(request.getRequestURI().toString(),""));
		return service.noticeWrite(vo);
	}
	
	@RequestMapping(value = "/admin/noticeModify")
	public String noticeModify(Model model , NoticeVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		model.addAttribute("rMod","U");
		model.addAttribute("noticeSeq",vo.getNoticeSeq());
		return "admin/notice_reg";
	}
	
	@RequestMapping(value = "/admin/getNoticeInfo")
	@ResponseBody
	public Map<String, Object> getNoticeInfo(NoticeVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getNoticeInfo(vo);
	}
	
	@RequestMapping(value = "/admin/doNoticeModify")
	@ResponseBody
	public Map<String, Object> doNoticeModify(NoticeVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MngrVO mngrInfo = (MngrVO)session.getAttribute("mngrInfo");
		vo.setRegMngrId(mngrInfo.getId());
		vo.setUptMngrId(mngrInfo.getId());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String dateFolderName = format.format(today);
		String folderName = "user_images";
		vo.setDateFolderName(dateFolderName);
		vo.setFolderName(folderName);
		vo.setThumbnailUploadPath(request.getSession().getServletContext().getRealPath("/") + folderName + File.separator + dateFolderName + File.separator);
		vo.setBaseUrl(request.getRequestURL().toString().replace(request.getRequestURI().toString(),""));
		return service.noticeModify(vo);
	}
	
	@RequestMapping(value = "/admin/uptMainViewYn")
	@ResponseBody
	public Map<String, Object> uptMainViewYn(NoticeVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.uptMainViewYn(vo);
	}
	
	@RequestMapping(value = "/admin/noticeDel")
	@ResponseBody
	public Map<String, Object> noticeDel(NoticeVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.noticeDel(vo);
	}
	
	@RequestMapping(value = "/admin/mainViewManagement")
	public String mainViewManagement(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return "admin/main_view_management";
	}
	
	@RequestMapping(value = "/admin/getMainSlideList")
	@ResponseBody
	public Map<String, Object> getMainSlideList(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getMainSlideList();
	}
	
	@RequestMapping(value = "/admin/mainSlideWrite")
	@ResponseBody
	public Map<String, Object> mainSlideWrite(MainSlideVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MngrVO mngrInfo = (MngrVO)session.getAttribute("mngrInfo");
		vo.setRegMngrId(mngrInfo.getId());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String dateFolderName = format.format(today);
		String folderName = "user_images";
		vo.setDateFolderName(dateFolderName);
		vo.setFolderName(folderName);
		vo.setBannerUploadPath(request.getSession().getServletContext().getRealPath("/") + folderName + File.separator + dateFolderName + File.separator);
		vo.setBaseUrl(request.getRequestURL().toString().replace(request.getRequestURI().toString(),""));
		return service.mainSlideWrite(vo);
		
	}
	
	@RequestMapping(value = "/admin/getMainSlideInfo")
	@ResponseBody
	public MainSlideVO getMainSlideInfo(MainSlideVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getMainSlideInfo(vo);
	}
	
	@RequestMapping(value = "/admin/mainSlideModify")
	@ResponseBody
	public Map<String, Object> mainSlideModify(MainSlideVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MngrVO mngrInfo = (MngrVO)session.getAttribute("mngrInfo");
		vo.setRegMngrId(mngrInfo.getId());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String dateFolderName = format.format(today);
		String folderName = "user_images";
		vo.setDateFolderName(dateFolderName);
		vo.setFolderName(folderName);
		vo.setBannerUploadPath(request.getSession().getServletContext().getRealPath("/") + folderName + File.separator + dateFolderName + File.separator);
		vo.setBaseUrl(request.getRequestURL().toString().replace(request.getRequestURI().toString(),""));
		return service.mainSlideModify(vo);
	}
	
	@RequestMapping(value = "/admin/mainSlideDelete")
	@ResponseBody
	public Map<String, Object> mainSlideDelete(MainSlideVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.mainSlideDelete(vo);
	}
	
	@RequestMapping(value = "/admin/mainSlideOrderModify")
	@ResponseBody
	public Map<String, Object> mainSlideOrderModify(MainSlideVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.mainSlideOrderModify(vo);
	}
	
	@RequestMapping(value = "/admin/getCategoryList")
	@ResponseBody
	public Map<String, Object> getCategoryList(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getCategoryList();
	}
	
	@RequestMapping(value = "/admin/uptCategoryDisplayYn")
	@ResponseBody
	public Map<String, Object> uptCategoryDisplayYn(BlogCategoryVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.uptCategoryDisplayYn(vo);
	}
	
	@RequestMapping(value = "/admin/footerContactSave")
	@ResponseBody
	public Map<String, Object> footerContactSave(MainFooterVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.footerContactSave(vo);
	}
	
	@RequestMapping(value = "/admin/getMainFooter")
	@ResponseBody
	public Map<String, Object> getMainFooter(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getMainFooter();
	}
	
	@RequestMapping(value = "/admin/footerOpenhourSave")
	@ResponseBody
	public Map<String, Object> footerOpenhourSave(MainFooterVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.footerOpenhourSave(vo);
	}
	
	@RequestMapping(value = "/admin/footerMainfieldSave")
	@ResponseBody
	public Map<String, Object> footerMainfieldSave(MainFooterVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.footerMainfieldSave(vo);
	}
	
	@RequestMapping(value = "/admin/maintenanceHistoryManagement")
	public String maintenanceHistoryManagement(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return "admin/maintenance_history_management";
	}
	
	@RequestMapping(value = "/admin/getMaintenanceHistoryList")
	@ResponseBody
	public Map<String, Object> getMaintenanceHistoryList(MaintenanceHistoryVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getMaintenanceHistoryList(vo);
	}
	
	@RequestMapping(value = "/admin/maintenanceHistoryReg")
	public String maintenanceHistoryReg(Model model , HttpServletRequest request , HttpServletResponse response) throws Exception{
		model.addAttribute("rMod","N");
		return "admin/maintenance_history_reg";
	}
	
	@RequestMapping(value = "/admin/saveMaintenanceHistory")
	@ResponseBody
	public Map<String, Object> saveMaintenanceHistory(MaintenanceHistoryVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MngrVO mngrInfo = (MngrVO)session.getAttribute("mngrInfo");
		vo.setRegMngrId(mngrInfo.getId());
		return service.saveMaintenanceHistory(vo);
	}
	
	@RequestMapping(value = "/admin/saveMaintenanceHistoryDetail")
	@ResponseBody
	public Map<String, Object> saveMaintenanceHistoryDetail(MaintenanceHistoryDetailVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.saveMaintenanceHistoryDetail(vo);
	}
	
	@RequestMapping(value = "/admin/maintenanceHistoryModify")
	public String maintenanceHistoryModify(Model model , MaintenanceHistoryVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		model.addAttribute("rMod","U");
		model.addAttribute("maintenanceHistorySeq",vo.getMaintenanceHistorySeq());
		return "admin/maintenance_history_reg";
	}
	
	@RequestMapping(value = "/admin/getMaintenanceHistoryInfo")
	@ResponseBody
	public Map<String, Object> getMaintenanceHistoryInfo(MaintenanceHistoryVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.getMaintenanceHistoryInfo(vo);
	}
	
	@RequestMapping(value = "/admin/maintenanceHistoryModifyDo")
	@ResponseBody
	public Map<String, Object> maintenanceHistoryModifyDo(MaintenanceHistoryVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MngrVO mngrInfo = (MngrVO)session.getAttribute("mngrInfo");
		vo.setUptMngrId(mngrInfo.getId());
		return service.maintenanceHistoryModifyDo(vo);
	}
	
	@RequestMapping(value = "/admin/delMaintenanceHistoryDetail")
	@ResponseBody
	public Map<String, Object> delMaintenanceHistoryDetail(MaintenanceHistoryVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.delMaintenanceHistoryDetail(vo);
	}
	
	@RequestMapping(value = "/admin/maintenanceHistoryDelete")
	@ResponseBody
	public Map<String, Object> maintenanceHistoryDelete(MaintenanceHistoryVO vo , HttpServletRequest request , HttpServletResponse response) throws Exception{
		return service.maintenanceHistoryDelete(vo);
	}
}
