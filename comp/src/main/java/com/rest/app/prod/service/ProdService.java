package com.rest.app.prod.service;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.ProdPlanVO;

public interface ProdService {
	public List<OrdersVO> getUnplanOrders(Map<String, Object> param);
	public int insertPlan(ProdPlanVO vo); 
	public int updatePlan(ProdPlanVO vo);
	public int deletePlan(String planCode);
	public int insertDetailPlan(DetailPlanVO vo); 
	public int updateDetailPlan(DetailPlanVO vo);
	public int deleteDetailPlan(DetailPlanVO vo);
}
