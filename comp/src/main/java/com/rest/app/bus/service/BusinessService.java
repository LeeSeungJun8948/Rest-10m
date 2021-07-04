package com.rest.app.bus.service;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.CompanyVO;
import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.BomVO;

public interface BusinessService {
	public List<OrdersVO> getBus(Map<String, Object> param);//주문관리참조 조회 리스트
	
	public List<OrdersVO> getUnExport(Map<String, Object> param);//미출고검색
	
	public List<CompanyVO> getCompany(CompanyVO vo);//고객사리스트 모달창

	public List<BomVO> getProduct(BomVO vo);//제품 모달창

}
