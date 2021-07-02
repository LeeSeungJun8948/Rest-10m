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
	String kg;
	String etc;
}
