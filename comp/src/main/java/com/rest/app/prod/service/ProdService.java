package com.rest.app.prod.service;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.prod.vo.ProdDetailPlanVO;
import com.rest.app.prod.vo.ProdPlanVO;

public interface ProdService {
	public List<OrdersVO> getUnplanOrders(Map<String, Object> param);
	public int insertPlan(ProdPlanVO vo); 
	public int updatePlan(ProdPlanVO vo);
	public int deletePlan(ProdPlanVO vo);
	public int insertDetailPlan(ProdDetailPlanVO vo); 
	public int updateDetailPlan(ProdDetailPlanVO vo);
	public int deleteDetailPlan(ProdDetailPlanVO vo);
}
