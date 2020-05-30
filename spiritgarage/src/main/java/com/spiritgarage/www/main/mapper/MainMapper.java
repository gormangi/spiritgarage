package com.spiritgarage.www.main.mapper;

import java.util.List;

import com.spiritgarage.www.admin.vo.MainSlideVO;
import com.spiritgarage.www.admin.vo.NoticeVO;
import com.spiritgarage.www.main.vo.BlogRssVO;

public interface MainMapper {
	
	List<BlogRssVO> selectBlogInfoList();
	
	List<NoticeVO> selectMainNoticeList();
	
	List<MainSlideVO> selectMainSlideList();
	
}
