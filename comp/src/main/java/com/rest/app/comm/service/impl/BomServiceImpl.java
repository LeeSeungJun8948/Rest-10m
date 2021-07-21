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
		// TODO 제품상세내역 조회
		return mapper.getInfoProduct(vo);
	}

	@Override
	public List<BomVO> getInfoBom(BomVO vo) {
		// TODO Bom 조회
		return mapper.getInfoBom(vo);
	}

	@Override
	public List<BomVO> getProInfoBom(BomVO vo) {
		// TODO Auto-generated method stub
		return mapper.getProInfoBom(vo);
	}
	

	@Override
	public BomVO getMatName(BomVO vo) {
		// TODO Auto-generated method stub
		return mapper.getMatName(vo);
	}

	@Override
	public BomVO getProName(BomVO vo) {
		// TODO Auto-generated method stub
		return mapper.getProName(vo);
	}
	
	@Override
	public int insertBom(BomVO vo) {
		// TODO Bom insert
		return mapper.insertBom(vo);
	}

	@Override
	public int updateBom(BomVO vo) {
		// TODO Bom update
		return mapper.updateBom(vo);
	}

	@Override
	public int deleteBom(BomVO vo) {
		// TODO Bom delete 		
		return mapper.deleteBom(vo);
	}
	
	@Override
	public BomVO getNewProductCode() {
		// TODO Auto-generated method stub
		return mapper.getNewProductCode();
	}

	@Override
	public BomVO getCompanyList(BomVO vo) {
		// TODO 제품에 대한 고객코드/고객사명 List
		return mapper.getCompanyList(vo);
	}

	@Override
	public List<BomVO> matCodeList(BomVO vo) {
		// TODO Auto-generated method stub
		return mapper.matCodeList(vo);
	}

	@Override
	public int deleteSelectBom(BomVO vo) {
		// TODO Auto-generated method stub
		return mapper.deleteSelectBom(vo);
		
	}

	
}
