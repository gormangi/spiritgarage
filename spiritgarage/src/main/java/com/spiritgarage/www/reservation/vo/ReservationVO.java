package com.spiritgarage.www.reservation.vo;

import com.spiritgarage.www.common.BasePaging;

public class ReservationVO extends BasePaging{

	private String reservationSeq;
	
	private String reservationDate;
	
	private String reservationName;
	
	private String phone;
	
	private String chooseArea;
	
	private String reservationContent;
	
	private String useYn;
	
	private String regDate;
	
	private String uptDate;

	public String getReservationSeq() {
		return reservationSeq;
	}

	public void setReservationSeq(String reservationSeq) {
		this.reservationSeq = reservationSeq;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getReservationName() {
		return reservationName;
	}

	public void setReservationName(String reservationName) {
		this.reservationName = reservationName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getChooseArea() {
		return chooseArea;
	}

	public void setChooseArea(String chooseArea) {
		this.chooseArea = chooseArea;
	}

	public String getReservationContent() {
		return reservationContent;
	}

	public void setReservationContent(String reservationContent) {
		this.reservationContent = reservationContent;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
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
