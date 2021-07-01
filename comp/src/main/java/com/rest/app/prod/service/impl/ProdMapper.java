package com.rest.app.prod.service.impl;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.PlanVO;

public interface ProdMapper {
	List<OrdersVO> getUnplanOrders(Map<String, Object> param);
	public int insertPlan(PlanVO vo); 
	public int updatePlan(PlanVO vo);
	public int deletePlan(String planCode);
	public int insertDetailPlan(DetailPlanVO vo); 
	public int updateDetailPlan(DetailPlanVO vo);
	public int deleteDetailPlan(DetailPlanVO vo);
	public String findLotNo();
}
