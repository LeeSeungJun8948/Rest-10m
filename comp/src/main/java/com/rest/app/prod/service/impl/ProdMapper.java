package com.rest.app.prod.service.impl;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.InputMatVO;
import com.rest.app.prod.vo.PlanVO;

public interface ProdMapper {
	List<OrdersVO> getUnplanOrders(Map<String, Object> param);
	List<DetailPlanVO> getDetailPlan(Map<String, Object> param);
	int insertPlan(PlanVO vo); 
	int updatePlan(PlanVO vo);
	int deletePlan(String planCode);
	int insertDetailPlan(DetailPlanVO vo); 
	int updateDetailPlan(DetailPlanVO vo);
	int deleteDetailPlan(DetailPlanVO vo);
	int insertInputMat(InputMatVO vo); 
	int updateInputMat(InputMatVO vo);
	int deleteInputMat(InputMatVO vo);
	String findProductName(String productCode);
	List<InputMatVO> readInputMat(Map<String, Object> param);
	PlanVO selectPlanCode();
}
