package com.rest.app.bus.vo;

import lombok.Data;

@Data
public class ExportLotVO {
	
int deIdx;//세부기록순번
int lotIdx;//순번
String exportCode;//출고번호
String productLot;//제품lot
int exportCount;//출고량
String comments;//비고
int productCode;
String productName;
int productCount;//재고량
}
