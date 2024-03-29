package com.rest.app.mat.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
public class MaterialVO {
	
	private Integer materialCode;
	private String materialName;
	private Integer companyCode;
	private String companyName;
	private String unitId;
	private String unitNo;
	private String unitNm;
	private String matId;
	private String matNo;
	private String matNm; // COMTCCMMNDETAILCODE에서 조인해서 가져올 공통코드 설명(ex 자재구분 pp)
	private Integer saveStock;
	private Integer minStock;
	private Integer maxStock;
	private Integer monthStock;

}
