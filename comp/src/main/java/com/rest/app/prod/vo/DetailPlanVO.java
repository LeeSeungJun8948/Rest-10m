package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class DetailPlanVO {
	int idx;
	String planCode;
	int orderNo;
	String workDate;
	int orderCount;
	int planCount;
	int unplanCount;
	int workCount;
	String detail;
}