package com.spiritgarage.www.admin.mapper;

import java.util.List;
import java.util.Map;

import com.spiritgarage.www.admin.vo.FileVO;
import com.spiritgarage.www.admin.vo.MainSlideVO;
import com.spiritgarage.www.admin.vo.MaintenanceHistoryDetailVO;
import com.spiritgarage.www.admin.vo.MaintenanceHistoryVO;
import com.spiritgarage.www.admin.vo.MngrVO;
import com.spiritgarage.www.admin.vo.NoticeVO;
import com.spiritgarage.www.admin.vo.ReservationNotPossibleVO;
import com.spiritgarage.www.category.vo.BlogCategoryVO;
import com.spiritgarage.www.main.vo.MainFooterVO;
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
	
	List<MainSlideVO> selectMainSlideList() throws Exception;
	
	int insertMainSlide(MainSlideVO vo) throws Exception;
	
	MainSlideVO selectMainSlideInfo(MainSlideVO vo) throws Exception;
	
	int updateMainSlide(MainSlideVO vo) throws Exception;
	
	FileVO selectFileInfoByMainSlideSeq(MainSlideVO vo) throws Exception;
	
	int deleteFileInfoByMainSlideSeq(MainSlideVO vo) throws Exception;
	
	int insertBannerFile(FileVO vo) throws Exception;
	
	int deleteMainSlideByMainSlideSeq(MainSlideVO vo) throws Exception;
	
	List<MainSlideVO> selectMainSlideOrderList() throws Exception;
	
	int updateMainSlideOrder(MainSlideVO vo) throws Exception;
	
	MainSlideVO selectOrderUpMainSlide(MainSlideVO vo) throws Exception;
	
	MainSlideVO selectOrderMeMainSlide(MainSlideVO vo) throws Exception;
	
	MainSlideVO selectOrderDownMainSlide(MainSlideVO vo) throws Exception;
	
	int updateOrderDownMainSlide(MainSlideVO vo) throws Exception;
	
	int updateOrderUpMainSlide(MainSlideVO vo) throws Exception;
	
	List<BlogCategoryVO> selectCategoryList() throws Exception;
	
	int updateCategoryDisplayYn(BlogCategoryVO vo) throws Exception;
	
	MainFooterVO selectMainFooterContactLocation(MainFooterVO vo) throws Exception;
	
	MainFooterVO selectMainFooterContactMobile(MainFooterVO vo) throws Exception;
	
	MainFooterVO selectMainFooterContactPhone(MainFooterVO vo) throws Exception;
	
	int updateMainFooter(MainFooterVO vo) throws Exception;
	
	int insertMainFooter(MainFooterVO vo) throws Exception;
	
	List<MainFooterVO> selectMainFooterList() throws Exception;
	
	MainFooterVO selectMainFooterOpenhour(MainFooterVO vo) throws Exception;
	
	MainFooterVO selectMainFooterMainfield(MainFooterVO vo) throws Exception;
	
	int selectMaintenanceHistoryCnt(MaintenanceHistoryVO vo) throws Exception;
	
	List<MaintenanceHistoryVO> selectMaintenanceHistoryList(MaintenanceHistoryVO vo) throws Exception;
	
	int insertMaintenanceHistory(MaintenanceHistoryVO vo) throws Exception;
	
	int insertMaintenanceHistoryDetail(MaintenanceHistoryDetailVO vo) throws Exception;
	
	MaintenanceHistoryVO selectMaintenanceHistoryInfo(MaintenanceHistoryVO vo) throws Exception;
	
	List<MaintenanceHistoryDetailVO> selectMaintenanceHistoryDetailList(MaintenanceHistoryVO vo) throws Exception;
	
	int updateMaintenanceHistory(MaintenanceHistoryVO vo) throws Exception;
	
	int deleteMaintenanceHistoryDetail(MaintenanceHistoryVO vo) throws Exception;
	
	int deleteMaintenanceHistory(MaintenanceHistoryVO vo) throws Exception;
	
	List<ReservationNotPossibleVO> selectReservationNotPossibleList() throws Exception;
	
	int insertReservationNotPossible(ReservationNotPossibleVO vo) throws Exception;
	
	int deleteReservationNotPossDel(ReservationNotPossibleVO vo) throws Exception;
	
}
