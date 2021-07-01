package com.rest.app.bus.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.bus.service.BusinessService;
import com.rest.app.bus.vo.OrdersVO;

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
	public List<OrdersVO> getExportForm() {
		// TODO Auto-generated method stub
		return mapper.getExportForm();
	}

}
