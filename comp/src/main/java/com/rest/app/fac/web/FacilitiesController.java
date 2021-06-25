package com.rest.app.fac.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.fac.service.impl.FacilitiesMapper;
import com.rest.app.fac.vo.FacilitiesVO;

@Controller
public class FacilitiesController {
	@Autowired
	FacilitiesMapper mapper;
	
	@RequestMapping("/facList.do")
	public String getFac(Model model) {
		return "fac/facList.page";
	}
	
	@RequestMapping("/ajax/facList.do")
	@ResponseBody
	public List<FacilitiesVO> ajaxGetFac(Model model) {
		return mapper.getFac();
	}
}
