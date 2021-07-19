package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class ErrorListVO {
	String processName;
	String workDate;
	int workCount;
	int errorCount;
	Integer productCode;
	String productName;
	String productLot;
	String workCode;
	int errorCode;
	String startDate;
	String endDate;
	String errorName;
}
