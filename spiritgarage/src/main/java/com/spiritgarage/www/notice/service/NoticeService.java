package com.spiritgarage.www.notice.service;

import java.util.Map;

import com.spiritgarage.www.notice.vo.NoticeVO;

public interface NoticeService {

	public Map<String, Object> getNoticeList(NoticeVO vo) throws Exception;
	
	public NoticeVO getNoticeInfo(NoticeVO vo) throws Exception;
	
}
