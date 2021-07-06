package com.rest.app.comm.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.comm.service.ErrorService;
import com.rest.app.comm.vo.BomVO;
import com.rest.app.comm.vo.ErrorListVO;
import com.rest.app.comm.vo.ErrorVO;

import lombok.Data;

@Data
class ErrorGridData {
	List<BomVO> deletedRows;
	List<BomVO> updatedRows;
	List<BomVO> createdRows;
}


@Controller
public class ErrorController {

	@Autowired
	ErrorService dao;
	
	@RequestMapping("errorList.do")
	public String errorList(Model model, ErrorVO vo) {
		return "comm/errorList.page";
	}
	
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
	
	
	@RequestMapping("/ajax/errorAllList.do")
	@ResponseBody
	public Map<String, Object> ajaxGeterrorAllList(ErrorListVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getAllErrorList(vo));
		data.put("data", datas);
		return data;
	}
}
