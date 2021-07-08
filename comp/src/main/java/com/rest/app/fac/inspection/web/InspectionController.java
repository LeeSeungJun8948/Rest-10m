package com.rest.app.fac.inspection.web;

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

import com.rest.app.fac.inspection.service.impl.InspectionMapper;
import com.rest.app.fac.inspection.vo.InspectionVO;

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
	
	@RequestMapping("inspection.do")
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
	
	// 삭제
	@PostMapping(value="ajax/deleteIns.do")
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
	@RequestMapping("ajax/getInsCode.do")
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
		
		System.out.println("컨트롤러===============");
		Map<String, Object> data = new HashMap<String, Object>();
		for (int i = 0; i < gridDate.createdRows.size(); i++) {
			mapper.insertIns(gridDate.createdRows.get(i));
		}
		for (int i = 0; i < gridDate.updatedRows.size(); i++) {
			mapper.updateIns(gridDate.updatedRows.get(i));
		}
		for (int i = 0; i < gridDate.deletedRows.size(); i++) {
			mapper.updateIns(gridDate.deletedRows.get(i));
		}
		data.put("result", true);
		data.put("data", gridDate.createdRows);
		data.put("data", gridDate.updatedRows);
		data.put("data", gridDate.deletedRows);
		return data;
	}
	
}

