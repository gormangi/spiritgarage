package com.spiritgarage.www.main.service;

import java.util.Map;

import com.spiritgarage.www.main.vo.HeaderVO;

public interface MainService {
	
	HeaderVO getHeaderInfo();
	
	Map<String, Object> getBlogInfoList();
	
	Map<String, Object> getMainNoticeList();
	
}
