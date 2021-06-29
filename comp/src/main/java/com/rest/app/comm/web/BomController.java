package com.rest.app.comm.web;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
//	@RequestMapping("/ajax/bomList.do")
//	public Map<String, Object> ajaxgetProduct(){
//		Map<String,Object> datas = new HashMap();
//		Map<String,Object> data = new HashMap();
//		data.put("result", true);
//		datas.put("contents", dao.getProduct());
//		data.put("data", datas);
//		
//		return data;
//	}
//	
	
	//제품 단건조회
	@RequestMapping("getInfoProduct.do")
	public ModelAndView getInfoProduct(Model model, BomVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/comm/bomList.page");
		mv.addObject("info", dao.getInfoProduct(vo));
		return mv;  
	}
	
	@RequestMapping("getInfoBom.do")
	public ModelAndView getInfoBom(Model model, BomVO vo) {
		ModelAndView bomMv = new ModelAndView();
		bomMv.setViewName("/comm/bomList.page");
		bomMv.addObject("bomInfo", dao.getInfoProduct(vo));
		return bomMv;
	}
}

