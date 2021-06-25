package com.rest.app.comm.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rest.app.comm.service.CommService;

@Controller
public class CommController {

	@Autowired
	CommService dao;
	
	@RequestMapping("commList.do")
	public String commList(Model model) {
		
		model.addAttribute("commlist", dao.getComm());
		
		return "comm/commList.page";
	}
}
