package com.rest.app.bus.service;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.OrdersVO;

public interface BusinessService {
	public List<OrdersVO> getBus(Map<String, Object> param);//주문관리참조 조회 리스트
	
	public List<OrdersVO> getUnproduced();//미생산의뢰조회
}
