package com.rest.app.bus.web;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rest.app.bus.service.BusinessService;
import com.rest.app.bus.vo.DetailExportVO;
import com.rest.app.bus.vo.ExportLotVO;
import com.rest.app.bus.vo.ExportVO;
import com.rest.app.bus.vo.OrdersVO;

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

	@RequestMapping("/bus/view/busList.do") // 주문관리참조조회
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
	
	//주문관리참조조회-엑셀
	@RequestMapping("/bus/view/busListExcel.do")
	public ModelAndView busListExcel(@RequestParam Map<String, Object> param)
			throws IllegalAccessException,InvocationTargetException, NoSuchMethodException {
		System.out.println("=================");
		HashMap<String, Object>map = new HashMap<String, Object>();
		HashMap<String, Object>headerMap = new HashMap<String, Object>();
		List<OrdersVO> list = dao.getBus(param);
		List<Map<String, String>> data = new ArrayList<>();
		for(OrdersVO vo: list) {
			data.add(BeanUtils.describe(vo));
		}
		headerMap.put("orderState","진행구분");
		headerMap.put("inDate","접수일자" );
		headerMap.put("outDate","납기일자" );
		headerMap.put("compName","업체명");
		headerMap.put("orderNo","주문번호" );
		headerMap.put("productCode","제품코드" );
		headerMap.put("productName","제품명" );
		headerMap.put("stdId","규격" );
		headerMap.put("unitId","단위" );
		headerMap.put("orderCount","주문량" );
		headerMap.put("outCount","출고량" );
		headerMap.put("notCount","미납품량" );
		headerMap.put("comments","비고" );
		map.put("headerMap", headerMap);
		map.put("filename", "excel_bus");
		map.put("datas", data);
		return new ModelAndView("commonExcelView",map);
	}

	@RequestMapping("/bus/mng/exportForm.do") // 출고관리페이지
	public String exportForm(Model model) {
		System.out.println("^^^^^^^^^^^^^^^^^^^^^");
		return "bus/exportForm.page";
	}

	// 출고관리 - 조회 모달
	@RequestMapping("/modal/exportModal.do")
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

	@RequestMapping("/bus/view/productInventory.do") // 제품재고 조회 페이지
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
	
	//제품재고조회-엑셀
		@RequestMapping("/bus/view/productInventoryExcel.do")
		public ModelAndView productInventoryExcel(@RequestParam Map<String, Object> param)
				throws IllegalAccessException,InvocationTargetException, NoSuchMethodException {
			System.out.println("=================");
			HashMap<String, Object>map = new HashMap<String, Object>();
			HashMap<String, Object>headerMap = new HashMap<String, Object>();
			List<OrdersVO> list = dao.getProInventory(param);
			List<Map<String, String>> data = new ArrayList<>();
			for(OrdersVO vo: list) {
				data.add(BeanUtils.describe(vo));
			}
			headerMap.put("productCode","제품코드");
			headerMap.put("productName","제품명" );
			headerMap.put("stdId","규격" );
			headerMap.put("unitId","단위");
			headerMap.put("productLot","제품Lot" );
			headerMap.put("productCount","재고량" );
			headerMap.put("productState","제품상태" );
			map.put("headerMap", headerMap);
			map.put("filename", "excel_product");
			map.put("datas", data);
			return new ModelAndView("commonExcelView",map);
		}

	// 출고관리 - 조회 모달
		@RequestMapping("/modal/prodLotModal.do")
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
		
		@RequestMapping("/bus/view/viewExport.do") // 출고조회페이지
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
		
		//출고조회-엑셀
				@RequestMapping("/bus/view/exportExcel.do")
				public ModelAndView exportExcel(@RequestParam Map<String, Object> param)
						throws IllegalAccessException,InvocationTargetException, NoSuchMethodException {
					System.out.println("=================");
					HashMap<String, Object>map = new HashMap<String, Object>();
					HashMap<String, Object>headerMap = new HashMap<String, Object>();
					List<DetailExportVO> list = dao.viewExportSearch(param);
					List<Map<String, String>> data = new ArrayList<>();
					for(DetailExportVO vo: list) {
						data.add(BeanUtils.describe(vo));
					}
					headerMap.put("exportDate","출고일자");
					headerMap.put("productCode","제품코드");
					headerMap.put("productName","제품명" );
					headerMap.put("stdId","규격" );
					headerMap.put("unitId","단위");
					headerMap.put("orderNo","주문번호" );
					headerMap.put("companyName","업체명" );
					headerMap.put("orderCount","주문량" );
					headerMap.put("exportCount","출고량" );
					headerMap.put("price","금액" );
					headerMap.put("comments","비고" );
					map.put("headerMap", headerMap);
					map.put("filename", "excel_export");
					map.put("datas", data);
					return new ModelAndView("commonExcelView",map);
				}



}
