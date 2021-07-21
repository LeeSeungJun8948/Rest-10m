package com.rest.app.prod.service;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.EmployeeVO;
import com.rest.app.comm.vo.ErrorVO;
import com.rest.app.fac.vo.FacilitiesVO;
import com.rest.app.mat.vo.SelectListVO;
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
	List<DetailPlanVO> viewPlanSearch(Map<String, Object> param);
	int insertPlan(PlanVO vo); 
	int updatePlan(PlanVO vo);
	int deletePlan(String planCode);
	int insertDetailPlan(DetailPlanVO vo); 
	int updateDetailPlan(DetailPlanVO vo);
	int deleteDetailPlan(int deplanIdx);
	int deleteAllDetailPlan(String planCode);
	List<DetailPlanVO> getUnfinPlans(Map<String, Object> param);
	List<ProrderVO> searchProrder(Map<String, Object> param);
	List<DetailProrderVO> getDetailProrder(Map<String, Object> param);
	List<DetailProrderVO> viewProrderSearch(Map<String, Object> param);
	int insertProrder(ProrderVO vo); 
	int updateProrder(ProrderVO vo);
	int deleteProrder(String prorCode);
	DetailProrderVO selectDetailProrder(String productLot);
	int insertDetailProrder(DetailProrderVO vo); 
	int updateDetailProrder(DetailProrderVO vo);
	int deleteDetailProrder(String productLot);
	int deleteAllDetailProrder(String prorCode);
	List<InputMatVO> readInputMat(Map<String, Object> param); 
	int insertInputMat(InputMatVO vo); 
	int updateInputMat(InputMatVO vo);
	int deleteInputMat(int idx);
	int deleteAllInputMat(String prorCode);
	String findProductName(String productCode);
	List<WorkVO> searchWork(Map<String, Object> param);
	int insertWork(WorkVO vo);
	int updateWork(WorkVO vo);
	int deleteWork(String workCode);
	List<EmployeeVO> searchEmp(Map<String, Object> param);
	List<ErrorVO> searchError(Map<String, Object> param);
	List<FacilitiesVO> searchFac(Map<String, Object> param);
	List<SelectListVO> ajaxProdSearchModal(SelectListVO vo);
	List<SelectListVO> ajaxCompSearchModal(SelectListVO vo);
	WorkVO getStorage(String productLot);
}
