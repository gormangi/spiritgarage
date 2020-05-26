package com.spiritgarage.www.job.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.spiritgarage.www.job.mapper.JobMapper;
import com.spiritgarage.www.job.service.JobService;
import com.spiritgarage.www.main.vo.BlogRssVO;
import com.spiritgarage.www.util.Entry;
import com.spiritgarage.www.util.RSSFeed;
import com.spiritgarage.www.util.RSSUtil;

@Service
public class JobServiceImpl implements JobService{
	
	@Autowired
	private JobMapper jobMapper;

	@Scheduled(fixedDelay = 300000)
	@Override
	public void mergeRssInfoList() {
		
		List<BlogRssVO> blogRssList = jobMapper.selectRssInfoList();
		
		RSSUtil rssUtil = new RSSUtil("https://rss.blog.naver.com/spiritgarage.xml");
		RSSFeed feed = rssUtil.getRSSFeed();
		List<Entry> entrys = feed.getEntrys();
		
		if(blogRssList.size() < 1) {
			for(Entry entry : entrys) {
				BlogRssVO vo = new BlogRssVO();
				vo.setBlogRssSeq(UUID.randomUUID().toString());
				vo.setAuthor(entry.getAuthor());
				vo.setCategory(entry.getCategory());
				vo.setDescription(entry.getDescription());
				vo.setTitle(entry.getTitle());
				vo.setLink(entry.getLink());
				vo.setPubDate(entry.getPubDate());
				vo.setUseYn("Y");
				jobMapper.insertRssInfo(vo);
			}
		} else {
			for(Entry entry : entrys) {
				boolean match = false;
				for(BlogRssVO vo : blogRssList) {
					if(entry.getLink().equals(vo.getLink())) {
						match = true;
					}
				}
				if(!match) {
					BlogRssVO vo = new BlogRssVO();
					vo.setBlogRssSeq(UUID.randomUUID().toString());
					vo.setAuthor(entry.getAuthor());
					vo.setCategory(entry.getCategory());
					vo.setDescription(entry.getDescription());
					vo.setTitle(entry.getTitle());
					vo.setLink(entry.getLink());
					vo.setPubDate(entry.getPubDate());
					vo.setUseYn("Y");
					jobMapper.insertRssInfo(vo);
				}
			}
		}
		
	}

}
