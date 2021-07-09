package com.rest.app.prod.vo;



import lombok.Data;

@Data
public class ErrorListVO {
	String processName;
	String workDate;
	int workCount;
	int errorCount;
	int productCode;
	String productName;
	String productLot;
	String workNo;
	int errorCode;
	String startDate;
	String endDate;
}
