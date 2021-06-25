package com.rest.app.mat.vo;

import lombok.Data;

@Data
public class MaterialVO {
	
	private int materialCode;
	private String name;
	private int companyCode;
	private String companyName; // company와 조인해서 가져올 companyName
	private String unitId;
	private String unitNo;
	private String matId;
	private String matNo;
	private String matNm; // COMTCCMMNDETAILCODE에서 조인해서 가져올 공통코드 설명(ex 자재구분 pp)
	private int saveStock;
	private int minStock;
	private int maxStock;
	private int monthStock;

}
