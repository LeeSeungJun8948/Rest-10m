package com.rest.app.mat.vo;

import lombok.Data;

@Data
public class SelectListVO {
	
	String materialCode;

	// 출고관리 -> 자재코드 입력시 공정리스트 출력
	String processCode;
	String processName;
	
	// 출고관리 -> 자재코드 입력시 재고가 0 이상인 로트번호 + 자재 출력
	String lotNo;
	String lotStock;

}
