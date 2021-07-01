package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class DetailPlanVO {
	String lotNo;
	String planCode;
	int orderNo;
	int productCode;
	String workDate;
	int orderCount;
	int planCount;
	int unplanCount;
	int workCount;
	String comments;
}