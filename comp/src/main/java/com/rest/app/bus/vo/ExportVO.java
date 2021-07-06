package com.rest.app.bus.vo;

import lombok.Data;

@Data
public class ExportVO {
	
	String exportCode;//출고번호
	String exportDate;//출고일자
	int companyCode;//업체코드
	String comments;//특기사항

}
