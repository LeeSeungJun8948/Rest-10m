package com.rest.app.prod.service.impl;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.EmployeeVO;
import com.rest.app.comm.vo.ErrorVO;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.InputMatVO;
import com.rest.app.prod.vo.PlanVO;
import com.rest.app.prod.vo.WorkVO;

public interface ProdMapper {
	List<OrdersVO> getUnplanOrders(Map<String, Object> param);
	List<PlanVO> searchPlan(Map<String, Object> param);
	List<DetailPlanVO> getDetailPlan(Map<String, Object> param);
	int insertPlan(PlanVO vo); 
	int updatePlan(PlanVO vo);
	int deletePlan(String planCode);
	DetailPlanVO selectDetailPlan(String productLot);
	int insertDetailPlan(DetailPlanVO vo); 
	int updateDetailPlan(DetailPlanVO vo);
	int deleteDetailPlan(String productLot);
	int deleteAllDetailPlan(String planCode);
	int insertInputMat(InputMatVO vo); 
	int updateInputMat(InputMatVO vo);
	int deleteInputMat(int idx);
	int deleteAllInputMat(String planCode);
	String findProductName(String productCode);
	List<InputMatVO> readInputMat(Map<String, Object> param);
	PlanVO selectPlanCode();
	List<WorkVO> searchWork(Map<String, Object> param);
	int insertWork(WorkVO vo);
	int updateWork(WorkVO vo);
	int deleteWork(String workNo);
	List<EmployeeVO> searchEmp(Map<String, Object> param);
	List<ErrorVO> searchError(Map<String, Object> param);
}
