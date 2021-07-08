package com.rest.app.prod.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.prod.service.ErrorListService;
import com.rest.app.prod.vo.ErrorListVO;



@Controller
public class ErrorListController {
	
	@Autowired
	ErrorListService dao;
	
	@RequestMapping("detailErrorList.do")
	public String errorList() {
		return "prod/errorList.page";
	}
	
	//불량리스트 
	@RequestMapping("/ajax/detailErrorList.do")
	@ResponseBody
	public Map<String, Object> ajaxGeterrorList(ErrorListVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getErrorList(vo));
		data.put("data", datas);
		return data;
	}
	
	
}
