package com.rest.app.comm.service;

import java.util.List;

import com.rest.app.comm.vo.QualityControlVO;

public interface QualityControlService {
	
	//모달창 제품 조회
	public List<QualityControlVO> getProductList(QualityControlVO vo);
	
	//제품 단건조회
	public QualityControlVO getProduct(QualityControlVO vo);
	
	//제품에 대한 회사 조회
	public QualityControlVO getCompany(QualityControlVO vo);
	
	//규격  리스트
	public List<QualityControlVO> getCodeList(QualityControlVO vo);
	
	//단위 리스트
	public List<QualityControlVO> getUnitList(QualityControlVO vo);
	
	//사원 리스트
	public List<QualityControlVO> getEmpList(QualityControlVO vo);
	
	//제품 추가
	public int insertProduct(QualityControlVO vo);
	
	//제품수정
	public int updateProdcut(QualityControlVO vo);
	
	//삭제
	public int deleteProduct(QualityControlVO vo);
	
	public int maxProductCode();
	
}
