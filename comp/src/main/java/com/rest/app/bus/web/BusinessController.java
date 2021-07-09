package com.rest.app.bus.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rest.app.bus.service.BusinessService;
import com.rest.app.bus.vo.CompanyVO;
import com.rest.app.bus.vo.DetailExportVO;
import com.rest.app.bus.vo.ExportVO;
import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.BomVO;
import com.rest.app.mat.vo.MaterialVO;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.PlanVO;



class GridData {
	List<DetailExportVO> createdRows;
	List<DetailExportVO> updatedRows;
	List<DetailExportVO> deletedRows;
	
	public List<DetailExportVO> getCreatedRows() {
		return createdRows;
	}

	public void setCreatedRows(List<DetailExportVO> createdRows) {
		this.createdRows = createdRows;
	}

	public List<DetailExportVO> getDeletedRows() {
		return deletedRows;
	}

	public void setDeletedRows(List<DetailExportVO> deletedRows) {
		this.deletedRows = deletedRows;
	}

	public List<DetailExportVO> getUpdatedRows() {
		return updatedRows;
	}

	public void setUpdatedRows(List<DetailExportVO> updatedRows) {
		this.updatedRows = updatedRows;
	}
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
	@RequestMapping("/readExport.do") // 출고 조회
	@ResponseBody
	public Map<String, Object> readExport(@RequestBody  Map<String, Object> param) {
		System.out.println(param+"=========");
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getExport(param));
		data.put("data", datas);
		return data;
	}
	
	//미출고 검색 페이지리턴
	@RequestMapping("/unExportModal.do")
	public String unExportModal() {
		return "app/bus/unExportModal";
	}
	//미출고 검색 모달그리드
	@RequestMapping("/ajax/unExportModal.do")
	@ResponseBody
	public Map<String, Object> ajaxUnExportModal(@RequestBody  Map<String, Object> param) { 
		System.out.println("=============");
		Map<String,Object> datas = new HashMap<>();
		Map<String,Object> data = new HashMap<>();
		
		data.put("result", true);
		datas.put("contents", dao.getUnExportModal(param));
		data.put("data", datas);
		
		return data;
	}

	// 계획저장
		@RequestMapping("saveExport.do")
		@ResponseBody
		public void saveExport(ExportVO vo) {
			if (vo.getExportCode().equals("ExportCode")) {
				dao.insertExport(vo);
			} else {
				dao.updateExport(vo);
			}
		}

		// 세부계획 CUD
		@RequestMapping("gridExport.do")
		@ResponseBody
		public Map<String, Object> saveGrid(@RequestBody GridData gridData) {
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
					if (vo.getProductLot() == null) {
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

		// 계획삭제
		@RequestMapping("deleteExport.do")
		@ResponseBody
		public void deleteExport(String exportCode) {
			dao.deleteExport(exportCode);
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
	
	
	//제품재고관리
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
