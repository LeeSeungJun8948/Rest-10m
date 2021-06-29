package com.rest.app.comm.web;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rest.app.comm.service.BomService;
import com.rest.app.comm.vo.BomVO;


@Controller
public class BomController {

	@Autowired
	BomService dao;
	

	@RequestMapping("/main.do")
	public String main(Model model) {
		return "comm/main.page";
	}
	
	
	//제품코드,제품명,규격 리스트 (모달)
	@RequestMapping("bomList.do")
	public String getProduct(Model model) {
		model.addAttribute("productList", dao.getProduct());
		return "comm/bomList.page";
	}
	
	@RequestMapping("/ajax/bomList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetBomList() {
		Map<String,Object> datas = new HashMap();
		Map<String,Object> data = new HashMap();
		data.put("result", true);
		datas.put("contents", dao.getProduct());
		data.put("data", datas);
		return data;
	}
	//모달 
	@RequestMapping("modal.do")
	public String modal() {
		return "app/comm/modal";
	}
	//제품 단건조회 , 소요자재조회
	@RequestMapping("getInfoProduct.do")
	public ModelAndView getInfoProduct(Model model, BomVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/comm/bomList.page");
		mv.addObject("info", dao.getInfoProduct(vo));
		mv.addObject("binfo", dao.getInfoBom(vo));
		return mv;  
	}
	

}  

