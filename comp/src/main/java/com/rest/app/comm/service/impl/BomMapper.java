package com.rest.app.comm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.rest.app.comm.vo.BomVO;
import com.rest.app.comm.vo.BomVO;

public interface BomMapper {
	
	//제품코드,제품명,규격 리스트
	public List<BomVO> getProduct(BomVO vo);
	//Bom 리스트
	public List<BomVO> getInfoBom(BomVO vo);
	//제품 단건조회
	BomVO getInfoProduct(BomVO vo);
	
}  
