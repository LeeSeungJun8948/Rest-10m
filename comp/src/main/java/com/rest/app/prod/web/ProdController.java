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
import com.rest.app.prod.vo.DetailProrderVO;
import com.rest.app.prod.vo.InputMatVO;
import com.rest.app.prod.vo.PlanVO;
import com.rest.app.prod.vo.ProrderVO;
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

	// 생산계획 - 조회 모달
	@RequestMapping("planModal.do")
	public String planModal() {
		return "app/prod/planModal";
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
		data.put("result", true);
		data.put("check", "save");
		return data;
	}

	// 세부계획 CUD
	@RequestMapping("saveDeplan.do")
	@ResponseBody
	public Map<String, Object> saveDeplan(@RequestBody GridData gridData) {
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
				if (vo.getDeplanIdx() == 0) {
					svc.insertDetailPlan(vo);
				} else {
					svc.updateDetailPlan(vo);
				}
			} else {
				if (vo.getDeplanIdx() != 0) {
					svc.deleteDetailPlan(vo.getDeplanIdx());
				}
			}
		});
		dList.forEach(vo -> {
			if (vo.getDeplanIdx() != 0) {
				svc.deleteDetailPlan(vo.getDeplanIdx());
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

	// 생산지시관리 페이지
	@RequestMapping("manageProrder.do")
	public String manageProrder() {
		return "prod/manageProrder.page";
	}

	// 생산지시 - 조회 모달
	@RequestMapping("prorModal.do")
	public String prorModal() {
		return "app/prod/prorModal";
	}

	// 모달 생산지시검색
	@RequestMapping("searchProrder.do")
	@ResponseBody
	public Map<String, Object> searchProrder(@RequestBody Map<String, Object> param) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("contents", svc.searchProrder(param));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 미완료계획 읽기
	@RequestMapping("readUnfinPlans.do")
	@ResponseBody
	public Map<String, Object> readUnfinPlans(@RequestBody Map<String, Object> param) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		if (param.get("prorCode") == null) {
			datas.put("contents", svc.getUnfinPlans(param));
		} else {
			datas.put("contents", svc.getDetailProrder(param));
		}
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 지시저장
	@RequestMapping("saveProrder.do")
	@ResponseBody
	public Map<String, Object> saveProrder(ProrderVO vo) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		if (vo.getProrCode().equals("prorCode")) {
			svc.insertProrder(vo);
		} else {
			svc.updateProrder(vo);
		}
		datas.put("contents", vo);
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 지시삭제
	@RequestMapping("deleteProrder.do")
	@ResponseBody
	public Map<String, Object> deleteProrder(@RequestParam String prorCode) {
		Map<String, Object> data = new HashMap<String, Object>();
		svc.deleteProrder(prorCode);
		svc.deleteAllDetailProrder(prorCode);
		svc.deleteAllInputMat(prorCode);
		data.put("result", true);
		data.put("check", "save");
		return data;
	}

	// 세부지시 CUD
	@RequestMapping("saveDetailProrder.do")
	@ResponseBody
	public Map<String, Object> saveDetailProrder(@RequestBody ProrGridData gridData) {
		Map<String, Object> data = new HashMap<String, Object>();
		List<DetailProrderVO> cList = gridData.createdRows;
		List<DetailProrderVO> uList = gridData.updatedRows;
		List<DetailProrderVO> dList = gridData.deletedRows;
		cList.forEach(vo -> {
			if (vo.getWorkCount() != 0) {
				svc.insertDetailProrder(vo);
			}
		});
		uList.forEach(vo -> {
			if (vo.getWorkCount() != 0) {
				if (vo.getProductLot() == null) {
					svc.insertDetailProrder(vo);
				} else {
					svc.updateDetailProrder(vo);
				}
			} else {
				if (vo.getProductLot() != null) {
					svc.deleteDetailProrder(vo.getProductLot());
				}
			}
		});
		dList.forEach(vo -> {
			if (vo.getProductLot() != null) {
				svc.deleteDetailProrder(vo.getProductLot());
			}
		});
		data.put("result", true);
		data.put("check", "save");
		return data;
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

	// 작업실적관리 페이지
	@RequestMapping("manageWork.do")
	public String manageWork() {
		return "prod/manageWork.page";
	}

	// 작업실적 - 작업검색 모달
	@RequestMapping("workModal.do")
	public String workModal() {
		return "app/prod/workModal";
	}

	// 제품LOT 찾기
	@RequestMapping("selectDetailProrder.do")
	@ResponseBody
	public Map<String, Object> selectDetailProrder(String productLot) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("contents", svc.selectDetailProrder(productLot));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 작업실적 - 작업자 모달
	@RequestMapping("workEmpModal.do")
	public String workEmpModal() {
		return "app/prod/workEmpModal";
	}

	// 작업자 검색
	@RequestMapping("/ajax/workEmpModal.do")
	@ResponseBody
	public Map<String, Object> ajaxWorkEmpModal(@RequestBody Map<String, Object> param) {
		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		data.put("result", true);
		datas.put("contents", svc.searchEmp(param));
		data.put("data", datas);
		return data;
	}

	// 작업실적 - 불량코드 모달
	@RequestMapping("workErrorModal.do")
	public String workErrorModal() {
		return "app/prod/workErrorModal";
	}

	// 작업자 검색
	@RequestMapping("/ajax/workErrorModal.do")
	@ResponseBody
	public Map<String, Object> ajaxWorkErrorModal(@RequestBody Map<String, Object> param) {
		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		data.put("result", true);
		datas.put("contents", svc.searchError(param));
		data.put("data", datas);
		return data;
	}

	// 작업실적 저장
	@RequestMapping("saveWork.do")
	@ResponseBody
	public Map<String, Object> saveWork(WorkVO vo) {
		Map<String, Object> data = new HashMap<>();
		Map<String, Object> datas = new HashMap<String, Object>();
		if (vo.getWorkCode() == null || vo.getWorkCode().equals("")) {
			svc.insertWork(vo);
		} else {
			svc.updateWork(vo);
		}
		datas.put("contents", vo);
		data.put("data", datas);
		data.put("result", true);
		return data;
	}

	// 작업실적조회 페이지
	@RequestMapping("viewWork.do")
	public String viewWork() {
		return "prod/viewWork.page";
	}

	// 작업 검색
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

	// 작업삭제
	@RequestMapping("deleteWork.do")
	@ResponseBody
	public Map<String, Object> deleteWork(@RequestParam String workCode) {
		Map<String, Object> data = new HashMap<String, Object>();
		svc.deleteWork(workCode);
		data.put("result", true);
		data.put("check", "save");
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
class ProrGridData {
	List<DetailProrderVO> createdRows;
	List<DetailProrderVO> updatedRows;
	List<DetailProrderVO> deletedRows;
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