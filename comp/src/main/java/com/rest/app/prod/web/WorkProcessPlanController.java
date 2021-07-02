package com.rest.app.prod.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkProcessPlanController {
	@RequestMapping("workProcessPlan.do")
	public String workProcess(Model model) {
		return "prod/workProcessPlan.page";
	}
	@RequestMapping("workModal.do")
	public String workModal(Model model) {
		return "app/prod/workModal";
	}
}
