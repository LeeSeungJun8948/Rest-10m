package com.rest.app.bus.web;

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

import com.rest.app.bus.service.BusinessService;
import com.rest.app.bus.vo.DetailExportVO;
import com.rest.app.bus.vo.ExportVO;
import com.rest.app.mat.vo.SelectListVO;

import lombok.Data;

@Data
class GridData {
	List<DetailExportVO> createdRows;
	List<DetailExportVO> updatedRows;
	List<DetailExportVO> deletedRows;
}

@Controller
public class BusinessController {

	@Autowired
	BusinessService dao;

	@RequestMapping("busList.do") // 주문관리참조조회
	public String business(Model model) {
		return "bus/busList.page";
	}

//	@RequestMapping("/ajax/busList.do")
//	@ResponseBody
//	public List<OrdersVO> ajaxGetBus(Model model) {
//		// TODO Auto-generated method stub
//		return dao.getBus();
//	}
	
	@RequestMapping("/ajax/busList.do")
	@ResponseBody
	public Map<String, Object> busList(@RequestBody Map<String, Object> param) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getBus(param));
		data.put("data", datas);
		return data;
	}

	@RequestMapping("exportForm.do") // 출고관리페이지
	public String exportForm(Model model) {
		return "bus/exportForm.page";
	}


	// 출고 모달 그리드 데이터 리턴
		@RequestMapping("/ajax/readExportModal.do")
		@ResponseBody
		public Map<String, Object> ajaxReadExportModal(@RequestBody Map<String, Object> param) { // 자재 요약 리스트 출력
			
			Map<String,Object> datas = new HashMap<>();
			Map<String,Object> data = new HashMap<>();
			data.put("result", true);
			datas.put("contents", dao.getExportModal(param));
			data.put("data", datas);
			
			return data;
		}
	// 미출고 검색 그리드
	@RequestMapping("readUnExport.do")
	@ResponseBody
	public Map<String, Object> ajaxUnExport(@RequestBody Map<String, Object> param) {
		System.out.println("=============");
		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		if (param.get("planCode") == null) {
			datas.put("contents", dao.getUnExport(param));
		}else {
			datas.put("contents", dao.getUnExport(param));
		}
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 계획저장
	@RequestMapping("saveExport.do")
	@ResponseBody
	public Map<String, Object> saveExport(ExportVO vo) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		if (vo.getExportCode().equals("exportCode")) {
			dao.insertExport(vo);
		} else {
			dao.updateExport(vo);
		}
		datas.put("contents", vo);
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 계획삭제
	@RequestMapping("deleteExport.do")
	@ResponseBody
	public Map<String, Object> deleteExport(@RequestParam String ExportCode) {
		Map<String, Object> data = new HashMap<String, Object>();
		dao.deleteExport(ExportCode);
		dao.deleteAllDetailExport(ExportCode);
		data.put("result", true);
		data.put("check", "save");
		return data;
	}

	// 세부계획 CUD
	@RequestMapping("saveDetailExport.do")
	@ResponseBody
	public Map<String, Object> saveDetailExport(@RequestBody GridData gridData) {
		Map<String, Object> data = new HashMap<String, Object>();
		List<DetailExportVO> cList = gridData.createdRows;
		List<DetailExportVO> uList = gridData.updatedRows;
		List<DetailExportVO> dList = gridData.deletedRows;
		cList.forEach(vo -> {
			if (vo.getExportCount() != 0) {
				dao.insertDetailExport(vo);
			}
		});
		uList.forEach(vo -> {
			if (vo.getExportCount() != 0) {
				if (vo.getIdx() == 0) {
					dao.insertDetailExport(vo);
				} else {
					dao.updateDetailExport(vo);
				}
			}
		});
		dList.forEach(vo -> {
			if (vo.getIdx() != 0) {
				dao.deleteDetailExport(vo.getIdx());
			}
		});
		data.put("result", true);
		data.put("check", "save");
		return data;
	}

	// 일 출고List모달
	@RequestMapping("ExportModal.do")
	public String Exportmodal() {
		return "app/bus/exportModal";
	}

	@RequestMapping("productInventory.do") // 제품재고관리페이지
	public String productInventory(Model model) {
		return "bus/productInventory.page";
	}

	// 제품재고관리
	@RequestMapping("/ajax/productInventory.do")
	@ResponseBody
	public Map<String, Object> productInventory(@RequestBody Map<String, Object> param) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getProInventory(param));
		data.put("data", datas);
		return data;
	}
}
