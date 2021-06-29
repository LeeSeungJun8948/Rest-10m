package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class ProdDetailPlanVO {
	int idx;
	String wprojectCode;
	int orderNo;
	String workDate;
	int orderCount;
	int planCount;
	int unplanCount;
	int workCount;
	String detail;
}