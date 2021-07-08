package com.rest.app.fac.inspection.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.fac.inspection.service.impl.InspectionMapper;
import com.rest.app.fac.inspection.vo.InspectionVO;

@Controller
public class InspectionController {
	@Autowired InspectionMapper mapper;
	
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
}
