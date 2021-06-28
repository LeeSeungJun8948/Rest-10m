package com.rest.app.bus.vo;

import lombok.Data;
   
@Data
public class OrdersVO {
	int orderNo;
	int productCode;
	int companyCode;
	String orderState;
	String inDate;
	String outDate;
	int orderCount;
	int orderPlanCount; 
	String productName; 
}
