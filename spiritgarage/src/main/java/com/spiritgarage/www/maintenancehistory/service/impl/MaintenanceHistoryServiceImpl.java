package com.spiritgarage.www.maintenancehistory.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spiritgarage.www.admin.vo.MaintenanceHistoryVO;
import com.spiritgarage.www.maintenancehistory.mapper.MaintenanceHistoryMapper;
import com.spiritgarage.www.maintenancehistory.service.MaintenanceHistoryService;

@Service
public class MaintenanceHistoryServiceImpl implements MaintenanceHistoryService{
	
	@Autowired
	private MaintenanceHistoryMapper mapper;

	@Override
	public Map<String, Object> getMaintenanceHistoryList(MaintenanceHistoryVO vo) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		vo.setTotCnt(mapper.selectMaintenanceHistoryCnt(vo));
		
		result.put("list", mapper.selectMaintenanceHistoryList(vo));
		result.put("paging", vo);
		
		return result;
	}

	@Override
	public Map<String, Object> getMaintenanceHistoryInfo(MaintenanceHistoryVO vo) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("maintenanceHistoryInfo", mapper.selectMaintenanceHistoryInfo(vo));
		result.put("maintenanceHistoryDetailList", mapper.selectMaintenanceHistoryDetailList(vo));
		
		return result;
	}
	
}
