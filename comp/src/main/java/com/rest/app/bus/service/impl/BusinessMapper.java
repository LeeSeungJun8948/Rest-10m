package com.rest.app.bus.service.impl;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.CompanyVO;
import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.BomVO;
import com.rest.app.mat.vo.MaterialVO;

public interface BusinessMapper {
	public List<OrdersVO> getBus(Map<String, Object> param);//주문관리조회

	public OrdersVO getUnExport(OrdersVO vo);//미출고읽기

	public List<CompanyVO> getCompany(CompanyVO vo);//고객사 모달
	
	
	public List<BomVO> getProduct(BomVO vo);//제품모달
}
