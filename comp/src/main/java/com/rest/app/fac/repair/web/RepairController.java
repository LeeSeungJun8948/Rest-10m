package com.rest.app.fac.repair.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.fac.repair.service.impl.RepairMapper;
import com.rest.app.fac.repair.vo.RepairVO;

class GridData {
	List<RepairVO> deletedRows;

	public List<RepairVO> getDeletedRows() {
		return deletedRows;
	}

	public void setDeletedRows(List<RepairVO> deletedRows) {
		this.deletedRows = deletedRows;
	}
	
}

@Controller
public class RepairController {
	@Autowired
	RepairMapper mapper;
	
	@RequestMapping("/repList.do")
	public String getRep() {
		return "fac/repList.page";
	}
	
	@RequestMapping("ajax/repList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetRep() {
		Map<String, Object> datas = new HashMap();
		Map<String, Object> data = new HashMap();
		data.put("result", true);
		datas.put("contents", mapper.getRep());
		data.put("data", datas);
		return data;
	}
	
	// 저장
	@RequestMapping(value="/insertRep.do")
	public String insertRep(HttpServletRequest request) {
		RepairVO vo = new RepairVO();
		vo.setFacCode(request.getParameter("facCode"));
		vo.setRepairDate(request.getParameter("repairDate"));
		vo.setRepairComment(request.getParameter("repairComment"));
		vo.setCompanyCode(request.getParameter("companyCode"));
		vo.setCost(request.getParameter("cost"));
		vo.setEtc(request.getParameter("etc"));
		mapper.insertRep(vo);
		return "redirect:repList.do";
	}
	
	// 삭제
	@PostMapping(value="ajax/deleteRep.do")
	@ResponseBody
	public Map deleteRep(@RequestBody GridData gridData) {
		Map<String, Object> data = new HashMap();
		mapper.deleteRep(gridData.deletedRows.get(0));
		data.put("result", true);
		data.put("data", gridData.deletedRows);
		return data;
	}
}
