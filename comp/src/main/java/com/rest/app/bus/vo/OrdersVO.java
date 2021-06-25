package com.rest.app.bus.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrdersVO {
	int orderNo;
	int productCode;
	int companyCode;
	String orderState;
	Date inDate;
	Date outDate;
	int orderCount;
	int orderPlanCount;
}
