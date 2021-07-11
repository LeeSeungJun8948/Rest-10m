package com.rest.app.prod.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.EmployeeVO;
import com.rest.app.comm.vo.ErrorVO;
import com.rest.app.prod.service.ProdService;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.InputMatVO;
import com.rest.app.prod.vo.PlanVO;
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
		vo.setProductLot(makeLot(vo));
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
	public int deleteAllInputMat(String planCode) {
		return mapper.deleteAllInputMat(planCode);
	}

	@Override
	public String findProductName(String productCode) {
		return mapper.findProductName(productCode);
	}

	@Override
	public List<InputMatVO> readInputMat(Map<String, Object> param) {
		return mapper.readInputMat(param);
	}

	@Override
	public PlanVO selectPlanCode() {
		return mapper.selectPlanCode();
	}

	@Override
	public List<DetailPlanVO> getDetailPlan(Map<String, Object> param) {
		return mapper.getDetailPlan(param);
	}

	@Override
	public int deleteDetailPlan(String productLot) {
		return mapper.deleteDetailPlan(productLot);
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
	public int deleteWork(String workNo) {
		return mapper.deleteWork(workNo);
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
	public DetailPlanVO selectDetailPlan(String productLot) {
		return mapper.selectDetailPlan(productLot);
	}

	public String makeLot(DetailPlanVO vo) {
		String productLot = "PR-" + vo.getWorkDate().replace("-", "").substring(2) + "-"
				+ String.valueOf(vo.getProductCode()) + String.valueOf(vo.getOrderNo())
				+ String.valueOf(vo.getWorkCount()).substring(0, 2);
		return productLot;
	}

	public String makeWorkCode(WorkVO vo) {
		String workCode = "WK-" + vo.getWorkDate().replace("-", "").substring(2) + "-"
				+ String.valueOf(vo.getProductCode()) + String.valueOf(vo.getProcessCode())
				+ String.valueOf(vo.getWorkCount()).substring(0, 2);
		return workCode;
	}
}
