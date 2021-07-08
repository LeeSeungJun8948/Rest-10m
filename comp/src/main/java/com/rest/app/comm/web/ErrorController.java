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

import com.rest.app.comm.service.ErrorService;
import com.rest.app.comm.vo.ErrorVO;

import lombok.Data;

@Data
class ErrorGridData {
	List<ErrorVO> deletedRows;
	List<ErrorVO> updatedRows;
	List<ErrorVO> createdRows;
}

@Controller
public class ErrorController {

	@Autowired
	ErrorService dao;
	
	//불량 코드,명 리스트 
	@RequestMapping("/ajax/errorList.do")
	@ResponseBody
	public Map<String, Object> ajaxGeterrorList(ErrorVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getErrorList(vo));
		data.put("data", datas);
		return data;
	}
	
	// 불량코드,명 삭제
	@PostMapping(value = "/ajax/deleteError.do")
	@ResponseBody
	public Map<String, Object>deleteBom(@RequestBody ErrorGridData errorGridData) {
		Map<String, Object> data = new HashMap<String, Object>();
		for (int i = 0; i < errorGridData.deletedRows.size(); i++) {
			dao.deleteError(errorGridData.deletedRows.get(i));
		}
		data.put("result", true);
		data.put("data", errorGridData.deletedRows);
		return data;
	}

	//불량코드,명  modify
	@PutMapping(value = "/ajax/modifyError.do")
	@ResponseBody
	public Map<String, Object> modifyError(@RequestBody ErrorGridData errorGridData) {
		Map<String, Object> data = new HashMap<String, Object>();

		for (int i = 0; i < errorGridData.createdRows.size(); i++) {
			dao.insertError(errorGridData.createdRows.get(i));
		}
		for (int i = 0; i < errorGridData.updatedRows.size(); i++) {
			dao.updateError(errorGridData.updatedRows.get(i));
		}
		data.put("result", true);
		data.put("data", errorGridData.createdRows);
		data.put("data", errorGridData.updatedRows);
		return data;
	}
	@RequestMapping("/ajax/getNewErrorCode.do")
	@ResponseBody
	public ErrorVO getNewErrorCode(ErrorVO vo) {
		return dao.MaxErrorCode();
	}
}
