package com.rest.app.fac.facproduct.vo;

import com.rest.app.comm.vo.ComDefaultVO;

import lombok.Data;

@Data
public class FacProductVO extends ComDefaultVO {
	String facCode;
	String facilitiesName;
	String productCode;
	String productName; 
}
