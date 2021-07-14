package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class DetailProrderVO {
	String productLot;
	String prorCode;
	String productName;
	String planDate;
	String planCode;
	int productCode;
	String workDate;
	int planCount;
	int prorCount;
	int unprorCount;
	int workCount;
	String comments;
	int deplanIdx;
	String prorDate;
	int orderNo;
	int companyCode;
	String companyName;
	String outDate;
	int orderCount;
	String searchDtS;
	String searchDtE;
}