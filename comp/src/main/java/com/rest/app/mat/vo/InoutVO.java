package com.rest.app.mat.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class InoutVO {
	
	String ioCode;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul" )
	Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul" )
	Date endDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul" )
	Date ioDate;
	
	String companyCode;
	String companyName;
	
	String materialCode;
	String materialName;
	String materialType;
	
	String inorderCode;
	
	String unitNo;
	String matNo;
	
	String lotNo;
	
	Integer ioVolume;
	Integer unitPrice;
	Integer price;
	Integer stock;
	Integer lotStock; 
	
	String comments;
	
	String inoutNo; // 01 : 입고, 02 : 출고, 03 : 정산입고, 04 : 정산출고, 05: 재입고, 06: 정산(0)
	String sort;
	
	String processCode;
	String processName;
	
	String exceptZeroStock;
}
