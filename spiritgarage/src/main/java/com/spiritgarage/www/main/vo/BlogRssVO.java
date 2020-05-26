package com.spiritgarage.www.main.vo;

public class BlogRssVO {

	private String blogRssSeq;
	
	private String author;
	
	private String category;
	
	private String title;
	
	private String link;
	
	private String description;
	
	private String pubDate;
	
	private String useYn;
	
	private String regDate;

	public String getPubDate() {
		return pubDate;
	}

	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getBlogRssSeq() {
		return blogRssSeq;
	}

	public void setBlogRssSeq(String blogRssSeq) {
		this.blogRssSeq = blogRssSeq;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
}
