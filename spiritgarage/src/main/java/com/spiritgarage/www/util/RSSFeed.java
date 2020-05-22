package com.spiritgarage.www.util;

import java.util.List;

public class RSSFeed {
	
	private String title;
	
	private String description;
	
	private List<Entry> entrys;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Entry> getEntrys() {
		return entrys;
	}

	public void setEntrys(List<Entry> entrys) {
		this.entrys = entrys;
	}
	
}
