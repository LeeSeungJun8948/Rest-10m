package com.rest.app.fac.facproduct.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rest.app.comm.vo.ComDefaultVO;

import lombok.Data;

@Data
public class FacProductVO extends ComDefaultVO {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul" )
	Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul" )
	Date endDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul" )
	Date workDate;
	
	String facilitiesName;
	String productName;
	String productLot;
}
