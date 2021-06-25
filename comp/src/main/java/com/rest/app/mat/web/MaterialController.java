package com.rest.app.mat.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MaterialController {

	@RequestMapping("matForm.do")
	public String matForm(Model model) {
		return "mat/matForm.page";
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
