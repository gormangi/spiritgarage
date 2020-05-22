package com.spiritgarage.www.util;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.rometools.rome.feed.synd.SyndCategory;
import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.FeedException;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;

public class RSSUtil {
	
	private String rssUrl;

	public RSSUtil(String rssUrl) {
		super();
		this.rssUrl = rssUrl;
	}
	
	public RSSFeed getRSSFeed() {
		
		XmlReader reader = null;
		SyndFeed feed = null;
		RSSFeed rss = new RSSFeed();
		
		try {
			
			reader = new XmlReader(new URL(rssUrl));
			feed = new SyndFeedInput().build(reader);
			
			rss.setTitle(feed.getTitle());
			rss.setDescription(feed.getDescription());
			
			List<Entry> entrys = new ArrayList<Entry>();
			for(SyndEntry entry : feed.getEntries()) {
				Entry e = new Entry();
				e.setAuthor(entry.getAuthor());
				for(SyndCategory category : entry.getCategories()) {
					e.setCategory(category.getName());
				}
				e.setTitle(entry.getTitle());
				e.setLink(entry.getLink());
				e.setDescription(entry.getDescription().getValue());
				entrys.add(e);
			}
			
			rss.setEntrys(entrys);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (FeedException e) {
			e.printStackTrace();
		}
		
		return rss;
		
	}
	
}
