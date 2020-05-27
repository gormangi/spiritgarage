package com.spiritgarage.www.category.mapper;

import java.util.List;

import com.spiritgarage.www.category.vo.BlogRssVO;

public interface CategoryMapper {
	
	List<String> selectCategoryMenuList() throws Exception;
	
	int selectCategoryCnt(BlogRssVO vo) throws Exception;
	
	List<BlogRssVO> selectCategoryList(BlogRssVO vo) throws Exception;
	
}
