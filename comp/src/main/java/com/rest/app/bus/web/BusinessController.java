package com.rest.app.bus.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.bus.service.BusinessService;
import com.rest.app.bus.vo.CompanyVO;
import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.BomVO;
import com.rest.app.mat.vo.MaterialVO;

@Controller
public class BusinessController {

	@Autowired
	BusinessService dao;

	@RequestMapping("busList.do") // 주문관리참조조회
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

	@RequestMapping("exportForm.do") // 출고관리페이지
	public String exportForm(Model model) {
		return "bus/exportForm.page";
	}

	@RequestMapping("readUnExport.do") // 미출고 조회
	@ResponseBody
	public OrdersVO ajaxReadUnExport(Model model, OrdersVO vo) {// 자재 리스트에서 클릭시 자재 상세 정보 출력
		vo = dao.getUnExport(vo);
		return vo;
	}

	// 고객사리스트 ajax
	@RequestMapping("/ajax/exportForm.do")
	@ResponseBody
	public Map<String, Object> ajaxGetCompList(CompanyVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getCompany(vo));
		data.put("data", datas);
		return data;
	}

	// 모달
	@RequestMapping("compModal.do")
	public String compmodal() {
		return "app/bus/compModal";
	}

	// 모달
	@RequestMapping("productModal.do")
	public String promodal() {
		return "app/bus/productModal";
	}
}
