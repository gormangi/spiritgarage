package com.spiritgarage.www.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.spiritgarage.www.reservation.vo.MaintenanceAreaVO;
import com.spiritgarage.www.reservation.vo.ReservationVO;

public interface ReservationService {

	Map<String, Object> reservationImageUpload(MultipartFile upload , String folderName , String imageUploadPath , String baseUrl) throws Exception;
	
	boolean doReservation(ReservationVO vo) throws Exception;
	
	Map<String, Object> getMyResList(ReservationVO vo) throws Exception;
	
	ReservationVO getReservation(ReservationVO vo) throws Exception;
	
	boolean myResCancel(ReservationVO vo) throws Exception;
	
	List<MaintenanceAreaVO> getMaintenanceAreaList() throws Exception;
	
}
