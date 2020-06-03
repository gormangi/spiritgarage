package com.spiritgarage.www.main.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spiritgarage.www.admin.vo.MainSlideVO;
import com.spiritgarage.www.category.vo.BlogCategoryVO;
import com.spiritgarage.www.main.mapper.MainMapper;
import com.spiritgarage.www.main.service.MainService;
import com.spiritgarage.www.main.vo.BlogRssVO;
import com.spiritgarage.www.main.vo.HeaderVO;
import com.spiritgarage.www.main.vo.MainFooterVO;
import com.spiritgarage.www.util.RSSFeed;
import com.spiritgarage.www.util.RSSUtil;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainMapper mapper;

	@Override
	public Map<String, Object> getHeaderInfo() {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		RSSUtil rssUtil = new RSSUtil("https://rss.blog.naver.com/spiritgarage.xml");
		RSSFeed feed = rssUtil.getRSSFeed();
		
		HeaderVO vo = new HeaderVO();
		vo.setTitle(feed.getTitle());
		vo.setDescription(feed.getDescription());
		
		List<MainSlideVO> list = mapper.selectMainSlideList();
		
		result.put("list", list);
		result.put("vo", vo);
		
		return result;
	}

	@Override
	public Map<String, Object> getBlogInfoList(){
		
		List<BlogRssVO> blogRssList = mapper.selectBlogInfoList();
		
		List<String> categoryList = null;
		categoryList = new ArrayList<String>();
		
		for(BlogRssVO vo : blogRssList) {
			categoryList.add(vo.getCategory());
		}
		
		TreeSet<String> treeSet = new TreeSet<String>(categoryList);
		categoryList = new ArrayList<String>(treeSet);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> resultList = new ArrayList<Map<String,Object>>();
		
		List<BlogCategoryVO> displayCategoryList = mapper.selectCategoryDisplayY();
		
		for(String category : categoryList) {
			
			for(BlogCategoryVO displayCategory : displayCategoryList) {
				if(displayCategory.getCategory().equals(category)) {
					Map<String, Object> oneCategoryMap = new HashMap<String, Object>();
					List<BlogRssVO> oneCategoryList = new ArrayList<BlogRssVO>();
					
					for(BlogRssVO vo : blogRssList) {
						if(category.equals(vo.getCategory())) {
							oneCategoryList.add(vo);
						}
					}
					
					List<BlogRssVO> cutCategoryList = new ArrayList<BlogRssVO>();
					if(oneCategoryList.size() > 5) {
						for(int i=0;i<oneCategoryList.size();i++) {
							if(i<=5) {
								cutCategoryList.add(oneCategoryList.get(i));
							}
						}
					} else {
						for(int i=0;i<oneCategoryList.size();i++) {
							cutCategoryList.add(oneCategoryList.get(i));
						}
					}
					
					oneCategoryMap.put("categoryNm", category);
					oneCategoryMap.put("categoryList", cutCategoryList);
					resultList.add(oneCategoryMap);
					
					resultMap.put("res", resultList);
				}
			}
			
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> getMainNoticeList() {
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("res", mapper.selectMainNoticeList());
		
		return result;
	}

	@Override
	public Map<String, Object> getMainFooterContact() {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<MainFooterVO> list = mapper.selectMainFooterContactList();
		
		for(MainFooterVO vo : list) {
			
			if("location".equals(vo.getContentDv())){
				result.put("location", vo);
			}else if("mobile".equals(vo.getContentDv())) {
				result.put("mobile", vo);
			}else if("phone".equals(vo.getContentDv())) {
				result.put("phone", vo);
			}
			
		}
		return result;
	}
	
}
