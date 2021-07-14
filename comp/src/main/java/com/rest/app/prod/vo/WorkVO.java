package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class WorkVO {
	String workCode;  // 작업지시번호
	String processCode; // 공정코드
	String processName; // 공정이름
	int productCode; // 제품코드
	String productName; // 제품명
	String productLot; // 제품LOT
	String workDiv; // 작업구분
	String workDate; // 작업일자
	String startTime; // 작업시작 시간
	String endTime; // 작업종료 시간
	int empCode; // 사원코드
	String employeeName; // 사원명
	int errorCode; // 불량코드
	String errorName; // 불량명
	int workCount; // 작업량
	int errorCount; // 불량량
	String prorCode; // 작업지시번호
	String workDtS;
	String workDtE;
	int facCode;
	String facilitiesName;
}
