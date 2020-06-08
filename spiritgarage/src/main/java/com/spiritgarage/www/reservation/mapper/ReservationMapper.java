package com.spiritgarage.www.reservation.mapper;

import java.util.List;

import com.spiritgarage.www.admin.vo.ReservationNotPossibleVO;
import com.spiritgarage.www.reservation.vo.MaintenanceAreaVO;
import com.spiritgarage.www.reservation.vo.ReservationVO;

public interface ReservationMapper {
	
	List<ReservationNotPossibleVO> selectReservationNotPossible(ReservationVO vo) throws Exception;

	int insertReservation(ReservationVO vo) throws Exception;
	
	int selectMyResCnt(ReservationVO vo) throws Exception;
	
	List<ReservationVO> selectMyResList(ReservationVO vo) throws Exception;
	
	ReservationVO selectReservation(ReservationVO vo) throws Exception;
	
	int updateMyResCancel(ReservationVO vo) throws Exception;
	
	List<MaintenanceAreaVO> selectMaintenanceAreaList() throws Exception;
	
}
