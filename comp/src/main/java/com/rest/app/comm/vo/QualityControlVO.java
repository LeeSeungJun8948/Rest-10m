package com.rest.app.comm.vo;

import lombok.Data;

@Data
public class QualityControlVO {

	int productCode;
	String productName;
	String stdId;
	String stdNo;
	String unitId;
	String unitNo;
	String useAt;
	String pImg;
	String qcImg;
	
	
	int empCode;
	String employeeName;
	
	String companyCode;
	String compCode;
	String companyName;
	String compName;
}
