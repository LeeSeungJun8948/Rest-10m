package com.rest.app.comm.vo;

import lombok.Data;

@Data
public class ProcessVO extends ComDefaultVO  {
	int processCode;
	String processName;
	String unitId;
	String unitNo;
	String proComment;
	String outStats;
	String outCompName;
	
	
	int companyCode;
	String companyName;
	int companyNum;
	String phone;
	String compNo;
}