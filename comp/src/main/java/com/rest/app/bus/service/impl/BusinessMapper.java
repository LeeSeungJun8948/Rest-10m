package com.rest.app.bus.service.impl;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.CompanyVO;
import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.BomVO;


public interface BusinessMapper {
	public List<OrdersVO> getBus(Map<String, Object> param);//주문관리조회
	
	public List<OrdersVO> getExport(Map<String, Object> param);//출고읽기

	public List<OrdersVO> getUnExport(Map<String, Object> param);//미출고읽기

	public List<CompanyVO> getCompany(CompanyVO vo);//고객사 모달
	
	
	public List<BomVO> getProduct(BomVO vo);//제품모달
	
	public List<OrdersVO> getProInventory(Map<String, Object> param);
}
