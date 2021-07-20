package com.rest.app.comm.service.impl;

import java.util.List;
import java.util.Map;

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
		// TODO 제품List
		return mapper.getProductList(vo);
	}

	@Override
	public QualityControlVO getCompany(QualityControlVO vo) {
		// TODO Auto-generated method stub
		return mapper.getCompany(vo);
	}

	@Override
	public List<QualityControlVO> getCodeList(QualityControlVO vo) {
		// TODO 규격 리스트
		return mapper.getCodeList(vo);
	}

	@Override
	public List<QualityControlVO> getUnitList(QualityControlVO vo) {
		// TODO 단위리스트
		return mapper.getUnitList(vo);
	}

	@Override
	public int insertProduct(QualityControlVO vo) {
		// TODO 제품등록
		return mapper.insertProduct(vo);
	}


	@Override
	public int deleteProduct(QualityControlVO vo) {
		// TODO 제품삭제
		return mapper.deleteProduct(vo);
	}

	@Override
	public int updateProdcut(QualityControlVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateProdcut(vo);
	}

	@Override
	public List<QualityControlVO> getEmpList(QualityControlVO vo) {
		// TODO 사원리스트
		return mapper.getEmpList(vo);
	}

	@Override
	public int maxProductCode() {
		// TODO Auto-generated method stub
		return mapper.maxProductCode();
	}

	@Override
	public List<QualityControlVO> getProductList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return mapper.getProductList(param);
	}
	


}
