package com.rest.app.bus.vo;

import lombok.Data;
   
@Data
public class OrdersVO {
	int orderNo;//주문번호
	int productCode;//제품코드
	int companyCode;//업체코드
	String orderState;//진행구분
	String inDate;//접수일자
	String outDate;//납기일자
	int orderCount;//주문량
	int planCount;//계획량
	int unplanCount;//미계획량
	String productName;//제품명
}
