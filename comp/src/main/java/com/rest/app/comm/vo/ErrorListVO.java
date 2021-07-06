package com.rest.app.comm.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ErrorListVO extends ComDefaultVO {
	int errorlistCode;
	int errorCode;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul" )
	Date errorDate;

	String instructionNo;
	String lotNo;
	String errorlistComment;
	
}
