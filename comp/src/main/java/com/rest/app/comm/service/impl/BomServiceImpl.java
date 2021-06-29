package com.rest.app.comm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.rest.app.comm.service.BomService;
import com.rest.app.comm.vo.BomVO;

@Repository
public class BomServiceImpl implements BomService {

	@Autowired
	BomMapper mapper;

	@Override
	public List<BomVO> getProduct(BomVO vo) {
		// TODO 모달창 제품명,제품코드,규격 리스트
		return mapper.getProduct(vo);
	}   
  
	@Override
	public BomVO getInfoProduct(BomVO vo) {
		// TODO 제품 단건 조회
		return mapper.getInfoProduct(vo);
	}

	@Override
	public List<BomVO> getInfoBom(BomVO vo) {
		// TODO Bom 조회
		return mapper.getInfoBom(vo);
	}


	
	
}
