package com.spiritgarage.www.admin.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.spiritgarage.www.admin.vo.MngrVO;
import com.spiritgarage.www.admin.vo.NoticeVO;
import com.spiritgarage.www.reservation.vo.MaintenanceAreaVO;
import com.spiritgarage.www.reservation.vo.ReservationVO;

public interface AdminService {

	Map<String, Object> loginValidation(MngrVO vo , HttpSession session) throws Exception;
	
	Map<String, Object> getMngrManagementList(MngrVO vo) throws Exception;
	
	boolean mngrAddIdDupCheck(MngrVO vo) throws Exception;
	
	boolean mngrAddNameDupCheck(MngrVO vo) throws Exception;
	
	boolean mngrAdd(MngrVO vo) throws Exception;
	
	MngrVO getMngrInfo(MngrVO vo) throws Exception;
	
	boolean mngrModify(MngrVO vo) throws Exception;
	
	boolean mngrUseModify(MngrVO vo) throws Exception;
	
	Map<String, Object> getMaintenanceAreaList(MaintenanceAreaVO vo) throws Exception;
	
	Map<String, Object> maintenanceAreaAdd(MaintenanceAreaVO vo) throws Exception;
	
	boolean maintenanceAreaDel(MaintenanceAreaVO vo) throws Exception;
	
	Map<String, Object> getReservationList(ReservationVO vo) throws Exception;
	
	List<Map<String, Object>> getCalendarReservationList(ReservationVO vo) throws Exception;
	
	ReservationVO getReservationInfo(ReservationVO vo) throws Exception;
	
	boolean reservationCancel(ReservationVO vo) throws Exception;
	
	boolean reservationRep(ReservationVO vo) throws Exception;
	
	Map<String, Object> getNoticeManagementList(NoticeVO vo) throws Exception;
	
	Map<String, Object> noticeImageUpload(MultipartFile upload , String folderName , String imageUploadPath , String baseUrl) throws Exception;
	
	Map<String, Object> noticeWrite(NoticeVO vo) throws Exception;
	
	Map<String, Object> getNoticeInfo(NoticeVO vo) throws Exception;
	
	Map<String, Object> noticeModify(NoticeVO vo) throws Exception;
	
	Map<String, Object> uptMainViewYn(NoticeVO vo) throws Exception;
}
