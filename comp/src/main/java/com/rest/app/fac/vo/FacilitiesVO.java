package com.rest.app.fac.vo;
 


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
 
@Data
public class FacilitiesVO {
	String facCode;
	String facilitiesName;
	String model;
	String facSize;
	String productionCompany;
	String purpose;
	String volume;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul" )
	Date productionDate;
	
	String empNo;
	String price;
	String facInspection;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul" )
	Date purchaseDate;
	
	String processCode;
	
	String img;
	MultipartFile uploadFile;
	
	String processName;
	String employeeName; 
	
	String searchKeyword;
	String searchCondition;
}
