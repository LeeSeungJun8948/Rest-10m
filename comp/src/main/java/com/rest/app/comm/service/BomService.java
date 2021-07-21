package com.rest.app.comm.service;

import java.util.List;



import com.rest.app.comm.vo.BomVO;

public interface BomService {
	
	//제품코드,제품명,규격 리스트
	public List<BomVO> getProduct(BomVO vo);
	
	//Bom 리스트(제품)
	public List<BomVO> getInfoBom(BomVO vo);
	
	//Bom 리스트(공정)
	public List<BomVO> getProInfoBom(BomVO vo);
	
	//자재코드,명 리스트
	public List<BomVO> matCodeList(BomVO vo);
	
	//제품 단건조회
	public BomVO getInfoProduct(BomVO vo);
	
	//제품에 대한 고객사코드 고객사명 list
	public BomVO getCompanyList(BomVO vo);
	
	//Bom insert
	public int insertBom(BomVO vo);
	
	//Bom update
	public int updateBom(BomVO vo);
	
	//Bom delete bom 단건삭제
	public int deleteBom(BomVO vo);
	
	//Bom delete 제품에 대한 bom 전체삭제
	public int deleteSelectBom(BomVO vo);
	
	//자재번호 입력시 자재명 출력
	public BomVO getMatName(BomVO vo);
	
	//공정코드 입력시 공정명 출력
	public BomVO getProName(BomVO vo);
	
	//입출력행 추가시 제품코드 출력
	public BomVO getNewProductCode();
}
