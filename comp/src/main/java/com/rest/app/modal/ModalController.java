package com.rest.app.modal;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.mat.service.MaterialService;
import com.rest.app.mat.vo.SelectListVO;

@Controller
public class ModalController {

	@Autowired
	MaterialService dao;

	// 자재검색 모달 페이지 리턴
	@RequestMapping("/matModal.do")
	public String matModal() {
		return "app/modal/matModal";
	}

	// 자재검색 모달 그리드 데이터 리턴
	@RequestMapping("/ajax/matListModal.do")
	@ResponseBody
	public Map<String, Object> ajaxMatListModal(Model model, SelectListVO vo) { // 자재 요약 리스트 출력
		
		Map<String,Object> datas = new HashMap<>();
		Map<String,Object> data = new HashMap<>();
		
		System.out.println(vo.getKeyword());
		data.put("result", true);
		datas.put("contents", dao.getMatListModal(vo));
		data.put("data", datas);
		
		return data;
	}
	
	// 공정검색 모달 페이지 리턴
	@RequestMapping("/procModal.do")
	public String procModal() {
		return "app/modal/procModal";
	}
	
	// 공정검색 모달 그리드 데이터 리턴
	@RequestMapping("/ajax/procListModal.do")
	@ResponseBody
	public Map<String, Object> ajaxProcListModal(Model model, SelectListVO vo) { // 공정 요약 리스트 출력
		
		Map<String,Object> datas = new HashMap<>();
		Map<String,Object> data = new HashMap<>();
		
		System.out.println(vo.getKeyword());
		data.put("result", true);
		datas.put("contents", dao.getProcListModal(vo));
		data.put("data", datas);
		
		return data;
	}
	
	// 자재별 LOT목록 검색 모달 페이지 리턴
	@RequestMapping("/matLotModal.do")
	public String matLotModal() {
		return "app/modal/matLotModal";
	}
	
	// 자재별 LOT목록 모달 그리드 데이터 리턴
	@RequestMapping("/ajax/matLotListModal.do")
	@ResponseBody
	public Map<String, Object> ajaxMatLotListModal(Model model, SelectListVO vo) { // 공정 요약 리스트 출력
		
		Map<String,Object> datas = new HashMap<>();
		Map<String,Object> data = new HashMap<>();
		
		System.out.println(vo.getKeyword());
		data.put("result", true);
		datas.put("contents", dao.getMatLotListModal(vo));
		data.put("data", datas);
		
		return data;
	}
	
	// 업체검색 모달 페이지 리턴
	@RequestMapping("/compModal.do")
	public String compModal() {
		return "app/modal/compModal";
	}
	
	// 업체구분에서 전체/주문업체를 위한 구분
	@RequestMapping("/compModalForProd.do")
	public String compModalForProd() {
		return "app/modal/compModalForProd";
	}
	
	// 업체목록 모달 그리드 데이터 리턴
	@RequestMapping("/ajax/compListModal.do")
	@ResponseBody
	public Map<String, Object> ajaxCompListModal(Model model, SelectListVO vo) { // 공정 요약 리스트 출력
		
		Map<String,Object> datas = new HashMap<>();
		Map<String,Object> data = new HashMap<>();
		
		System.out.println(vo.getKeyword());
		data.put("result", true);
		datas.put("contents", dao.getCompListModal(vo));
		data.put("data", datas);
		
		return data;
	}
	
	//규격,단위 리스트 모달
	@RequestMapping("/productModal.do")
	public String productModal() {
			
	return "app/modal/productModal";
	}
	
	//qc모달
	@RequestMapping("qcModal.do")
	public String QcModal() {
		
		return "app/modal/qcModal";
		}
	
}
