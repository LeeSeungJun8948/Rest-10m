package com.rest.app.prod.web;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rest.app.mat.vo.SelectListVO;
import com.rest.app.prod.service.ProdService;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.DetailProrderVO;
import com.rest.app.prod.vo.ErrorListVO;
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
	@RequestMapping("/pro/mng/managePlan.do")
	public String managePlan() {
		return "prod/managePlan.page";
	}

	// 생산계획 - 조회 모달
	@RequestMapping("/pro/mng/planModal.do")
	public String planModal() {
		return "app/prod/planModal";
	}

	// 모달 생산계획검색
	@RequestMapping("/pro/mng/searchPlan.do")
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
	@RequestMapping("/pro/mng/readUnplanOrders.do")
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
	@RequestMapping("/pro/mng/savePlan.do")
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
	@RequestMapping("/pro/mng/deletePlan.do")
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
	@RequestMapping("/pro/mng/saveDeplan.do")
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
	@RequestMapping("/pro/mng/findProductName.do")
	@ResponseBody
	public String findProductName(String productCode) {
		return svc.findProductName(productCode);
	}

	// 생산계획 조회 페이지
	@RequestMapping("/pro/view/viewPlan.do")
	public String viewPlan() {
		return "prod/viewPlan.page";
	}

	// 생산계획조회 - 검색
	@RequestMapping("/pro/view/viewPlanSearch.do")
	@ResponseBody
	public Map<String, Object> viewPlanSearch(@RequestBody Map<String, Object> param) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("contents", svc.viewPlanSearch(param));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 생산계획 조회 - 엑셀
	@RequestMapping("/pro/view/viewPlanExcel.do")
	public ModelAndView viewPlanExcel(@RequestParam Map<String, Object> param)
			throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> headerMap = new HashMap<String, Object>();
		List<DetailPlanVO> list = svc.viewPlanSearch(param);
		List<Map<String, String>> data = new ArrayList<>();
		for (DetailPlanVO vo : list) {
			data.add(BeanUtils.describe(vo));
		}
		headerMap.put("planDate", "계획일자");
		headerMap.put("planName", "계획명");
		headerMap.put("productCode", "제품코드");
		headerMap.put("productName", "제품명");
		headerMap.put("orderNo", "주문번호");
		headerMap.put("companyName", "업체명");
		headerMap.put("outDate", "납기일자");
		headerMap.put("orderCount", "주문량");
		headerMap.put("planCount", "계획량");
		headerMap.put("workDate", "작업일자");
		headerMap.put("comments", "비고");
		map.put("headerMap", headerMap);
		map.put("filename", "excel_plan");
		map.put("datas", data);
		return new ModelAndView("commonExcelView", map);
	}

	// 생산지시관리 페이지
	@RequestMapping("/pro/mng/manageProrder.do")
	public String manageProrder() {
		return "prod/manageProrder.page";
	}

	// 생산지시 - 조회 모달
	@RequestMapping("/pro/mng/prorModal.do")
	public String prorModal() {
		return "app/prod/prorModal";
	}

	// 생산지시 조회 페이지
	@RequestMapping("/pro/view/viewProrder.do")
	public String viewProrder() {
		return "prod/viewProrder.page";
	}

	// 생산지시조회 - 검색
	@RequestMapping("/pro/view/viewProrderSearch.do")
	@ResponseBody
	public Map<String, Object> viewProrderSearch(@RequestBody Map<String, Object> param) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("contents", svc.viewProrderSearch(param));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 생산지시 조회 - 엑셀
	@RequestMapping("/pro/view/viewProrExcel.do")
	public ModelAndView viewProrExcel(@RequestParam Map<String, Object> param)
			throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> headerMap = new HashMap<String, Object>();
		List<DetailProrderVO> list = svc.viewProrderSearch(param);
		List<Map<String, String>> data = new ArrayList<>();
		for (DetailProrderVO vo : list) {
			data.add(BeanUtils.describe(vo));
		}
		headerMap.put("prorDate", "지시일자");
		headerMap.put("prorName", "지시명");
		headerMap.put("productCode", "제품코드");
		headerMap.put("productName", "제품명");
		headerMap.put("orderNo", "주문번호");
		headerMap.put("companyName", "업체명");
		headerMap.put("outDate", "납기일자");
		headerMap.put("orderCount", "주문량");
		headerMap.put("prorCount", "지시량");
		headerMap.put("workDate", "작업일자");
		headerMap.put("comments", "비고");
		map.put("headerMap", headerMap);
		map.put("filename", "excel_pror");
		map.put("datas", data);
		return new ModelAndView("commonExcelView", map);
	}

	// 모달 생산지시검색
	@RequestMapping("/pro/mng/searchProrder.do")
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
	@RequestMapping("/pro/mng/readUnfinPlans.do")
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
	@RequestMapping("/pro/mng/saveProrder.do")
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
	@RequestMapping("/pro/mng/deleteProrder.do")
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
	@RequestMapping("/pro/mng/saveDetailProrder.do")
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
	@RequestMapping("/pro/mng/getInputMat.do")
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
	@RequestMapping("/pro/mng/saveInput.do")
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
	@RequestMapping("/pro/view/manageWork.do")
	public String manageWork() {
		return "prod/manageWork.page";
	}

	// 작업실적 - 작업검색 모달
	@RequestMapping("/pro/view/workModal.do")
	public String workModal() {
		return "app/prod/workModal";
	}

	// 제품LOT 찾기
	@RequestMapping("/pro/view/selectDetailProrder.do")
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
	@RequestMapping("/pro/view/workEmpModal.do")
	public String workEmpModal() {
		return "app/prod/workEmpModal";
	}

	// 작업자 검색
	@RequestMapping("/pro/view/ajax/workEmpModal.do")
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
	@RequestMapping("/pro/view/workErrorModal.do")
	public String workErrorModal() {
		return "app/prod/workErrorModal";
	}

	// 작업자 검색
	@RequestMapping("/pro/view/ajax/workErrorModal.do")
	@ResponseBody
	public Map<String, Object> ajaxWorkErrorModal(@RequestBody Map<String, Object> param) {
		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		data.put("result", true);
		datas.put("contents", svc.searchError(param));
		data.put("data", datas);
		return data;
	}

	// 작업실적 - 불량코드 모달
	@RequestMapping("/pro/view/workFacModal.do")
	public String workFacModal() {
		return "app/prod/workFacModal";
	}

	// 작업자 검색
	@RequestMapping("/pro/view/ajax/workFacModal.do")
	@ResponseBody
	public Map<String, Object> ajaxWorkFacModal(@RequestBody Map<String, Object> param) {
		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		data.put("result", true);
		datas.put("contents", svc.searchFac(param));
		data.put("data", datas);
		return data;
	}

	// 작업실적 저장
	@RequestMapping("/pro/view/saveWork.do")
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
	@RequestMapping("/pro/view/viewWork.do")
	public String viewWork() {
		return "prod/viewWork.page";
	}

	// 작업 검색
	@RequestMapping("/pro/view/searchWork.do")
	@ResponseBody
	public Map<String, Object> searchWork(@RequestBody Map<String, Object> param) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();

		datas.put("contents", svc.searchWork(param));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 작업실적 조회 - 엑셀
	@RequestMapping("/pro/view/viewWorkExcel.do")
	public ModelAndView viewWorkExcel(@RequestParam Map<String, Object> param)
			throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> headerMap = new HashMap<String, Object>();
		List<WorkVO> list = svc.searchWork(param);
		List<Map<String, String>> data = new ArrayList<>();
		for (WorkVO vo : list) {
			data.add(BeanUtils.describe(vo));
		}
		headerMap.put("prorDate", "지시일자");
		headerMap.put("prorName", "지시명");
		headerMap.put("productCode", "제품코드");
		headerMap.put("productName", "제품명");
		headerMap.put("productLot", "제품LOT");
		headerMap.put("workCode", "작업번호");
		headerMap.put("empCode", "사원번호");
		headerMap.put("employeeName", "사원명");
		headerMap.put("processCode", "공정코드");
		headerMap.put("processName", "공정명");
		headerMap.put("workCount", "작업량");
		headerMap.put("errorCount", "불량량");
		headerMap.put("errorCode", "불량코드");
		headerMap.put("errorName", "불량명");
		headerMap.put("workDate", "작업일자");
		headerMap.put("startTime", "시작시간");
		headerMap.put("endTime", "종료시간");
		headerMap.put("facCode", "설비코드");
		headerMap.put("facilitiesName", "설비명");
		headerMap.put("prorCode", "지시번호");
		map.put("headerMap", headerMap);
		map.put("filename", "excel_work");
		map.put("datas", data);
		return new ModelAndView("commonExcelView", map);
	}

	// 작업삭제
	@RequestMapping("/pro/view/deleteWork.do")
	@ResponseBody
	public Map<String, Object> deleteWork(@RequestParam String workCode) {
		Map<String, Object> data = new HashMap<String, Object>();
		svc.deleteWork(workCode);
		data.put("result", true);
		data.put("check", "save");
		return data;
	}

	// 업체검색 모달
	@RequestMapping("/pro/view/compSearchModal.do")
	public String compSearchModal() {
		return "app/prod/compSearchModal";
	}

	// 업체검색
	@RequestMapping("/pro/view/ajax/compSearchModal.do")
	@ResponseBody
	public Map<String, Object> ajaxCompSearchModal(SelectListVO vo) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();

		datas.put("contents", svc.ajaxCompSearchModal(vo));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 제품검색 모달
	@RequestMapping("/pro/view/prodSearchModal.do")
	public String prodSearchModal() {
		return "app/prod/prodSearchModal";
	}

	// 제품검색
	@RequestMapping("/pro/view/ajax/prodSearchModal.do")
	@ResponseBody
	public Map<String, Object> ajaxProdSearchModal(SelectListVO vo) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();

		datas.put("contents", svc.ajaxProdSearchModal(vo));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 불량내역조회 페이지
	@RequestMapping("/pro/view/detailErrorList.do")
	public String errorList() {
		return "prod/errorList.page";
	}

	// 불량리스트
	@RequestMapping("/pro/view/ajax/detailErrorList.do")
	@ResponseBody
	public Map<String, Object> ajaxGeterrorList(ErrorListVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", svc.getErrorList(vo));
		data.put("data", datas);
		return data;
	}

	// 불량내역 조회 - 엑셀
	@RequestMapping("/pro/view/viewErrorExcel.do")
	public ModelAndView viewErrorExcel(ErrorListVO vo)
			throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> headerMap = new HashMap<String, Object>();
		List<ErrorListVO> list = svc.getErrorList(vo);
		List<Map<String, String>> data = new ArrayList<>();
		for (ErrorListVO errorVO : list) {
			data.add(BeanUtils.describe(errorVO));
		}
		headerMap.put("processName", "공정명");
		headerMap.put("workDate", "작업일자");
		headerMap.put("workCount", "작업량");
		headerMap.put("errorCount", "불량량");
		headerMap.put("productCode", "제품코드");
		headerMap.put("productName", "제품명");
		headerMap.put("productLot", "제품LOT");
		headerMap.put("workCode", "작업번호");
		headerMap.put("errorCode", "불량코드");
		map.put("headerMap", headerMap);
		map.put("filename", "excel_error");
		map.put("datas", data);
		return new ModelAndView("commonExcelView", map);
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