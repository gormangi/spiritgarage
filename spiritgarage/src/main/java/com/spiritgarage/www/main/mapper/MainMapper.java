package com.spiritgarage.www.main.mapper;

import java.util.List;

import com.spiritgarage.www.admin.vo.MainSlideVO;
import com.spiritgarage.www.admin.vo.NoticeVO;
import com.spiritgarage.www.category.vo.BlogCategoryVO;
import com.spiritgarage.www.main.vo.BlogRssVO;
import com.spiritgarage.www.main.vo.MainFooterVO;

public interface MainMapper {
	
	List<BlogRssVO> selectBlogInfoList();
	
	List<NoticeVO> selectMainNoticeList();
	
	List<MainSlideVO> selectMainSlideList();
	
	List<BlogCategoryVO> selectCategoryDisplayY();
	
	List<MainFooterVO> selectMainFooterList();
	
}
