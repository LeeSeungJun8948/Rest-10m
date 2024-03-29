package com.rest.app.modal;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.bus.vo.ExportLotVO;
import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.service.BomService;
import com.rest.app.comm.vo.BomVO;
import com.rest.app.mat.service.MaterialService;
import com.rest.app.mat.vo.InorderVO;
import com.rest.app.mat.vo.SelectListVO;

@Controller
public class ModalController {

	@Autowired
	MaterialService dao;
	@Autowired
	BomService bDao;
	
	// 자재검색 모달 페이지 리턴
	@RequestMapping("/modal/matModal.do")
	public String matModal() {
		return "app/modal/matModal";
	}

	// 자재검색 모달 그리드 데이터 리턴
	@RequestMapping("/ajax/matListModal.do")
	@ResponseBody
	public Map<String, Object> ajaxMatListModal(Model model, SelectListVO vo) { // 자재 요약 리스트 출력

		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		System.out.println(vo.getKeyword());
		data.put("result", true);
		datas.put("contents", dao.getMatListModal(vo));
		data.put("data", datas);

		return data;
	}

	// 공정검색 모달 페이지 리턴
	@RequestMapping("/modal/procModal.do")
	public String procModal() {
		return "app/modal/procModal";
	}

	// 공정검색 모달 그리드 데이터 리턴
	@RequestMapping("/ajax/procListModal.do")
	@ResponseBody
	public Map<String, Object> ajaxProcListModal(Model model, SelectListVO vo) { // 공정 요약 리스트 출력

		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		System.out.println(vo.getKeyword());
		data.put("result", true);
		datas.put("contents", dao.getProcListModal(vo));
		data.put("data", datas);

		return data;
	}

	// 자재별 LOT목록 검색 모달 페이지 리턴
	@RequestMapping("/modal/matLotModal.do")
	public String matLotModal() {
		return "app/modal/matLotModal";
	}

	// 자재별 LOT목록 모달 그리드 데이터 리턴
	@RequestMapping("/ajax/matLotListModal.do")
	@ResponseBody
	public Map<String, Object> ajaxMatLotListModal(Model model, SelectListVO vo) { // 공정 요약 리스트 출력

		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		System.out.println(vo.getKeyword());
		data.put("result", true);
		datas.put("contents", dao.getMatLotListModal(vo));
		data.put("data", datas);

		return data;
	}

	// 업체검색 모달 페이지 리턴
	@RequestMapping("/modal/compModal.do")
	public String compModal() {
		return "app/modal/compModal";
	}

	// 업체구분에서 전체/주문업체를 위한 구분
	@RequestMapping("/modal/compModalForProd.do")
	public String compModalForProd() {
		return "app/modal/compModalForProd";
	}

	// 업체목록 모달 그리드 데이터 리턴
	@RequestMapping("/ajax/compListModal.do")
	@ResponseBody
	public Map<String, Object> ajaxCompListModal(Model model, SelectListVO vo) { // 공정 요약 리스트 출력

		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		System.out.println(vo.getKeyword());
		data.put("result", true);
		datas.put("contents", dao.getCompListModal(vo));
		data.put("data", datas);

		return data;
	}

	// 발주검색 모달 페이지 리턴
	@RequestMapping("/modal/inorderModal.do")
	public String inorderModal() {
		return "app/modal/inorderModal";
	}

	// 발주목록 모달 그리드 데이터 리턴
	@RequestMapping("/ajax/inorderListModal.do")
	@ResponseBody
	public Map<String, Object> ajaxInorderListModal(Model model, InorderVO vo) { // 발주목록

		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		System.out.println(vo.getKeyword());
		data.put("result", true);
		datas.put("contents", dao.getInorderListModal(vo));
		data.put("data", datas);

		return data;
	}

	// 규격리스트 모달
	@RequestMapping("/modal/productModal.do")
	public String productModal() {
		return "app/modal/productModal";
	}

	// 단위리스트 모달
	@RequestMapping("/modal/unitModal.do")
	public String unitModal() {
		return "app/modal/unitModal";
	}

	// qc모달
	@RequestMapping("/modal/qcModal.do")
	public String QcModal() {
		return "app/modal/qcModal";
	}

	// 제품검색 모달 페이지 리턴
	@RequestMapping("/modal/prodModal.do")
	public String prodModal() {
		return "app/modal/prodModal";
	}

	// 제품검색 모달 그리드 데이터 리턴
	@RequestMapping("/ajax/prodListModal.do")
	@ResponseBody
	public Map<String, Object> ajaxProdListModal(Model model, SelectListVO vo) { // 공정 요약 리스트 출력
		System.out.println("====================");
		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		System.out.println(vo.getKeyword());
		data.put("result", true);
		datas.put("contents", dao.getProdListModal(vo));
		data.put("data", datas);

		return data;
	}
	@RequestMapping("/modal/matCodeModal.do")
	public String matCodeModal() {
		return "app/modal/matCodeModal";
	}
	
	
	// Bom 소요자재 그리드 자재코드/코드명 데이터 리턴
	@RequestMapping("/ajax/matCodeModal.do")
	@ResponseBody
	public Map<String, Object> ajaxMatCodeModal(Model model, BomVO vo) { 
		System.out.println("====================");
		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		
		data.put("result", true);
		datas.put("contents", bDao.matCodeList(vo));
		data.put("data", datas);

		return data;
	}


}
