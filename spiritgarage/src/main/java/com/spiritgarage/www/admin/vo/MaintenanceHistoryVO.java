package com.spiritgarage.www.admin.vo;

import java.util.List;

import com.spiritgarage.www.common.BasePaging;

public class MaintenanceHistoryVO extends BasePaging{

	private String maintenanceHistorySeq;
	
	private String phone;
	
	private String carRegNum;
	
	private String name;
	
	private String carRegDate;
	
	private String maintenanceRequestDate;
	
	private String dayOfDelivery;
	
	private String distanceDriven;
	
	private String payment;
	
	private String regMngrId;
	
	private String regMngrName;
	
	private String regDate;
	
	private String uptMngrId;
	
	private String uptMngrName;
	
	private String uptDate;
	
	private List<MaintenanceHistoryDetailVO> maintenanceHistoryDetailList;
	
	private String searchName;
	
	private String searchPhone;
	
	private String searchCarRegNum;

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchPhone() {
		return searchPhone;
	}

	public void setSearchPhone(String searchPhone) {
		this.searchPhone = searchPhone;
	}

	public String getSearchCarRegNum() {
		return searchCarRegNum;
	}

	public void setSearchCarRegNum(String searchCarRegNum) {
		this.searchCarRegNum = searchCarRegNum;
	}

	public List<MaintenanceHistoryDetailVO> getMaintenanceHistoryDetailList() {
		return maintenanceHistoryDetailList;
	}

	public void setMaintenanceHistoryDetailList(List<MaintenanceHistoryDetailVO> maintenanceHistoryDetailList) {
		this.maintenanceHistoryDetailList = maintenanceHistoryDetailList;
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

	public String getMaintenanceHistorySeq() {
		return maintenanceHistorySeq;
	}

	public void setMaintenanceHistorySeq(String maintenanceHistorySeq) {
		this.maintenanceHistorySeq = maintenanceHistorySeq;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCarRegNum() {
		return carRegNum;
	}

	public void setCarRegNum(String carRegNum) {
		this.carRegNum = carRegNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCarRegDate() {
		return carRegDate;
	}

	public void setCarRegDate(String carRegDate) {
		this.carRegDate = carRegDate;
	}

	public String getMaintenanceRequestDate() {
		return maintenanceRequestDate;
	}

	public void setMaintenanceRequestDate(String maintenanceRequestDate) {
		this.maintenanceRequestDate = maintenanceRequestDate;
	}

	public String getDayOfDelivery() {
		return dayOfDelivery;
	}

	public void setDayOfDelivery(String dayOfDelivery) {
		this.dayOfDelivery = dayOfDelivery;
	}

	public String getDistanceDriven() {
		return distanceDriven;
	}

	public void setDistanceDriven(String distanceDriven) {
		this.distanceDriven = distanceDriven;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
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
