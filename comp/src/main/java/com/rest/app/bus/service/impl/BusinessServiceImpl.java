package com.rest.app.bus.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.bus.service.BusinessService;
import com.rest.app.bus.vo.CompanyVO;
import com.rest.app.bus.vo.DetailExportVO;
import com.rest.app.bus.vo.ExportVO;
import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.BomVO;


@Service("businessService")
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	BusinessMapper mapper;
	
	@Override
	public List<OrdersVO> getBus(Map<String, Object> param) {//주문관리조회
		// TODO Auto-generated method stub
		return mapper.getBus(param);
	}
	

	@Override
	public List<ExportVO> getExportModal(Map<String, Object> param) {//출고 모달창
		// TODO Auto-generated method stub
		return mapper.getExportModal(param);
	}

	
	@Override
	public List<OrdersVO> getUnExport(Map<String, Object> param) {//미출고조회
			return mapper.getUnExport(param);
	}

	@Override
	public List<CompanyVO> getCompany(CompanyVO vo) {//고객사모달창
		// TODO Auto-generated method stub
		return mapper.getCompany(vo);
	}
	@Override
	public List<BomVO> getProduct(BomVO vo) {
		// TODO 모달창 제품명,제품코드,규격 리스트
		return mapper.getProduct(vo);
	}   
	
	@Override
	public List<OrdersVO> getProInventory(Map<String, Object> param) {//제품재고관리
		return mapper.getProInventory(param);
	}

	@Override
	public int insertExport(ExportVO vo) {
		return mapper.insertExport(vo);
		
	}

	@Override
	public int updateExport(ExportVO vo) {
		return mapper.updateExport(vo);
		
	}

	@Override
	public int deleteExport(String exportCode) {
		return  mapper.deleteExport(exportCode);
		
	}

	@Override
	public int insertDetailExport(DetailExportVO vo) {
		return mapper.insertDetailExport(vo);
	}

	@Override
	public int updateDetailExport(DetailExportVO vo) {
		return mapper.updateDetailExport(vo);
	}

	@Override
	public int deleteDetailExport(int idx) {
		return mapper.deleteDetailExport(idx);
	}

	@Override
	public int deleteAllDetailExport(String exportCode) {
		return mapper.deleteAllDetailExport(exportCode);
	}


	@Override
	public List<ExportVO> searchExport(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return mapper.searchExport(param);
	}


	@Override
	public List<DetailExportVO> getDetailExport(Map<String, Object> param) {
		return mapper.getDetailExport(param);
	}

	
	
}
