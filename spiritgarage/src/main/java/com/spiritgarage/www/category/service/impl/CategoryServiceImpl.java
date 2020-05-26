package com.spiritgarage.www.category.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spiritgarage.www.category.mapper.CategoryMapper;
import com.spiritgarage.www.category.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryMapper mapper;

	@Override
	public List<String> getCategoryMenuList() throws Exception {
		return mapper.selectCategoryMenuList();
	}
	
}
