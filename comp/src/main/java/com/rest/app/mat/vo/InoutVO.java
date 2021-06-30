package com.rest.app.mat.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class InoutVO {
	
	String ioCode;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	Date endDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	Date ioDate;
	
	String companyCode;
	String companyName;
	
	String materialCode;
	String materialName;
	String materialType;
	
	String inorderCode;
	
	String unitNo;
	
	String lotNo;
	
	Integer ioVolume;
	Integer unitPrice;
	Integer price;
	Integer stock;
	
	String ioType; // 01 : 입고, 02 : 출고, 03 : 정산입고, 04 : 정산출고  
}
