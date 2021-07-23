package com.rest.app.prod.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.EmployeeVO;
import com.rest.app.comm.vo.ErrorVO;
import com.rest.app.fac.vo.FacilitiesVO;
import com.rest.app.mat.vo.SelectListVO;
import com.rest.app.prod.service.ProdService;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.DetailProrderVO;
import com.rest.app.prod.vo.InputMatVO;
import com.rest.app.prod.vo.PlanVO;
import com.rest.app.prod.vo.ProrderVO;
import com.rest.app.prod.vo.WorkVO;

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
		vo.setPlanCode(makePlanCode(vo));
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
	public int deleteAllDetailPlan(String planCode) {
		return mapper.deleteAllDetailPlan(planCode);
	}

	@Override
	public int insertInputMat(InputMatVO vo) {
		return mapper.insertInputMat(vo);
	}

	@Override
	public int updateInputMat(InputMatVO vo) {
		return mapper.updateInputMat(vo);
	}

	@Override
	public int deleteInputMat(int idx) {
		return mapper.deleteInputMat(idx);
	}

	@Override
	public int deleteAllInputMat(String prorCode) {
		return mapper.deleteAllInputMat(prorCode);
	}

	@Override
	public String findProductName(String productCode) {
		return mapper.findProductName(productCode);
	}

	@Override
	public List<InputMatVO> readInputMat(Map<String, Object> param) {
		return mapper.readInputMat(param);
	}

	public int countPlan() {
		return mapper.countPlan();
	}

	@Override
	public List<DetailPlanVO> getDetailPlan(Map<String, Object> param) {
		return mapper.getDetailPlan(param);
	}

	@Override
	public int deleteDetailPlan(int deplanIdx) {
		return mapper.deleteDetailPlan(deplanIdx);
	}

	@Override
	public List<PlanVO> searchPlan(Map<String, Object> param) {
		return mapper.searchPlan(param);
	}

	@Override
	public List<WorkVO> searchWork(Map<String, Object> param) {
		return mapper.searchWork(param);
	}

	@Override
	public int deleteWork(String workCode) {
		return mapper.deleteWork(workCode);
	}

	@Override
	public List<EmployeeVO> searchEmp(Map<String, Object> param) {
		return mapper.searchEmp(param);
	}

	@Override
	public List<ErrorVO> searchError(Map<String, Object> param) {
		return mapper.searchError(param);
	}

	@Override
	public int insertWork(WorkVO vo) {
		vo.setWorkCode(makeWorkCode(vo));
		return mapper.insertWork(vo);
	}

	@Override
	public int updateWork(WorkVO vo) {
		return mapper.updateWork(vo);
	}

	@Override
	public DetailProrderVO selectDetailProrder(String productLot) {
		return mapper.selectDetailProrder(productLot);
	}

	@Override
	public List<DetailPlanVO> getUnfinPlans(Map<String, Object> param) {
		return mapper.getUnfinPlans(param);
	}

	@Override
	public List<ProrderVO> searchProrder(Map<String, Object> param) {
		return mapper.searchProrder(param);
	}

	@Override
	public List<DetailProrderVO> getDetailProrder(Map<String, Object> param) {
		return mapper.getDetailProrder(param);
	}

	@Override
	public int insertProrder(ProrderVO vo) {
		vo.setProrCode(makeProrCode(vo));
		return mapper.insertProrder(vo);
	}

	@Override
	public int updateProrder(ProrderVO vo) {
		return mapper.updateProrder(vo);
	}

	@Override
	public int deleteProrder(String prorCode) {
		return mapper.deleteProrder(prorCode);
	}

	@Override
	public int insertDetailProrder(DetailProrderVO vo) {
		vo.setProductLot(makeLot(vo));
		return mapper.insertDetailProrder(vo);
	}

	@Override
	public int updateDetailProrder(DetailProrderVO vo) {
		return mapper.updateDetailProrder(vo);
	}

	@Override
	public int deleteDetailProrder(String productLot) {
		return mapper.deleteDetailProrder(productLot);
	}

	@Override
	public int deleteAllDetailProrder(String prorCode) {
		return mapper.deleteAllDetailProrder(prorCode);
	}

	public int countPror() {
		return mapper.countPror();
	}

	public int countDetailPror() {
		return mapper.countDetailPror();
	}

	public int countWork() {
		return mapper.countWork();
	}

	public String makeLot(DetailProrderVO vo) {
		String productLot = "PR-" + vo.getWorkDate().replace("-", "").substring(2) + "-" +  String.valueOf((int)((Math.random() + 1) * 1000)) + "-" + String.valueOf(countDetailPror());
		return productLot;
	}

	public String makePlanCode(PlanVO vo) {
		String planCode = "PL-" + vo.getPlanDate().replace("-", "").substring(2) + "-" + String.valueOf((int)((Math.random() + 1) * 1000)) + "-" + String.valueOf(countPlan());
		return planCode;
	}

	public String makeProrCode(ProrderVO vo) {
		String planCode = "PO-" + vo.getProrDate().replace("-", "").substring(2) + "-" + String.valueOf((int)((Math.random() + 1) * 1000)) + "-" + String.valueOf(countPror());
		return planCode;
	}

	public String makeWorkCode(WorkVO vo) {
		String workCode = "WK-" + vo.getWorkDate().replace("-", "").substring(2) + "-" + String.valueOf((int)((Math.random() + 1) * 1000)) + "-" + String.valueOf(countWork());
		return workCode;
	}

	@Override
	public List<DetailPlanVO> viewPlanSearch(Map<String, Object> param) {
		return mapper.viewPlanSearch(param);
	}

	@Override
	public List<DetailProrderVO> viewProrderSearch(Map<String, Object> param) {
		return mapper.viewProrderSearch(param);
	}

	@Override
	public List<SelectListVO> ajaxProdSearchModal(SelectListVO vo) {
		return mapper.ajaxProdSearchModal(vo);
	}
	
	@Override
	public List<SelectListVO> ajaxCompSearchModal(SelectListVO vo) {
		return mapper.ajaxCompSearchModal(vo);
	}

	@Override
	public List<FacilitiesVO> searchFac(Map<String, Object> param) {
		return mapper.searchFac(param);
	}
	
	@Override
	public WorkVO getStorage(String productLot) {
		return mapper.getStorage(productLot);
	}
}
