package com.rest.app.bus.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.bus.service.BusinessService;
import com.rest.app.bus.vo.OrdersVO;


@Controller
public class BusinessController {

	@Autowired
	BusinessService dao;

	@RequestMapping("busList.do")//주문관리참조조회
	public String business(Model model) {
		return "bus/busList.page";
	}
	
//	@RequestMapping("/ajax/busList.do")
//	@ResponseBody
//	public List<OrdersVO> ajaxGetBus(Model model) {
//		// TODO Auto-generated method stub
//		return dao.getBus();
//	}
	@RequestMapping("/ajax/busList.do")
	@ResponseBody
	public Map<String, Object> busList(@RequestBody Map<String, Object> param) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getBus(param));
		data.put("data", datas);
		return data;
	}
	
//	@RequestMapping("clientCompany.do")//고객사팝업창
//	public String clientCompany(Model model) {
//		return "bus/clientCompany.page";
//	}
	
	@RequestMapping("unproduced.do")//미생산 의뢰조회
	public String unProduced(Model model) {
		return "bus/unproduced.page";
	}
}
