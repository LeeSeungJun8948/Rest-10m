package com.rest.app.bus.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.bus.service.BusinessService;
import com.rest.app.bus.vo.CompanyVO;
import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.BomVO;
import com.rest.app.mat.vo.MaterialVO;

@Service("businessService")
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	BusinessMapper mapper;
	
	@Override
	public List<OrdersVO> getBus(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return mapper.getBus(param);
	}

	@Override
	public OrdersVO getUnExport(OrdersVO vo) {
		return mapper.getUnExport(vo);
	}

	@Override
	public List<CompanyVO> getCompany(CompanyVO vo) {
		// TODO Auto-generated method stub
		return mapper.getCompany(vo);
	}
	@Override
	public List<BomVO> getProduct(BomVO vo) {
		// TODO 모달창 제품명,제품코드,규격 리스트
		return mapper.getProduct(vo);
	}   
	
}
