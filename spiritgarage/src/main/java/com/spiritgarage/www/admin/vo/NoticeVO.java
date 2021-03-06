package com.spiritgarage.www.admin.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spiritgarage.www.common.BasePaging;

public class NoticeVO extends BasePaging{
	
	private String noticeSeq;
	
	private String title;
	
	private String content;
	
	private String mainViewYn;
	
	private String regMngrId;
	
	private String regMngrName;
	
	private String regDate;
	
	private String uptMngrId;
	
	private String uptMngrName;
	
	private String uptDate;
	
	private MultipartFile thumbnail;
	private String thumbnailUrl;
	private String thumbnailUploadPath;
	private String baseUrl;
	private String dateFolderName;
	private String folderName;

	public String getDateFolderName() {
		return dateFolderName;
	}

	public void setDateFolderName(String dateFolderName) {
		this.dateFolderName = dateFolderName;
	}

	public String getThumbnailUrl() {
		return thumbnailUrl;
	}

	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

	public String getFolderName() {
		return folderName;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}

	public String getThumbnailUploadPath() {
		return thumbnailUploadPath;
	}

	public void setThumbnailUploadPath(String thumbnailUploadPath) {
		this.thumbnailUploadPath = thumbnailUploadPath;
	}

	public String getBaseUrl() {
		return baseUrl;
	}

	public void setBaseUrl(String baseUrl) {
		this.baseUrl = baseUrl;
	}

	public MultipartFile getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(MultipartFile thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getRegMngrName() {
		return regMngrName;
	}

	public void setRegMngrName(String regMngrName) {
		this.regMngrName = regMngrName;
	}

	public String getUptMngrName() {
		return uptMngrName;
	}

	public void setUptMngrName(String uptMngrName) {
		this.uptMngrName = uptMngrName;
	}

	public String getNoticeSeq() {
		return noticeSeq;
	}

	public void setNoticeSeq(String noticeSeq) {
		this.noticeSeq = noticeSeq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMainViewYn() {
		return mainViewYn;
	}

	public void setMainViewYn(String mainViewYn) {
		this.mainViewYn = mainViewYn;
	}

	public String getRegMngrId() {
		return regMngrId;
	}

	public void setRegMngrId(String regMngrId) {
		this.regMngrId = regMngrId;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUptMngrId() {
		return uptMngrId;
	}

	public void setUptMngrId(String uptMngrId) {
		this.uptMngrId = uptMngrId;
	}

	public String getUptDate() {
		return uptDate;
	}

	public void setUptDate(String uptDate) {
		this.uptDate = uptDate;
	}
	
}
