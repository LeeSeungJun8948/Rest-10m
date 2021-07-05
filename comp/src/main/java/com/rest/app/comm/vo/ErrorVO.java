package com.rest.app.comm.vo;

import lombok.Data;

@Data
public class ErrorVO {
	int ErrorCode;
	String ErrorName;
	String ErrorComment;
}
