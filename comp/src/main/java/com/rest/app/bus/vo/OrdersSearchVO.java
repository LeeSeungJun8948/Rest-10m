package com.rest.app.bus.vo;

import lombok.Data;

@Data
public class OrdersSearchVO {
	String compName;
	int orderNo;
	int productCode;
	String productName;
	String stdId;
	String unitId;
	String inDate;
	String outDate;
	int orderCount;
	int kg;
	int dCount;
	String orderState;
	
}
