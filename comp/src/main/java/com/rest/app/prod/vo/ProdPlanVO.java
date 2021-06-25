package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class ProdPlanVO {
	String wprojectCode;
	String workDate;
	int orderNo;
	String projectDate;
	String projectName;
	int projectUnplanned;
	int orderCount;
	int projectPlanned;
	String projectState;
	String comments;
	String detail;
}
