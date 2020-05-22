package com.spiritgarage.www.admin.vo;

import com.spiritgarage.www.common.BasePaging;

public class MngrVO extends BasePaging{
	
	private String mngrSeq;
	
	private String id;
	
	private String password;
	
	private String passwordKey;
	
	private String name;
	
	private String useYn;
	
	private String regDate;
	
	private String uptDate;

	public String getMngrSeq() {
		return mngrSeq;
	}

	public void setMngrSeq(String mngrSeq) {
		this.mngrSeq = mngrSeq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordKey() {
		return passwordKey;
	}

	public void setPasswordKey(String passwordKey) {
		this.passwordKey = passwordKey;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
