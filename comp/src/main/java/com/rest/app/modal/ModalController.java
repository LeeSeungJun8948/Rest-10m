package com.rest.app.modal;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.mat.service.MaterialService;
import com.rest.app.mat.vo.MaterialVO;

@Controller
public class ModalController {

	@Autowired
	MaterialService dao;
	
	@RequestMapping("/matModal.do")
	public String matModal() {
		return "modal/matModal.part";
	}
	
	@RequestMapping("/ajax/matListModal.do")
	@ResponseBody
	public Map<String, Object> ajaxMatForm(Model model, MaterialVO vo) { // 자재 요약 리스트 출력
		
		Map<String,Object> datas = new HashMap<>();
		Map<String,Object> data = new HashMap<>();
		
		System.out.println(vo.getKeyword());
		data.put("result", true);
		datas.put("contents", dao.getMatListModal(vo));
		data.put("data", datas);
		
		return data;
	}
	
	@RequestMapping("/procModal.do")
	public String procModal() {
		return "modal/procModal.part";
	}
	
}
