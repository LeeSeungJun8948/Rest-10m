package com.rest.app.comm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rest.app.comm.service.QualityControlService;
import com.rest.app.comm.vo.QualityControlVO;

@Repository
public class QualityControlServiceMapper implements QualityControlService {

	@Autowired
	QualityControlMapper mapper;
	
	@Override
	public QualityControlVO getProduct(QualityControlVO vo) {
		// TODO 제품단건조회
		return mapper.getProduct(vo);
	}

	@Override
	public List<QualityControlVO> getProductList(QualityControlVO vo) {
		// TODO 모달창 제품 조회
		return mapper.getProductList(vo);
	}

	@Override
	public QualityControlVO getCompany(QualityControlVO vo) {
		// TODO Auto-generated method stub
		return mapper.getCompany(vo);
	}

	@Override
	public List<QualityControlVO> getCodeList(QualityControlVO vo) {
		// TODO Auto-generated method stub
		return mapper.getCodeList(vo);
	}



}
