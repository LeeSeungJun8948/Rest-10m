package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class ProdPlanVO {
	int idx;
	String wprojectCode;
	String workDate;
	int orderNo;
	String projectDate;
	String projectName;
	int orderCount;
	int projectPlan;
	int projectUnplan;
	String projectState;
	String comments;
	String detail;
}
