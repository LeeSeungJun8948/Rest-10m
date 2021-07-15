package com.rest.app.fac.facproduct.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.fac.facproduct.service.impl.FacProductMapper;
import com.rest.app.fac.facproduct.vo.FacProductVO;

@Controller
public class FacProductController {
	@Autowired
	FacProductMapper mapper;
	    
	@RequestMapping("/fac/view/facProdList.do")
	public String getFP() {
		return "fac/facProdList.page";
	}
	
	@RequestMapping("/ajax/facProd.do")
	@ResponseBody
	public Map<String, Object> ajaxGetFacProd(FacProductVO vo) {
		Map<String,Object> datas = new HashMap<String, Object>();
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", mapper.getFP(vo));
		data.put("data", datas);
		return data;
	}
}
