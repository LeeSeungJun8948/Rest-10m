package com.rest.app.prod.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.prod.service.ProdService;
import com.rest.app.prod.vo.DetailPlanVO;
import com.rest.app.prod.vo.ProdPlanVO;

class GridData {
	List<DetailPlanVO> createdRows;
	List<DetailPlanVO> updatedRows;
	List<DetailPlanVO> deletedRows;

	public List<DetailPlanVO> getCreatedRows() {
		return createdRows;
	}

	public void setCreatedRows(List<DetailPlanVO> createdRows) {
		this.createdRows = createdRows;
	}

	public List<DetailPlanVO> getDeletedRows() {
		return deletedRows;
	}

	public void setDeletedRows(List<DetailPlanVO> deletedRows) {
		this.deletedRows = deletedRows;
	}

	public List<DetailPlanVO> getUpdatedRows() {
		return updatedRows;
	}

	public void setUpdatedRows(List<DetailPlanVO> updatedRows) {
		this.updatedRows = updatedRows;
	}
}

@Controller
public class ProdController {
	@Autowired
	ProdService svc;

	@RequestMapping("prodPlanManage.do")
	public String prodPlanManage(Model model) {
		return "prod/prodPlanManage.page";
	}

	@RequestMapping("unplanOrderRead.do")
	@ResponseBody
	public Map<String, Object> unplanOrderRead(@RequestBody Map<String, Object> param) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", svc.getUnplanOrders(param));
		data.put("data", datas);
		return data;
	}

	@RequestMapping("planSave.do")
	@ResponseBody
	public void planSave(ProdPlanVO vo) {
		if (vo.getPlanCode() == null) {
			svc.insertPlan(vo);
		} else {
			svc.updatePlan(vo);
		}
	}

	@RequestMapping("gridSave.do")
	@ResponseBody
	public String gridSave(@RequestBody GridData gridData) {
		List<DetailPlanVO> cList = gridData.createdRows;
		List<DetailPlanVO> uList = gridData.updatedRows;
		List<DetailPlanVO> dList = gridData.deletedRows;
		cList.forEach(vo -> {
			svc.insertDetailPlan(vo);
		});
		uList.forEach(vo -> {
			svc.updateDetailPlan(vo);
		});
		dList.forEach(vo -> {
			svc.deleteDetailPlan(vo);
		});
		return "redirect:prodPlanManage.do";
	}

	@RequestMapping("deletePlan.do")
	@ResponseBody
	public Map<String, Object> insertDetailPlan(@RequestBody GridData gridData) {
		Map<String, Object> data = new HashMap<String, Object>();
		List<DetailPlanVO> list = gridData.createdRows;
		list.forEach(vo -> {
			svc.insertDetailPlan(vo);
		});
		data.put("result", true);
		data.put("data", gridData.createdRows);
		return data;
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
