package com.rest.app.comm.service;

import java.util.List;

import com.rest.app.comm.vo.QualityControlVO;

public interface QualityControlService {
	
	//모달창 제품 조회
	public List<QualityControlVO> getProductList(QualityControlVO vo);
	
	//제품 단건조회
	public QualityControlVO getProduct(QualityControlVO vo);
	
	//제품에 대한 회사 조회
	public List<QualityControlVO> getCompany(QualityControlVO vo);
}
