package com.rest.app.fac.repair.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class RepairVO {
	String repairCode;
	String facCode;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	Date repairDate;
	
	String repairComment;
	String companyCode;
	String cost;
	String etc;
}
