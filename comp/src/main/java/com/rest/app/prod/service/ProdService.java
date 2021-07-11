package com.rest.app.prod.service;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.EmployeeVO;
import com.rest.app.comm.vo.ErrorVO;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.DetailProrderVO;
import com.rest.app.prod.vo.InputMatVO;
import com.rest.app.prod.vo.PlanVO;
import com.rest.app.prod.vo.ProrderVO;
import com.rest.app.prod.vo.WorkVO;

public interface ProdService {
	List<OrdersVO> getUnplanOrders(Map<String, Object> param);
	List<PlanVO> searchPlan(Map<String, Object> param);
	List<DetailPlanVO> getDetailPlan(Map<String, Object> param);
	int insertPlan(PlanVO vo); 
	int updatePlan(PlanVO vo);
	int deletePlan(String planCode);
	DetailPlanVO selectDetailPlan(int deplanIdx);
	int insertDetailPlan(DetailPlanVO vo); 
	int updateDetailPlan(DetailPlanVO vo);
	int deleteDetailPlan(int deplanIdx);
	int deleteAllDetailPlan(String planCode);
	List<PlanVO> getUnfinPlans(Map<String, Object> param);
	List<ProrderVO> searchProrder(Map<String, Object> param);
	List<DetailProrderVO> getDetailProrder(Map<String, Object> param);
	int insertProrder(ProrderVO vo); 
	int updateProrder(ProrderVO vo);
	int deleteProrder(String prorCode);
	DetailPlanVO selectDetailPlan(String productLot);
	int insertDetailProrder(DetailProrderVO vo); 
	int updateDetailProrder(DetailProrderVO vo);
	int deleteDetailProrder(String productLot);
	int deleteAllDetailProrder(String prorCode);
	int insertInputMat(InputMatVO vo); 
	int updateInputMat(InputMatVO vo);
	int deleteInputMat(int idx);
	int deleteAllInputMat(String prorCode);
	String findProductName(String productCode);
	List<InputMatVO> readInputMat(Map<String, Object> param); 
	List<WorkVO> searchWork(Map<String, Object> param);
	int insertWork(WorkVO vo);
	int updateWork(WorkVO vo);
	int deleteWork(String workNo);
	List<EmployeeVO> searchEmp(Map<String, Object> param);
	List<ErrorVO> searchError(Map<String, Object> param);
}
