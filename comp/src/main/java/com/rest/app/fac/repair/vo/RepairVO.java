package com.rest.app.fac.repair.vo;

import lombok.Data;

@Data
public class RepairVO {
	String repairCode;
	String facCode;
	String repairDate;
	String repairComment;
	String companyCode;
	String cost;
	String etc;
}
