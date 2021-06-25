package com.rest.app.mat.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.mat.service.MaterialService;
import com.rest.app.mat.vo.MaterialVO;


@Controller
public class MaterialController {
	
	@Autowired
	MaterialService dao;

	@RequestMapping("/matForm.do")
	public String matForm(Model model) {
		return "mat/matForm.page";
	}
	
	@RequestMapping("/ajax/matList.do")
	@ResponseBody
	public List<MaterialVO> ajaxMatForm(Model model) {
		return dao.getMatList();
	}
	
	@RequestMapping("inorderForm.do")
	public String inorderForm(Model model) {
		return "mat/inorderForm.page";
	}
	
	
	@RequestMapping("matInForm.do")
	public String matInForm(Model model) {
		return "mat/matInForm.page";
	}
	
	@RequestMapping("matStockForm.do")
	public String matStockForm(Model model) {
		return "mat/matStockForm.page";
	}
	
	@RequestMapping("matSaveStockList.do")
	public String matSaveStockList(Model model) {
		return "mat/matSaveStockList.page";
	}
	
	@RequestMapping("matOutForm.do")
	public String matOutForm(Model model) {
		return "mat/matOutForm.page";
	}
	
}
