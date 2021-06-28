package com.rest.app.comm.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class EmployeeVO {
	int empCode;
	String id;
	String pwd;
	String dept;
	String auth;;
	String phone;
	String email;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	Date hireDate;
	String employeeName;
	String companyCode;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	Date regDate;
	int salary;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	Date birthDay;
	
	  
}
