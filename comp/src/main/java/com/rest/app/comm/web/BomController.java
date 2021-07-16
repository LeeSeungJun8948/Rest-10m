package com.rest.app.comm.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rest.app.comm.service.BomService;
import com.rest.app.comm.service.ProcessService;
import com.rest.app.comm.vo.BomVO;
import com.rest.app.comm.vo.ProcessVO;

import lombok.Data;

@Data
class BomGridData {
	List<BomVO> deletedRows;
	List<BomVO> updatedRows;
	List<BomVO> createdRows;
}

@Data
class ProGridData {
	List<ProcessVO> deletedRows;
	List<ProcessVO> updatedRows;
	List<ProcessVO> createdRows;
}

@Controller
public class BomController {

	@Autowired
	BomService dao;
	@Autowired
	ProcessService pdao;

	@RequestMapping("/comm/commList.do")
	public String commList() {
		return "/sym/ccm/cde/SelectCcmCmmnDetailCodeList.do";
	}

	// 공정모달
	@RequestMapping("/comm/proModal.do")
	public String proModal() {
		return "app/comm/proModal";
	}

	@RequestMapping("/comm/main.do")
	public String main(Model model) {
		return "comm/main.page";
	}

	// 제품코드,제품명,규격 리스트 (모달)
	@RequestMapping("/comm/bomList.do")
	public String getProduct(Model model, BomVO vo) {
		return "comm/bomList.page";
	}

	// 제품코드,제품명,규격 리스트 ajax
	@RequestMapping("/comm/ajax/bomList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetBomList(BomVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getProduct(vo));
		data.put("data", datas);
		return data;
	}

	// 모달
	@RequestMapping("/comm/modal.do")
	public String modal() {
		return "app/comm/modal";
	}

	// 제품 조회 , 소요자재조회
	@RequestMapping("/comm/getInfoProduct.do")
	public ModelAndView getInfoProduct(Model model, BomVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/comm/bomList.page");
		mv.addObject("info", dao.getInfoProduct(vo)); // 제품 단건조회
		mv.addObject("compList", dao.getCompanyList(vo)); // 제품에 대한 고객사명 리스트
		mv.addObject("binfo", dao.getInfoBom(vo)); // 소요자재 조회
		return mv;
	}

	// ajax 소요자재조회
	@RequestMapping("/comm/ajax/getInfoProduct.do")
	@ResponseBody
	public Map<String, Object> ajaxgetInfoProduct(BomVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getInfoBom(vo));
		data.put("data", datas);
		return data;
	}

	// 자재명 불러오기
	@RequestMapping("/ajax/getMatName.do")
	@ResponseBody
	public BomVO ajaxgetMatNameT(Model model, BomVO vo) {
		return dao.getMatName(vo);
	}

	// 공정명 불러오기
	@RequestMapping("/ajax/getProName.do")
	@ResponseBody
	public BomVO ajaxgetProName(Model model, BomVO vo) {
		return dao.getProName(vo);
	}

	// 소요자재 추가
	@PostMapping(value = "/ajax/insertBom.do")
	@ResponseBody
	public Map<String, Object> insertBom(@RequestBody BomGridData bomGridData) {
		Map<String, Object> data = new HashMap<String, Object>();
		dao.insertBom(bomGridData.createdRows.get(0));
		data.put("result", true);
		data.put("data", bomGridData.createdRows);
		return data;
	}

	// 소요자재 수정
	@PutMapping(value = "/comm/ajax/updateBom.do")
	@ResponseBody
	public Map<String, Object> updateBom(@RequestBody BomGridData bomGridData) {

		Map<String, Object> data = new HashMap<String, Object>();
		for (int i = 0; i < bomGridData.updatedRows.size(); i++) {
			dao.updateBom(bomGridData.updatedRows.get(i));
		}
		data.put("result", true);
		data.put("data", bomGridData.updatedRows);
		return data;
	}

	@PutMapping(value = "/comm/ajax/modifyBom.do")
	@ResponseBody
	public Map<String, Object> modifyBom(@RequestBody BomGridData bomGridData) {
		Map<String, Object> data = new HashMap<String, Object>();

		System.out.println(bomGridData.createdRows.size() + "++++++++++++++++");
		System.out.println(bomGridData.updatedRows.size());
		for (int i = 0; i < bomGridData.createdRows.size(); i++) {
			dao.insertBom(bomGridData.createdRows.get(i));
		}
		for (int i = 0; i < bomGridData.updatedRows.size(); i++) {
			dao.updateBom(bomGridData.updatedRows.get(i));
		}
		data.put("result", true);
		data.put("data", bomGridData.createdRows);
		data.put("data", bomGridData.updatedRows);
		return data;
	}

	// 입출력 행 추가시 불러올 제품코드
	@RequestMapping("/comm/ajax/getNewProductCode.do")
	@ResponseBody
	public BomVO getNewProductCode(BomVO vo) {
		return dao.getNewProductCode();
	}

	// 소요자재 삭제
	@PostMapping(value = "/comm/ajax/deleteBom.do")
	@ResponseBody
	public Map deleteBom(@RequestBody BomGridData bomGirdData) {
		Map<String, Object> data = new HashMap();
		for (int i = 0; i < bomGirdData.deletedRows.size(); i++) {
			dao.deleteBom(bomGirdData.deletedRows.get(i));
		}
		data.put("result", true);
		data.put("data", bomGirdData.deletedRows);
		return data;
	}

	// Bom 삭제
	@RequestMapping("/comm/deleteBom.do")
	public String deleteBom(BomVO vo) {
		dao.deleteBom(vo);
		return "comm/bomList.page";
	}

	// 공정리스트
	@RequestMapping("/comm/processList.do")
	public String processList(Model model, ProcessVO vo) {
		
		return "comm/processList.page";
	}
	//max 공정코드
	@RequestMapping("/comm/ajax/maxProcessCode.do")
	@ResponseBody
	public ProcessVO maxProcessCode(ProcessVO vo) {
		
		return pdao.maxProcessCode();
	}

	// 공정리스트 ajax
	@RequestMapping("/comm/ajax/processList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetprocessList(ProcessVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", pdao.getProcessList(vo));
		data.put("data", datas);
		return data;
	}

	// 공정 추가
	@PostMapping(value = "/comm/ajax/insertProcess.do")
	@ResponseBody
	public Map<String, Object> insertProcess(@RequestBody ProGridData ProGridData) {
		Map<String, Object> data = new HashMap<String, Object>();
		pdao.insertProcess(ProGridData.createdRows.get(0));
		data.put("result", true);
		data.put("data", ProGridData.createdRows);
		return data;
	}

	// 공정 수정
	@PutMapping(value = "/comm/ajax/updateProcess.do")
	@ResponseBody
	public Map<String, Object> updateProcess(@RequestBody ProGridData ProGridData) {

		Map<String, Object> data = new HashMap<String, Object>();
		for (int i = 0; i < ProGridData.updatedRows.size(); i++) {
			pdao.updateProcess(ProGridData.updatedRows.get(i));
		}
		data.put("result", true);
		data.put("data", ProGridData.updatedRows);
		return data;
	}

	@PutMapping(value = "/comm/ajax/modifyProcess.do")
	@ResponseBody
	public Map<String, Object> modifyProcess(@RequestBody ProGridData ProGridData) {
		Map<String, Object> data = new HashMap<String, Object>();

		System.out.println(ProGridData.updatedRows.size());
		for (int i = 0; i < ProGridData.createdRows.size(); i++) {
			pdao.insertProcess(ProGridData.createdRows.get(i));
		}
		for (int i = 0; i < ProGridData.updatedRows.size(); i++) {
			pdao.updateProcess(ProGridData.updatedRows.get(i));
		}
		data.put("result", true);
		data.put("data", ProGridData.createdRows);
		data.put("data", ProGridData.updatedRows);
		return data;
	}

	// 공정삭제
	@PostMapping(value = "/comm/ajax/deleteProcess.do")
	@ResponseBody
	public Map deleteProcess(@RequestBody ProGridData ProGridData) {
		Map<String, Object> data = new HashMap();
		for (int i = 0; i < ProGridData.deletedRows.size(); i++) {
			pdao.deleteProcess(ProGridData.deletedRows.get(i));
		}
		data.put("result", true);
		data.put("data", ProGridData.deletedRows);
		return data;
	}
	// 회사명조회
	@RequestMapping("/comm/getCompName.do")
	public ModelAndView getCompName(Model model, ProcessVO vo) {
		ModelAndView comMv = new ModelAndView();
		comMv.setViewName("/comm/processList.page");
		comMv.addObject("cName", pdao.getCompName(vo)); // 화사명
		
		return comMv;
	}
	
	
	// 회사리스트
	@RequestMapping("/comm/ajax/getCompList.do")
	@ResponseBody
	public Map<String, Object> ajaxgetCompList(ProcessVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", pdao.getCompList(vo));
		data.put("data", datas);
		return data;
	}
}
