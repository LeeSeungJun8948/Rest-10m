package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class WorkOrderVO {
	String instructionNo;
	String orderNo;
	String startTime;
	String endTime;
	int empCode;
	int processCode;
	int errorCode;
	String workDivision;
}
