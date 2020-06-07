package com.spiritgarage.www.maintenancehistory.service;

import java.util.Map;

import com.spiritgarage.www.admin.vo.MaintenanceHistoryVO;

public interface MaintenanceHistoryService {
	
	Map<String, Object> getMaintenanceHistoryList(MaintenanceHistoryVO vo) throws Exception;
	
	Map<String, Object> getMaintenanceHistoryInfo(MaintenanceHistoryVO vo) throws Exception;
	
}
