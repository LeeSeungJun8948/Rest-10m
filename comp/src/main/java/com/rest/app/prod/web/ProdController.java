package com.rest.app.prod.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.prod.service.ProdService;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.InputMatVO;
import com.rest.app.prod.vo.PlanVO;

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
		System.out.println(param);
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
	public void deletePlan(String planCode) {
		svc.deletePlan(planCode);
	}

	// 세부계획 CUD
	@RequestMapping("saveGrid.do")
	@ResponseBody
	public void saveGrid(@RequestBody GridData gridData) {
		List<DetailPlanVO> cList = gridData.createdRows;
		List<DetailPlanVO> uList = gridData.updatedRows;
		List<DetailPlanVO> dList = gridData.deletedRows;
		cList.forEach(vo -> {
			if (vo.getWorkCount() != 0) {
				svc.insertDetailPlan(vo);
			}
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
	}

	// 투입자재 CUD
	@RequestMapping("saveInput.do")
	@ResponseBody
	public String saveInput(@RequestBody GridData gridData) {
		List<InputMatVO> cList = gridData.createdInputRows;
		List<InputMatVO> uList = gridData.updatedInputRows;
		List<InputMatVO> dList = gridData.deletedInputRows;
		cList.forEach(vo -> {
			if (vo.getInputCount() != 0) {
				svc.insertInputMat(vo);
			}
		});
		uList.forEach(vo -> {
			if (vo.getInputIdx() == 0) {
				svc.insertInputMat(vo);
			} else {
				svc.updateInputMat(vo);
			}
		});
		dList.forEach(vo -> {
			if (vo.getInputIdx() != 0) {
				svc.deleteInputMat(vo);
			}
		});
		return "redirect:managePlan.do";
	}

	// 제품명찾기
	@RequestMapping("findProductName.do")
	@ResponseBody
	public String findProductName(String productCode) {
		return svc.findProductName(productCode);
	}

	// 자재LOT별 재고량리스트 가져오기
	@RequestMapping("getInputMat.do")
	@ResponseBody
	public Map<String, Object> getInputMat(@RequestBody Map<String, Object> param) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("contents", svc.readInputMat(param));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}
}

class GridData {
	List<DetailPlanVO> createdRows;
	List<DetailPlanVO> updatedRows;
	List<DetailPlanVO> deletedRows;
	List<InputMatVO> createdInputRows;
	List<InputMatVO> updatedInputRows;
	List<InputMatVO> deletedInputRows;

	public List<InputMatVO> getCreatedInputRows() {
		return createdInputRows;
	}

	public void setCreatedInputRows(List<InputMatVO> createdInputRows) {
		this.createdInputRows = createdInputRows;
	}

	public List<InputMatVO> getUpdatedInputRows() {
		return updatedInputRows;
	}

	public void setUpdatedInputRows(List<InputMatVO> updatedInputRows) {
		this.updatedInputRows = updatedInputRows;
	}

	public List<InputMatVO> getDeletedInputRows() {
		return deletedInputRows;
	}

	public void setDeletedInputRows(List<InputMatVO> deletedInputRows) {
		this.deletedInputRows = deletedInputRows;
	}

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
