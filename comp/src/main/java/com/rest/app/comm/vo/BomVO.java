package com.rest.app.comm.vo;

import lombok.Data;

@Data
public class BomVO extends ComDefaultVO{
	
	Integer productCode;
	String productName;
	String unitNo;
	String companyName;
	int companyCode;
	int processCode;
	String processName;
	int materialCode;
	String materialName;
	int bomNo;
	int idx;
	String kg;
	String etc;
	
	String matNo;
	String matNm;
	String codeId;
	String code;
	
	String compCode;
	String compName;
}
