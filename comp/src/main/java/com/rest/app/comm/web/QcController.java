package com.rest.app.comm.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rest.app.comm.service.QualityControlService;
import com.rest.app.comm.vo.BomVO;
import com.rest.app.comm.vo.QualityControlVO;

@Controller
public class QcController {

	@Autowired
	QualityControlService dao;
	
	//모달
	@RequestMapping("QcModal.do")
	public String modal() {
		
		return "app/comm/QcModal";
	}
	
	//모달창 제품 리스트 조회
	@RequestMapping("/ajax/getProductList.do")
	@ResponseBody
	public Map<String, Object> ajaxgetProductList(QualityControlVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getProductList(vo));
		data.put("data", datas);
		return data;
	}
	
	@RequestMapping("QualityControl.do")
	public String QualityControl() {
		return "comm/QualityControl.page";
	}
	
	@RequestMapping("getQcProduct.do")
	public ModelAndView getQcProduct(Model model, QualityControlVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/comm/QualityControl.page");
		mv.addObject("proInfo", dao.getProduct(vo));
		mv.addObject("company", dao.getCompany(vo));
		return mv;
	}
}
