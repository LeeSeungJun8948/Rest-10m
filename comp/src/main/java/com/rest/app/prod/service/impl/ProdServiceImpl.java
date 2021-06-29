package com.rest.app.prod.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.prod.service.ProdService;
import com.rest.app.prod.vo.ProdPlanVO;

@Service("prodService")
public class ProdServiceImpl implements ProdService {
	@Autowired
	ProdMapper mapper;
	
	@Override
	public List<OrdersVO> getUnplanOrders(Map<String, Object> param) {
		return mapper.getUnplanOrders(param);
	}

	@Override
	public int insertPlan(ProdPlanVO vo) {
		return mapper.insertPlan(vo);
	}

	@Override
	public int updatePlan(ProdPlanVO vo) {
		return mapper.updatePlan(vo);
	}

	@Override
	public int deletePlan(ProdPlanVO vo) {
		return mapper.deletePlan(vo);
	}
}
