package com.rest.app.bus.vo;

<<<<<<< HEAD
=======


>>>>>>> branch 'master' of https://github.com/LeeSeungJun8948/Rest-10m.git
import lombok.Data;
   
@Data
public class OrdersVO {
<<<<<<< HEAD
	int orderNo;
	int productCode;
	int companyCode;
	String orderState;
	String inDate;
	String outDate;
	int orderCount;
	int orderPlanCount; 
	String productName; 
=======
	int orderNo;//제품번호
	int productCode;//제품코드
	int companyCode;//업체코드
	String orderState;//진행구분
	String inDate;//접수일자
	String outDate;//납기일자
	int orderCount;//주문량
	int orderPlanCount;//계획량
	String dCount;//미납품량
>>>>>>> branch 'master' of https://github.com/LeeSeungJun8948/Rest-10m.git
}
