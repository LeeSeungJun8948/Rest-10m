package com.rest.app.prod.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.prod.service.ProdService;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.PlanVO;

@Service("prodService")
public class ProdServiceImpl implements ProdService {
	@Autowired
	ProdMapper mapper;
	
	@Override
	public List<OrdersVO> getUnplanOrders(Map<String, Object> param) {
		return mapper.getUnplanOrders(param);
	}

	@Override
	public int insertPlan(PlanVO vo) {
		return mapper.insertPlan(vo);
	}

	@Override
	public int updatePlan(PlanVO vo) {
		return mapper.updatePlan(vo);
	}

	@Override
	public int deletePlan(String planCode) {
		return mapper.deletePlan(planCode);
	}

	@Override
	public int insertDetailPlan(DetailPlanVO vo) {
		return mapper.insertDetailPlan(vo);
	}

	@Override
	public int updateDetailPlan(DetailPlanVO vo) {
		return mapper.updateDetailPlan(vo);
	}

	@Override
	public int deleteDetailPlan(DetailPlanVO vo) {
		return mapper.deleteDetailPlan(vo);
	}

	@Override
	public String findLotNo() {
		return mapper.findLotNo();
	}
}
