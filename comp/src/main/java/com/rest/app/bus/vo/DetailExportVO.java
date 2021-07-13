package com.rest.app.bus.vo;

import lombok.Data;

@Data
public class DetailExportVO {

	int deIdx;//순번
	String exportCode;//출고번호
	int orderNo;//주문번호
	String productLot;//제품lot
	int productCode;//제품코드
	int unExportCount;//미출고량
	int exportCount;//출고량
	int price;//금액
	String comments;//비고
	String exportDate;
	String productName;
	String stdId;
	String unitId;
	int outCount;
	int companyCode;
	int dayCount;
}
