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
	public BomVO getInfoProduct(BomVO vo);
	
	//제품에 대한 고객사코드 고객사명 list
	public List<BomVO> getCompanyList(BomVO vo);
	
	//Bom insert
	public int insertBom(BomVO vo);
	
	//Bom update
	public int updateBom(BomVO vo);
	
	//Bom delete
	public Integer deleteBom(BomVO vo);
	
	//자재번호 입력시 자재명 출력
	public BomVO getMatName(BomVO vo);
	
	//공정코드 입력시 공정명 출력
	public BomVO getProName(BomVO vo);
	
	//입출력행 추가시 제품코드 출력
	public BomVO getNewProductCode();
}  
