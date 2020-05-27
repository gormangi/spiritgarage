package com.spiritgarage.www.category.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spiritgarage.www.category.mapper.CategoryMapper;
import com.spiritgarage.www.category.service.CategoryService;
import com.spiritgarage.www.category.vo.BlogRssVO;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryMapper mapper;

	@Override
	public List<String> getCategoryMenuList() throws Exception {
		return mapper.selectCategoryMenuList();
	}

	@Override
	public Map<String, Object> getCategoryList(BlogRssVO vo) throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		vo.setTotCnt(mapper.selectCategoryCnt(vo));
		
		result.put("list", mapper.selectCategoryList(vo));
		result.put("paging",vo);
		
		return result;
	}
	
}
