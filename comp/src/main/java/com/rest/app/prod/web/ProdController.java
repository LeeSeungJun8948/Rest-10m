package com.rest.app.prod.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.prod.service.ProdService;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.InputMatVO;
import com.rest.app.prod.vo.PlanVO;
import com.rest.app.prod.vo.WorkVO;

import lombok.Data;

@Controller
public class ProdController {
	@Autowired
	ProdService svc;

	// 생산계획관리 페이지
	@RequestMapping("managePlan.do")
	public String managePlan() {
		return "prod/managePlan.page";
	}

	// 생산계획조회 모달
	@RequestMapping("planModal.do")
	public String planModal() {
		return "app/prod/planModal";
	}

	// 생산작업관리 페이지
	@RequestMapping("manageWork.do")
	public String manageWork() {
		return "prod/manageWork.page";
	}

	// 생산작업등록 모달
	@RequestMapping("workModal.do")
	public String workModal() {
		return "app/prod/workModal";
	}

	// 생산작업등록 사원검색모달
	@RequestMapping("workEmpModal.do")
	public String workEmpModal() {
		return "app/prod/workEmpModal";
	}

	// 미완료주문 읽기
	@RequestMapping("readUnplanOrders.do")
	@ResponseBody
	public Map<String, Object> readUnplanOrders(@RequestBody Map<String, Object> param) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		if (param.get("planCode") == null) {
			datas.put("contents", svc.getUnplanOrders(param));
		} else {
			datas.put("contents", svc.getDetailPlan(param));
		}
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 계획저장
	@RequestMapping("savePlan.do")
	@ResponseBody
	public Map<String, Object> savePlan(PlanVO vo) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		if (vo.getPlanCode().equals("planCode")) {
			svc.insertPlan(vo);
		} else {
			svc.updatePlan(vo);
		}
		datas.put("contents", vo);
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 계획삭제
	@RequestMapping("deletePlan.do")
	@ResponseBody
	public Map<String, Object> deletePlan(@RequestParam String planCode) {
		Map<String, Object> data = new HashMap<String, Object>();
		svc.deletePlan(planCode);
		svc.deleteAllDetailPlan(planCode);
		svc.deleteAllInputMat(planCode);
		data.put("result", true);
		data.put("check", "save");
		return data;
	}

	// 세부계획 CUD
	@RequestMapping("saveGrid.do")
	@ResponseBody
	public Map<String, Object> saveGrid(@RequestBody GridData gridData) {
		Map<String, Object> data = new HashMap<String, Object>();
		List<DetailPlanVO> cList = gridData.createdRows;
		List<DetailPlanVO> uList = gridData.updatedRows;
		List<DetailPlanVO> dList = gridData.deletedRows;
		cList.forEach(vo -> {
			if (vo.getWorkCount() != 0) {
				svc.insertDetailPlan(vo);
			}
		});
		uList.forEach(vo -> {
			if (vo.getWorkCount() != 0) {
				if (vo.getProductLot() == null) {
					svc.insertDetailPlan(vo);
				} else {
					svc.updateDetailPlan(vo);
				}
			}
		});
		dList.forEach(vo -> {
			if (vo.getProductLot() != null) {
				svc.deleteDetailPlan(vo.getProductLot());
			}
		});
		data.put("result", true);
		data.put("check", "save");
		return data;
	}

	// 투입자재 CUD
	@RequestMapping("saveInput.do")
	@ResponseBody
	public Map<String, Object> saveInput(@RequestBody InputGridData gridData) {
		Map<String, Object> data = new HashMap<String, Object>();
		List<InputMatVO> uList = gridData.updatedRows;

		uList.forEach(vo -> {
			if (vo.getInputIdx() != 0) {
				if (vo.getInputCount() != 0) {
					svc.updateInputMat(vo);
				} else {
					svc.deleteInputMat(vo.getInputIdx());
				}
			} else if (vo.getInputCount() != 0) {
				svc.insertInputMat(vo);
			}
		});
		data.put("result", true);
		data.put("check", "save");
		return data;
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

	// 모달 생산계획검색
	@RequestMapping("searchPlan.do")
	@ResponseBody
	public Map<String, Object> searchPlan(@RequestBody Map<String, Object> param) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("contents", svc.searchPlan(param));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 생산작업 검색
	@RequestMapping("searchWork.do")
	@ResponseBody
	public Map<String, Object> searchWork(@RequestBody Map<String, Object> param) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();

		datas.put("contents", svc.searchWork(param));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 생산작업 삭제
	@RequestMapping("deleteWork.do")
	@ResponseBody
	public Map<String, Object> deleteWork(@RequestBody WorkGridData gridData) {
		List<WorkVO> dList = gridData.deletedRows;
		Map<String, Object> data = new HashMap<String, Object>();
		dList.forEach(vo -> {
			svc.deleteWork(vo.getWorkNo());
		});
		data.put("result", true);
		return data;
	}
}

@Data
class GridData {
	List<DetailPlanVO> createdRows;
	List<DetailPlanVO> updatedRows;
	List<DetailPlanVO> deletedRows;
}

@Data
class InputGridData {
	List<InputMatVO> createdRows;
	List<InputMatVO> updatedRows;
	List<InputMatVO> deletedRows;
}

@Data
class WorkGridData {
	List<WorkVO> createdRows;
	List<WorkVO> updatedRows;
	List<WorkVO> deletedRows;
}