package com.spiritgarage.www.main.mapper;

import java.util.List;

import com.spiritgarage.www.main.vo.BlogRssVO;

public interface MainMapper {
	
	List<BlogRssVO> selectBlogInfoList();
	
}
