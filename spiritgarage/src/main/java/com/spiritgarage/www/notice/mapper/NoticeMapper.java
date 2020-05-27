package com.spiritgarage.www.notice.mapper;

import java.util.List;

import com.spiritgarage.www.notice.vo.NoticeVO;

public interface NoticeMapper {

	int selectNoticeCnt(NoticeVO vo) throws Exception;
	
	List<NoticeVO> selectNoticeList(NoticeVO vo) throws Exception;
	
	NoticeVO selectNoticeInfo(NoticeVO vo) throws Exception;
	
}
