package com.rest.app.prod.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProdController {
	
	
	@RequestMapping("prodPlanManage")
	public String prodPlanManage(Model model) {
		return "prod/prodPlanManage.page";
	}
	
	@RequestMapping("prodPlanView")
	public String prodPlanView(Model model) {
		return "prod/prodPlanView.page";
	}
	
	@RequestMapping("prodOrderManage")
	public String prodOrderManage(Model model) {
		return "prod/prodOrderManage.page";
	}
	
	@RequestMapping("prodOrderView")
	public String prodOrderView(Model model) {
		return "prod/prodOrderView.page";
	}
	
	@RequestMapping("prodProcess")
	public String prodProcess(Model model) {
		return "prod/prodProcess.page";
	}
	
	@RequestMapping("prodPerformance")
	public String prodPerformance(Model model) {
		return "prod/prodPerformance.page";
	}
	
	@RequestMapping("checkPerformance")
	public String checkPerformance(Model model) {
		return "prod/checkPerformance.page";
	}
	
	@RequestMapping("packingPerformance")
	public String packingPerformance(Model model) {
		return "prod/packingPerformance.page";
	}
	
	@RequestMapping("prodMonitoring")
	public String prodMonitoring(Model model) {
		return "prod/prodMonitoring.page";
	}
	
	@RequestMapping("prodPerformanceView")
	public String prodPerformanceView(Model model) {
		return "prod/prodPerformanceView.page";
	}
	
	@RequestMapping("defectListView")
	public String defectListView(Model model) {
		return "prod/defectListView.page";
	}
}
