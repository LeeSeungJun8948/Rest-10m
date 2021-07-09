package com.rest.app.prod.vo;

import lombok.Data;

@Data
public class WorkVO {
	String workNo;  // 작업지시번호
	int processCode; // 공정코드
	String lotNo; // 제품LOT
	String workDiv; // 작업구분
	String workDate; // 작업일자
	String startTime; // 작업시작 시간
	String endTime; // 작업종료 시간
	int empCode; // 사원코드
	int errorCode; // 불량코드
	String productCode; // 제품코드
	int workCount; // 작업량
	int errorCount; // 불량량
	
}
