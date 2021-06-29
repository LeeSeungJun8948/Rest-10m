package com.rest.app.mat.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class InorderVO {
	
	Integer inorderCode;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date endDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date inorderDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date inDate;
	
	Integer materialCode;
	String materialName;
	String materialType;
	
	Integer companyCode;
	String companyName;
	
	Integer inorderCount;
	Integer inCount;
	Integer yetCount;
	
	String comments;
	String orderBy;

	
}
