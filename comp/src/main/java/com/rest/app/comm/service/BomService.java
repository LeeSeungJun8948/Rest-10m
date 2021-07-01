package com.rest.app.comm.service;

import java.util.List;



import com.rest.app.comm.vo.BomVO;

public interface BomService {
	
	//제품코드,제품명,규격 리스트
	public List<BomVO> getProduct(BomVO vo);
	
	//Bom 리스트
	public List<BomVO> getInfoBom(BomVO vo);
	
	//제품 단건조회
	BomVO getInfoProduct(BomVO vo);
	//Bom insert
	public int insertBom(BomVO vo);
	
	//Bom update
	public int updateBom(BomVO vo);
	
	//자재번호 입력시 자재명 출력
	public BomVO getMatName(BomVO vo);
	
	//공정코드 입력시 공정명 출력
	public BomVO getProName(BomVO vo);
}
