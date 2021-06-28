package com.rest.app.prod.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.prod.service.ProdService;

@Controller
public class ProdController {
	@Autowired
	ProdService svc;

	@RequestMapping("prodPlanManage.do")
	public String prodPlanManage(Model model) {
		return "prod/prodPlanManage.page";
	}

	@RequestMapping("ajax/orderRead.do")
	@ResponseBody
	public List<OrdersVO> orderRead(Model model) {
		return svc.getUnplannedOrders();
	}
	
	@RequestMapping("prodPlanView.do")
	public String prodPlanView(Model model) {
		return "prod/prodPlanView.page";
	}

	@RequestMapping("prodOrderManage.do")
	public String prodOrderManage(Model model) {
		return "prod/prodOrderManage.page";
	}

	@RequestMapping("prodOrderView.do")
	public String prodOrderView(Model model) {
		return "prod/prodOrderView.page";
	}

	@RequestMapping("prodProcess.do")
	public String prodProcess(Model model) {
		return "prod/prodProcess.page";
	}

	@RequestMapping("prodPerformance.do")
	public String prodPerformance(Model model) {
		return "prod/prodPerformance.page";
	}

	@RequestMapping("checkPerformance.do")
	public String checkPerformance(Model model) {
		return "prod/checkPerformance.page";
	}

	@RequestMapping("packingPerformance.do")
	public String packingPerformance(Model model) {
		return "prod/packingPerformance.page";
	}

	@RequestMapping("prodMonitoring.do")
	public String prodMonitoring(Model model) {
		return "prod/prodMonitoring.page";
	}

	@RequestMapping("prodPerformanceView.do")
	public String prodPerformanceView(Model model) {
		return "prod/prodPerformanceView.page";
	}

	@RequestMapping("defectListView.do")
	public String defectListView(Model model) {
		return "prod/defectListView.page";
	}
}
