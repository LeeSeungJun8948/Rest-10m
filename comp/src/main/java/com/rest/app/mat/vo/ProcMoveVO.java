package com.rest.app.mat.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ProcMoveVO {
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul" )
	Date workDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul" )
	Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul" )
	Date endDate;
	
	String prorCode;
	String planCode;
	String workCode;
	String productCode;
	String productName;
	String productLot;
	
	String processName;
	
	String prorCount;
	String workCount;
	
	String companyName;

	String materialCode;
	String materialName;
	String materialLot;
	String inputCount;
	
	String status;
	String idx;
	
    String startTime;
    String endTime;
}
