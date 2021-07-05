package com.rest.app.bus.vo;



import lombok.Data;
   
@Data
public class OrdersVO {
	String compName;
	int orderNo;//주문번호
	int productCode;//제품코드
	String productName;//제품명
	String productState;//제품상태
	String stdId;//규격
	String unitId;//단위
	String inDate;//접수일자
	String outDate;//납기일자
	int companyCode;//업체코드
	String companyName;//업체명
	String exportDate;//출고일자
	String orderState;//진행구분
	int orderCount;//주문량
	int planCount;//계획량
	int unplanCount;//미계획량
	int notCount;//미납품량
	int dayCount;//현재고
	int productCount;//재고량
	int exportCount;//출고량
	String productLot;//제품Lot
	int outCount;//출고량
	int unExport;//미출고량
	String export;//출고,미출고 여부
	
}
