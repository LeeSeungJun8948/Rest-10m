package com.rest.app.comm.service;

import java.util.List;

import com.rest.app.comm.vo.BomVO;

public interface BomService {
	
	//제품코드,제품명,규격 리스트
	public List<BomVO> getProduct();
	//Bom 리스트
	BomVO getInfoBom(BomVO vo);
	//제품 단건조회
	BomVO getInfoProduct(BomVO vo);
	  
}
