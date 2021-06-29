package com.rest.app.comm.vo;

import lombok.Data;

@Data
public class BomVO {
	
	int productCode;
	String productName;
	String unitNo;
	String companyName;
	int companyCode;
	int process_code;
	String process_name;
	int materialCode;
	String materialName;
}
