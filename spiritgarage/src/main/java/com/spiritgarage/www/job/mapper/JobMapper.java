package com.spiritgarage.www.job.mapper;

import java.util.List;

import com.spiritgarage.www.category.vo.BlogCategoryVO;
import com.spiritgarage.www.main.vo.BlogRssVO;

public interface JobMapper {

	List<BlogRssVO> selectRssInfoList();
	
	int insertRssInfo(BlogRssVO vo);
	
	List<BlogCategoryVO> selectRssCategoryList();
	
	int insertRssCategory(BlogCategoryVO vo);
}
