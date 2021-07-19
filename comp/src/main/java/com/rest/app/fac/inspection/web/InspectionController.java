package com.rest.app.fac.inspection.web;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rest.app.fac.inspection.service.impl.InspectionMapper;
import com.rest.app.fac.inspection.vo.InspectionVO;
import com.rest.app.fac.vo.FacilitiesVO;

import lombok.Data;

@Data
class GridData {
	List<InspectionVO> deletedRows;
	List<InspectionVO> createdRows;
	List<InspectionVO> updatedRows;
}
@Controller
public class InspectionController {
	@Autowired 
	InspectionMapper mapper;
	
	@RequestMapping("/fac/mng/inspection.do")
	public String inspection(Model model) {
		return "fac/inspection.page";
	}
	
	@RequestMapping("/ajax/inspectionList.do")
	@ResponseBody
	public Map<String, Object> ajaxInsList(InspectionVO vo) {
		Map<String,Object> data = new HashMap<String,Object>();
		Map<String,Object> datas = new HashMap<String,Object>();
		data.put("result", true);
		datas.put("contents", mapper.getIns(vo));
		data.put("data", datas);
		return data;
	}
	
	@RequestMapping("/fac/view/inspectionExcel.do")
	public ModelAndView inspectionExcel(@RequestParam Map<String, Object> param)
			throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> headerMap = new HashMap<String, Object>();
		List<InspectionVO> list = mapper.inspectionList(param);
		List<Map<String, String>> data = new ArrayList<>();
		for(InspectionVO vo : list) {
			data.add(BeanUtils.describe(vo));
		}
		headerMap.put("inspectionCode", "정기점검코드");
		headerMap.put("facCode", "설비코드");
		headerMap.put("facilitiesName", "설비명");
		headerMap.put("facInspection", "설비점검주기");
		headerMap.put("beforeDate", "전점검일");
		headerMap.put("today", "점검일");
		headerMap.put("afterDate", "차기점검일");
		headerMap.put("judgement", "판정");
		headerMap.put("insComment", "조치사항");
		map.put("headerMap", headerMap);
		map.put("filename", "excel_plan");
		map.put("datas", data);
		return new ModelAndView("commonExcelView", map); 
	}
	
	// 점검내역 조회
	@RequestMapping("/fac/view/inspectionList.do")
	public String inspectionList() {
		return "fac/inspectionList.page";
	}
	
	@RequestMapping("/ajax/inspecList.do")
	@ResponseBody
	public Map<String, Object> ajaxinspecList(InspectionVO vo) {
		Map<String,Object> data = new HashMap<String,Object>();
		Map<String,Object> datas = new HashMap<String,Object>();
		data.put("result", true);
		datas.put("contents", mapper.inspectionList());
		data.put("data", datas);
		return data;
	}
	
	// 삭제
	@PostMapping(value="/ajax/deleteIns.do")
	@ResponseBody
	public Map<String,Object> deleteIns(@RequestBody GridData gridDate) {
		Map<String,Object> data = new HashMap<String,Object>();
		for(int i=0; i<gridDate.deletedRows.size(); i++) {
			mapper.deleteIns(gridDate.deletedRows.get(i));
		}
		data.put("result", true);
		data.put("data", gridDate.deletedRows);
		return data;
	}
	
	// 행 추가시 불러오는 코드
	@RequestMapping("/ajax/getInsCode.do")
	@ResponseBody
	public InspectionVO getInsCode(InspectionVO vo) {
		return mapper.getInsCode();
	}
	
	// 추가
	@PostMapping(value = "/ajax/insertIns.do")
	@ResponseBody
	public Map<String, Object> insertIns(@RequestBody GridData gridDate) {
		Map<String, Object> data = new HashMap<String, Object>();
		mapper.insertIns(gridDate.createdRows.get(0));
		data.put("result", true);
		data.put("data", gridDate.createdRows);
		return data;
	}
	// 수정
	@PutMapping(value = "/ajax/updateIns.do")
	@ResponseBody
	public Map<String, Object> updateIns(@RequestBody GridData gridDate) {
		Map<String, Object> data = new HashMap<String, Object>();
		for (int i = 0; i < gridDate.updatedRows.size(); i++) {
			mapper.updateIns(gridDate.updatedRows.get(i));
		}
		data.put("result", true);
		data.put("data", gridDate.updatedRows);
		return data;
	}
	
	@PutMapping(value = "/ajax/modifyIns.do")
	@ResponseBody
	public Map<String, Object> modifyIns(@RequestBody GridData gridDate){
		
		Map<String, Object> data = new HashMap<String, Object>();
		for (int i = 0; i < gridDate.createdRows.size(); i++) {
			System.out.println(gridDate.createdRows.get(i));
			mapper.insertIns(gridDate.createdRows.get(i));
		}
		for (int i = 0; i < gridDate.updatedRows.size(); i++) {
			mapper.updateIns(gridDate.updatedRows.get(i));
		}
		for (int i = 0; i < gridDate.deletedRows.size(); i++) {
			mapper.deleteIns(gridDate.deletedRows.get(i));
		}
		data.put("result", true);
		data.put("data", gridDate);
		return data;
	}
	
	// 설비검색 모달 페이지
		@RequestMapping("/modal/facModal.do")
		public String facModel() {
			return "app/modal/facModal";
		}
		
		@RequestMapping("/ajax/facListModal.do")
		@ResponseBody
		public Map<String, Object> ajaxfacListModel(Model model, FacilitiesVO vo) { 
			
			Map<String,Object> datas = new HashMap<>();
			Map<String,Object> data = new HashMap<>();
			
			data.put("result", true);
			datas.put("contents", mapper.getFacListModal(vo));
			data.put("data", datas);
			
			return data;
		}
	
}

