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
import com.rest.app.bus.vo.ExportLotVO;
import com.rest.app.bus.vo.ExportVO;

import lombok.Data;

@Data
class GridData {
	List<DetailExportVO> createdRows;
	List<DetailExportVO> updatedRows;
	List<DetailExportVO> deletedRows;
}

@Data
class ExportLotGridData {
	List<ExportLotVO> createdRows;
	List<ExportLotVO> updatedRows;
	List<ExportLotVO> deletedRows;
}

@Controller
public class BusinessController {

	@Autowired
	BusinessService dao;

	@RequestMapping("bus/view/busList.do") // 주문관리참조조회
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

	@RequestMapping("bus/mng/exportForm.do") // 출고관리페이지
	public String exportForm(Model model) {
		return "bus/exportForm.page";
	}

	// 출고관리 - 조회 모달
	@RequestMapping("/exportModal.do")
	public String getExportModal() {
		return "app/bus/exportModal";
	}

	// 모달 출고검색
	@RequestMapping("/ajax/searchExport.do")
	@ResponseBody
	public Map<String, Object> searchExport(@RequestBody Map<String, Object> param) {
		System.out.println(param + "----");
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("contents", dao.searchExport(param));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 미출고 검색 그리드
	@RequestMapping("/ajax/readUnExport.do")
	@ResponseBody
	public Map<String, Object> ajaxUnExport(@RequestBody Map<String, Object> param) {
		System.out.println("=============");
		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		if (param.get("exportCode") == null) {
			datas.put("contents", dao.getUnExport(param));
		} else {
			datas.put("contents", dao.getDetailExport(param));
		}
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	// 출고저장
	@RequestMapping("/ajax/saveExport.do")
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

	// 출고삭제
	@RequestMapping("/ajax/deleteExport.do")
	@ResponseBody
	public Map<String, Object> deleteExport(@RequestParam String exportCode) {
		Map<String, Object> data = new HashMap<String, Object>();
		dao.deleteExport(exportCode);
		dao.deleteAllDetailExport(exportCode);
		dao.deleteAllExportLot(exportCode);
		data.put("result", true);
		data.put("check", "save");
		return data;
	}

	// 세부출고 CUD
	@RequestMapping("/ajax/saveDetailExport.do")
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
				if (vo.getDeIdx() == 0) {
					dao.insertDetailExport(vo);
				} else {
					dao.updateDetailExport(vo);
				}
			}
		});
		dList.forEach(vo -> {
			if (vo.getDeIdx() != 0) {
				dao.deleteDetailExport(vo.getDeIdx());
			}
		});
		data.put("result", true);
		data.put("check", "save");
		return data;
	}

	// 제품LOT별 재고량리스트 가져오기
	@RequestMapping("/ajax/getExportLot.do")
	@ResponseBody
	public Map<String, Object> getExportLot(@RequestBody Map<String, Object> param) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("contents", dao.readExportLot(param));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}

	//제품 lot CUD
	@RequestMapping("/ajax/saveExportLot.do")
	@ResponseBody
	public Map<String, Object> saveExportLot(@RequestBody ExportLotGridData gridData) {
		Map<String, Object> data = new HashMap<String, Object>();
		List<ExportLotVO> uList = gridData.updatedRows;

		uList.forEach(vo -> {
			if (vo.getLotIdx() != 0) {
				if (vo.getExportCount() != 0) {
					dao.updateExportLot(vo);
				} else {
					dao.deleteExportLot(vo.getLotIdx());
				}
			} else if (vo.getExportCount() != 0) {
				dao.insertExportLot(vo);
			}
		});
		data.put("result", true);
		data.put("check", "save");
		return data;
	}

	@RequestMapping("bus/view/productInventory.do") // 제품재고 조회 페이지
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
	// 출고관리 - 조회 모달
		@RequestMapping("/prodLotModal.do")
		public String getProdLotModal() {
			return "app/bus/prodLotModal";
		}

		// 모달 출고검색
		@RequestMapping("/ajax/searchProdLot.do")
		@ResponseBody
		public Map<String, Object> searchProdLotModal(@RequestBody Map<String, Object> param) {
			System.out.println(param + "----------------");
			Map<String, Object> data = new HashMap<String, Object>();
			Map<String, Object> datas = new HashMap<String, Object>();
			datas.put("contents", dao.searchProdLotModal(param));
			data.put("result", true);
			data.put("data", datas);
			return data;
		}
		
		@RequestMapping("bus/view/viewExport.do") // 출고조회페이지
		public String viewExport(Model model) {
			return "bus/viewExport.page";
		}
		
		@RequestMapping("/ajax/viewExportSearch.do")//출고조회 그리드
		@ResponseBody
		public Map<String, Object> viewExportSearch(@RequestBody Map<String, Object> param) {
			Map<String, Object> datas = new HashMap<String, Object>();
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("result", true);
			datas.put("contents", dao.viewExportSearch(param));
			data.put("data", datas);
			return data;
		}


}
