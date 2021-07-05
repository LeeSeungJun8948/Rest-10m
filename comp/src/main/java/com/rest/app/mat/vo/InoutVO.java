package com.rest.app.mat.vo;

import java.util.Date;

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
	Integer lotStock; // 어디서 쓰더라
	
	String ioType; // 01 : 입고, 02 : 출고, 03 : 정산입고, 04 : 정산출고
	String sort;
	
	String processCode;
	String processName;
}
