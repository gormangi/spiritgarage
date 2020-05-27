package com.spiritgarage.www.notice.vo;

import com.spiritgarage.www.common.BasePaging;

public class NoticeVO extends BasePaging{
	
	private String noticeSeq;
	
	private String title;
	
	private String content;
	
	private String mainViewYn;
	
	private String regMngrId;
	
	private String regDate;
	
	private String uptMngrId;
	
	private String uptDate;
	
	private String fileUrl;

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
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
