package com.rest.app.prod.service.impl;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.OrdersVO;

public interface ProdMapper {
	List<OrdersVO> getUnplannedOrders(Map<String, Object> param);
}
