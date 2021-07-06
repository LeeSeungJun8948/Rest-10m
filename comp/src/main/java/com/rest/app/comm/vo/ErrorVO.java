package com.rest.app.comm.vo;

import lombok.Data;

@Data
public class ErrorVO extends ComDefaultVO {
	int errorCode;
	String errorName;
	String errorComment;
}
