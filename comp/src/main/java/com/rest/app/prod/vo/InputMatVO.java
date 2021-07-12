package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class InputMatVO {
	int inputIdx;
	String prorCode;
	String productLot;
	int materialCode;
	String materialName;
	String materialLot;
	int materialCount;
	int inputCount;
	String comments;
}
