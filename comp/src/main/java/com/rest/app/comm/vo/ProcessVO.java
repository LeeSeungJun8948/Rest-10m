package com.rest.app.comm.vo;

import lombok.Data;

@Data
public class ProcessVO {
	int processCode;
	String processName;
	String unitId;
	String unitNo;
	String proComment;
	String outStats;
	String outCompName;
}
