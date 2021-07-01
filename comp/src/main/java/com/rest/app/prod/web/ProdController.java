package com.rest.app.prod.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.prod.service.ProdService;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.PlanVO;

class GridData {
	List<DetailPlanVO> createdRows;
	List<DetailPlanVO> updatedRows;
	List<DetailPlanVO> deletedRows;

	public List<DetailPlanVO> getCreatedRows() {
		return createdRows;
	}

	public void setCreatedRows(List<DetailPlanVO> createdRows) {
		this.createdRows = createdRows;
	}

	public List<DetailPlanVO> getDeletedRows() {
		return deletedRows;
	}

	public void setDeletedRows(List<DetailPlanVO> deletedRows) {
		this.deletedRows = deletedRows;
	}

	public List<DetailPlanVO> getUpdatedRows() {
		return updatedRows;
	}

	public void setUpdatedRows(List<DetailPlanVO> updatedRows) {
		this.updatedRows = updatedRows;
	}
}

@Controller
public class ProdController {
	@Autowired
	ProdService svc;

	// 생산계획관리 페이지
	@RequestMapping("managePlan.do")
	public String managePlan(Model model) {
		return "prod/managePlan.page";
	}

	// 미완료주문 읽기
	@RequestMapping("readUnplanOrders.do")
	@ResponseBody
	public Map<String, Object> readUnplanOrders(@RequestBody Map<String, Object> param) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("contents", svc.getUnplanOrders(param));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 계획저장
	@RequestMapping("savePlan.do")
	@ResponseBody
	public void savePlan(PlanVO vo) {
		if (vo.getPlanCode().equals("planCode")) {
			svc.insertPlan(vo);
		} else {
			svc.updatePlan(vo);
		}
	}

	// 계획삭제
	@RequestMapping("deletePlan.do")
	@ResponseBody
	public void deletePlan(@RequestParam String planCode) {
		svc.deletePlan(planCode);
	}

	// 세부계획 CUD
	@RequestMapping("saveGrid.do")
	@ResponseBody
	public String saveGrid(@RequestBody GridData gridData) {
		List<DetailPlanVO> cList = gridData.createdRows;
		List<DetailPlanVO> uList = gridData.updatedRows;
		List<DetailPlanVO> dList = gridData.deletedRows;
		cList.forEach(vo -> {
			svc.insertDetailPlan(vo);
		});
		uList.forEach(vo -> {
			if (vo.getLotNo() == null) {
				svc.insertDetailPlan(vo);
			} else {
				svc.updateDetailPlan(vo);
			}
		});
		dList.forEach(vo -> {
			if (vo.getLotNo() != null) {
				svc.deleteDetailPlan(vo);
			}
		});
		return "redirect:managePlan.do";
	}
}
