package com.rest.app.mat.vo;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SelectListVO {
	
	String keyword;
	String searchCondition;
	
	String materialCode;
	String materialName;
	String matNm;

	// 출고관리 -> 자재코드 입력시 공정리스트 출력
	String processCode;
	String processName;
	
	// 출고관리 -> 자재코드 입력시 재고가 0 이상인 로트번호 + 자재 출력
	String lotNo;
	String lotStock;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul" )
	Date ioDate;
	
	String companyCode;
	String companyName;
	String compNo;

}
