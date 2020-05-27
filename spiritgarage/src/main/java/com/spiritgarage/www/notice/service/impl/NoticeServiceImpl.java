package com.spiritgarage.www.notice.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spiritgarage.www.notice.mapper.NoticeMapper;
import com.spiritgarage.www.notice.service.NoticeService;
import com.spiritgarage.www.notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper mapper;

	@Override
	public Map<String, Object> getNoticeList(NoticeVO vo) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		vo.setTotCnt(mapper.selectNoticeCnt(vo));
		
		result.put("list", mapper.selectNoticeList(vo));
		result.put("paging", vo);
		
		return result;
	}

	@Override
	public NoticeVO getNoticeInfo(NoticeVO vo) throws Exception {
		return mapper.selectNoticeInfo(vo);
	}
	
}
