package com.rest.app.bus.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.bus.service.BusinessService;
import com.rest.app.bus.vo.OrdersVO;


@Controller
public class BusinessController {

	@Autowired
	BusinessService dao;

	@RequestMapping("busList.do")
	public String business(Model model) {
		model.addAttribute("bus", dao.getBus());
		return "bus/busList.page";
	}
	
	@RequestMapping("/ajax/busList.do")
	@ResponseBody
	public List<OrdersVO> ajaxGetBus(Model model) {
		// TODO Auto-generated method stub
		return dao.getBus();
	}
}
