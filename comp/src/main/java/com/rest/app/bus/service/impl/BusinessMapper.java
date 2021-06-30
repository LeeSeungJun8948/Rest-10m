package com.rest.app.bus.service.impl;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.OrdersVO;

public interface BusinessMapper {
	public List<OrdersVO> getBus(Map<String, Object> param);

	public List<OrdersVO> getUnproduced();
}
