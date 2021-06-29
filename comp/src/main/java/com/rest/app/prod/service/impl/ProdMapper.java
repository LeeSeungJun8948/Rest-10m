package com.rest.app.prod.service.impl;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.prod.vo.ProdPlanVO;

public interface ProdMapper {
	List<OrdersVO> getUnplanOrders(Map<String, Object> param);
	public int deletePlan(ProdPlanVO vo);
	public int updatePlan(ProdPlanVO vo);
	public int insertPlan(ProdPlanVO vo); 
}
