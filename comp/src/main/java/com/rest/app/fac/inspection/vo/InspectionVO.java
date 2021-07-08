package com.rest.app.fac.inspection.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;


@Data
public class InspectionVO {
	int inspectionCode;
	String judgement;
	String insComment;
	Date beforeDate;
	Date today;
	Date afterDate;	
	int facCode;
}
