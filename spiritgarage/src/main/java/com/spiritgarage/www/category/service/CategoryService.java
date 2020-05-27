package com.spiritgarage.www.category.service;

import java.util.List;
import java.util.Map;

import com.spiritgarage.www.category.vo.BlogRssVO;

public interface CategoryService {
	
	public List<String> getCategoryMenuList() throws Exception;
	
	public Map<String, Object> getCategoryList(BlogRssVO vo) throws Exception;
	
}
