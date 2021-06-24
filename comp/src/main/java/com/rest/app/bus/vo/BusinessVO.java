package com.rest.app.bus.vo;

import lombok.Data;

@Data
public class BusinessVO {
	String codeId;

	public String getCodeId() {
		return codeId;
	}

	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
}
