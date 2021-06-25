package com.rest.app.fac.repair.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.fac.repair.service.impl.RepairMapper;
import com.rest.app.fac.repair.vo.RepairVO;


@Controller
public class RepairController {
	@Autowired
	RepairMapper mapper;
	
	@RequestMapping("/repList.do")
	public String getRep() {
		return "fac/repList.page";
	}
	
	@RequestMapping("/ajax/repList.do")
	@ResponseBody
	public List<RepairVO> ajaxGetRep(Model model) {
		return mapper.getRep();
	}
}
