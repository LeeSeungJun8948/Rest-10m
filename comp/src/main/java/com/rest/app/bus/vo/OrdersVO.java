package com.rest.app.bus.vo;

import lombok.Data;
   
@Data
public class OrdersVO {
	int orderNo;//제품번호
	int productCode;//제품코드
	int companyCode;//업체코드
	String orderState;//진행구분
	String inDate;//접수일자
	String outDate;//납기일자
	int orderCount;//주문량
	int orderPlanCount;//계획량
	String dCount;//미납품량
	String orderDate;//자료구분(접수일자/납기일자)
	String productName;//제품명
	int orderUnplanCount;//미계획량
}
