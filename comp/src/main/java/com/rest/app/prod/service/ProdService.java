package com.rest.app.prod.service;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.OrdersVO;

public interface ProdService {
	public List<OrdersVO> getUnplannedOrders(Map<String, Object> param);
}
