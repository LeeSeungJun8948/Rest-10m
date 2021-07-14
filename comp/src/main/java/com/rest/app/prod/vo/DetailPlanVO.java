package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class DetailPlanVO {
	int deplanIdx;
	String planCode;
	String planName;
	String productName;
	String outDate;
	int orderNo;
	int productCode;
	String workDate;
	int orderCount;
	int planCount;
	int prorCount;
	int unplanCount;
	int unprorCount;
	int workCount;
	String comments;
	String planDate;
	int companyCode;
	String companyName;
	String searchDtS;
	String searchDtE;
}