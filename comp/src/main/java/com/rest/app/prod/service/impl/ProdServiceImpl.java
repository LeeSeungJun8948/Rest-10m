package com.rest.app.prod.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.prod.service.ProdService;

@Service("prodService")
public class ProdServiceImpl implements ProdService {
	@Autowired
	ProdMapper mapper;
	
	@Override
	public List<OrdersVO> getUnplannedOrders() {
		return mapper.getUnplannedOrders();
	}
}
