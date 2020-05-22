package com.spiritgarage.www.reservation.vo;

import com.spiritgarage.www.common.BasePaging;

public class MaintenanceAreaVO extends BasePaging{

	private String maintenanceAreaSeq;
	
	private String maintenanceName;
	
	private String regDate;

	public String getMaintenanceAreaSeq() {
		return maintenanceAreaSeq;
	}

	public void setMaintenanceAreaSeq(String maintenanceAreaSeq) {
		this.maintenanceAreaSeq = maintenanceAreaSeq;
	}

	public String getMaintenanceName() {
		return maintenanceName;
	}

	public void setMaintenanceName(String maintenanceName) {
		this.maintenanceName = maintenanceName;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
}
