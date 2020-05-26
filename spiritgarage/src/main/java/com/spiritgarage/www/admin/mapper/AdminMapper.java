package com.spiritgarage.www.admin.mapper;

import java.util.List;
import java.util.Map;

import com.spiritgarage.www.admin.vo.FileVO;
import com.spiritgarage.www.admin.vo.MngrVO;
import com.spiritgarage.www.admin.vo.NoticeVO;
import com.spiritgarage.www.reservation.vo.MaintenanceAreaVO;
import com.spiritgarage.www.reservation.vo.ReservationVO;

public interface AdminMapper {

	MngrVO selectMngrInfo(MngrVO vo) throws Exception;
	
	int selectMngrManagementCnt(MngrVO vo) throws Exception;
	
	List<MngrVO> selectMngrManagementList(MngrVO vo) throws Exception;
	
	int selectMngrIdCount(MngrVO vo) throws Exception;
	
	int selectMngrNameCount(MngrVO vo) throws Exception;
	
	int insertMngr(MngrVO vo) throws Exception;
	
	MngrVO selectMngrInfoByMngrSeq(MngrVO vo) throws Exception;
	
	int updateMngr(MngrVO vo) throws Exception;
	
	int updateMngrUseYn(MngrVO vo) throws Exception;
	
	int selectMaintenanceAreaCnt(MaintenanceAreaVO vo) throws Exception;
	
	List<MaintenanceAreaVO> selectMaintenanceAreaList(MaintenanceAreaVO vo) throws Exception;
	
	MaintenanceAreaVO selectMaintenanceAreaByName(MaintenanceAreaVO vo) throws Exception;
	
	int insertMaintenanceArea(MaintenanceAreaVO vo) throws Exception;
	
	int deleteMaintenanceArea(MaintenanceAreaVO vo) throws Exception;
	
	int selectReservationCnt(ReservationVO vo) throws Exception;
	
	List<ReservationVO> selectReservationList(ReservationVO vo) throws Exception;
	
	List<Map<String, Object>> selectCalendarReservationList(ReservationVO vo) throws Exception;
	
	ReservationVO selectReservationInfo(ReservationVO vo) throws Exception;
	
	int updateReservationCancel(ReservationVO vo) throws Exception;
	
	int updateReservationRep(ReservationVO vo) throws Exception;
	
	int selectNoticeManagementCnt(NoticeVO vo) throws Exception;
	
	List<NoticeVO> selectNoticeManagementList(NoticeVO vo) throws Exception;
	
	int insertNotice(NoticeVO vo) throws Exception;
	
	int insertThumbnailFile(FileVO vo) throws Exception;
	
	NoticeVO selectNoticeInfo(NoticeVO vo) throws Exception;
	
	FileVO selectFileInfoByNoticeSeq(NoticeVO vo) throws Exception;
	
	int updateNotice(NoticeVO vo) throws Exception;
	
	int deleteFileInfoByNoticeSeq(NoticeVO vo) throws Exception;
	
	int updateMainViewYn(NoticeVO vo) throws Exception;
	
	int selectNoticeMainViewYCnt() throws Exception;
	
	int deleteNotice(NoticeVO vo) throws Exception;
	
}
