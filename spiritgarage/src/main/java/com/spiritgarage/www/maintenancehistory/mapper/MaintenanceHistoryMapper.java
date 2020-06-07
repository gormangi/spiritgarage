package com.spiritgarage.www.maintenancehistory.mapper;

import java.util.List;

import com.spiritgarage.www.admin.vo.MaintenanceHistoryDetailVO;
import com.spiritgarage.www.admin.vo.MaintenanceHistoryVO;

public interface MaintenanceHistoryMapper {
	
	int selectMaintenanceHistoryCnt(MaintenanceHistoryVO vo) throws Exception;
	
	List<MaintenanceHistoryVO> selectMaintenanceHistoryList(MaintenanceHistoryVO vo) throws Exception;
	
	MaintenanceHistoryVO selectMaintenanceHistoryInfo(MaintenanceHistoryVO vo) throws Exception;
	
	List<MaintenanceHistoryDetailVO> selectMaintenanceHistoryDetailList(MaintenanceHistoryVO vo) throws Exception;
	
}
