package com.spiritgarage.www.admin.vo;

import org.springframework.web.multipart.MultipartFile;

public class MainSlideVO {

	private String mainSlideSeq;
	
	private String slideDv;
	
	private String topText;
	
	private String middleText;
	
	private String bottomText;
	
	private String reservationBtnYn;
	
	private String maintenanceHistoryBtnYn;
	
	private String mainSlideOrder;
	
	private String regDate;
	
	private String uptDate;
	
	private String originFileName;
	
	private String fileUrl;
	
	private String regMngrId;
	
	private String mainSlideMaxOrder;
	
	private String mainSlideMinOrder;
	
	private String mainSlideOrderWay;
	
	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public String getMainSlideOrderWay() {
		return mainSlideOrderWay;
	}

	public void setMainSlideOrderWay(String mainSlideOrderWay) {
		this.mainSlideOrderWay = mainSlideOrderWay;
	}

	public String getMainSlideMaxOrder() {
		return mainSlideMaxOrder;
	}

	public void setMainSlideMaxOrder(String mainSlideMaxOrder) {
		this.mainSlideMaxOrder = mainSlideMaxOrder;
	}

	public String getMainSlideMinOrder() {
		return mainSlideMinOrder;
	}

	public void setMainSlideMinOrder(String mainSlideMinOrder) {
		this.mainSlideMinOrder = mainSlideMinOrder;
	}

	private MultipartFile bannerFile;
	private String bannerUrl;
	private String bannerUploadPath;
	private String baseUrl;
	private String dateFolderName;
	private String folderName;

	public String getBannerUrl() {
		return bannerUrl;
	}

	public String getRegMngrId() {
		return regMngrId;
	}

	public void setRegMngrId(String regMngrId) {
		this.regMngrId = regMngrId;
	}

	public void setBannerUrl(String bannerUrl) {
		this.bannerUrl = bannerUrl;
	}

	public String getBannerUploadPath() {
		return bannerUploadPath;
	}

	public void setBannerUploadPath(String bannerUploadPath) {
		this.bannerUploadPath = bannerUploadPath;
	}

	public String getBaseUrl() {
		return baseUrl;
	}

	public void setBaseUrl(String baseUrl) {
		this.baseUrl = baseUrl;
	}

	public String getDateFolderName() {
		return dateFolderName;
	}

	public void setDateFolderName(String dateFolderName) {
		this.dateFolderName = dateFolderName;
	}

	public String getFolderName() {
		return folderName;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}

	public String getMainSlideSeq() {
		return mainSlideSeq;
	}

	public MultipartFile getBannerFile() {
		return bannerFile;
	}

	public void setBannerFile(MultipartFile bannerFile) {
		this.bannerFile = bannerFile;
	}

	public String getMainSlideOrder() {
		return mainSlideOrder;
	}

	public void setMainSlideOrder(String mainSlideOrder) {
		this.mainSlideOrder = mainSlideOrder;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public void setMainSlideSeq(String mainSlideSeq) {
		this.mainSlideSeq = mainSlideSeq;
	}

	public String getSlideDv() {
		return slideDv;
	}

	public void setSlideDv(String slideDv) {
		this.slideDv = slideDv;
	}

	public String getTopText() {
		return topText;
	}

	public void setTopText(String topText) {
		this.topText = topText;
	}

	public String getMiddleText() {
		return middleText;
	}

	public void setMiddleText(String middleText) {
		this.middleText = middleText;
	}

	public String getBottomText() {
		return bottomText;
	}

	public void setBottomText(String bottomText) {
		this.bottomText = bottomText;
	}

	public String getReservationBtnYn() {
		return reservationBtnYn;
	}

	public void setReservationBtnYn(String reservationBtnYn) {
		this.reservationBtnYn = reservationBtnYn;
	}

	public String getMaintenanceHistoryBtnYn() {
		return maintenanceHistoryBtnYn;
	}

	public void setMaintenanceHistoryBtnYn(String maintenanceHistoryBtnYn) {
		this.maintenanceHistoryBtnYn = maintenanceHistoryBtnYn;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUptDate() {
		return uptDate;
	}

	public void setUptDate(String uptDate) {
		this.uptDate = uptDate;
	}
	
}
