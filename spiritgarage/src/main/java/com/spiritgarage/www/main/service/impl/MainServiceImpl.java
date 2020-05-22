package com.spiritgarage.www.main.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spiritgarage.www.main.mapper.MainMapper;
import com.spiritgarage.www.main.service.MainService;
import com.spiritgarage.www.main.vo.BlogRssVO;
import com.spiritgarage.www.main.vo.HeaderVO;
import com.spiritgarage.www.util.RSSFeed;
import com.spiritgarage.www.util.RSSUtil;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainMapper mainMapper;

	@Override
	public HeaderVO getHeaderInfo() {
		
		RSSUtil rssUtil = new RSSUtil("https://rss.blog.naver.com/spiritgarage.xml");
		RSSFeed feed = rssUtil.getRSSFeed();
		
		HeaderVO vo = new HeaderVO();
		vo.setTitle(feed.getTitle());
		vo.setDescription(feed.getDescription());
		
		return vo;
	}

	@Override
	public Map<String, Object> getBlogInfoList(){
		
		List<BlogRssVO> blogRssList = mainMapper.selectBlogInfoList();
		
		List<String> categoryList = null;
		categoryList = new ArrayList<String>();
		
		for(BlogRssVO vo : blogRssList) {
			categoryList.add(vo.getCategory());
		}
		
		TreeSet<String> treeSet = new TreeSet<String>(categoryList);
		categoryList = new ArrayList<String>(treeSet);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		for(String category : categoryList) {
			
			Map<String, Object> oneCategoryMap = new HashMap<String, Object>();
			List<BlogRssVO> oneCategoryList = new ArrayList<BlogRssVO>();
			
			for(BlogRssVO vo : blogRssList) {
				if(category.equals(vo.getCategory())) {
					oneCategoryList.add(vo);
				}
			}
			
			oneCategoryMap.put("categoryNm", category);
			oneCategoryMap.put("categoryList", oneCategoryList);
			resultList.add(oneCategoryMap);
			
			resultMap.put("res", resultList);
			
		}
		
		return resultMap;
	}
	
}
