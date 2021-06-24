package com.rest.app.bus.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rest.app.bus.service.BusinessService;

@Controller
public class BusinessController {

	@Autowired
	BusinessService dao;

	@RequestMapping("business.do")
	public String business(Model model) {
		model.addAttribute("bus", dao.getBus());
		return "bus/busList.page";
	}
}
