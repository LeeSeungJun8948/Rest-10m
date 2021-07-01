package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class InputLotVO {
	String lotNo;
	String stockLot;
	int kg;
	String comments;
}
