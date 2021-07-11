package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class DetailProrderVO {
	String productLot;
	String prorCode;
	String productName;
	String outDate;
	String planCode;
	int productCode;
	String workDate;
	int planCount;
	int prorCount;
	int unprorCount;
	int workCount;
	String comments;
}