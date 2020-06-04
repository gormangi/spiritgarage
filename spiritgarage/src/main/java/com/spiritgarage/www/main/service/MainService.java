package com.spiritgarage.www.main.service;

import java.util.Map;

public interface MainService {
	
	Map<String, Object> getHeaderInfo();
	
	Map<String, Object> getBlogInfoList();
	
	Map<String, Object> getMainNoticeList();
	
	Map<String, Object> getMainFooter();
	
}
