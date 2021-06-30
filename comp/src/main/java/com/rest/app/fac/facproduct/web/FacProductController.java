package com.rest.app.fac.facproduct.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.fac.facproduct.service.impl.FacProductMapper;
import com.rest.app.fac.facproduct.vo.FacProductVO;

@Controller
public class FacProductController {
	@Autowired
	FacProductMapper mapper;
	    
	@RequestMapping("/facProdList.do")
	public String getFP() {
		return "fac/facProdList.page";
	}
	 
	@RequestMapping("ajax/facProd.do")
	@ResponseBody
	public List<FacProductVO> ajaxGet(Model model) {
		return mapper.getFP();
	}
}
