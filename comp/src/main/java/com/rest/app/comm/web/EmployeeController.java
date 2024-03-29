package com.rest.app.comm.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.comm.service.EmployeeService;
import com.rest.app.comm.vo.EmployeeVO;

class GridData {
	List<EmployeeVO> deletedRows;
	List<EmployeeVO> updatedRows;
	List<EmployeeVO> createdRows;

	public List<EmployeeVO> getCreatedRows() {
		return createdRows;
	}

	public void setCreatedRows(List<EmployeeVO> createdRows) {
		this.createdRows = createdRows;
	}

	public List<EmployeeVO> getDeletedRows() {
		return deletedRows;
	}

	public void setDeletedRows(List<EmployeeVO> deletedRows) {
		this.deletedRows = deletedRows;
	}

	public List<EmployeeVO> getUpdatedRows() {
		return updatedRows;
	}

	public void setUpdatedRows(List<EmployeeVO> updatedRows) {
		this.updatedRows = updatedRows;
	}
}

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService dao;

	@RequestMapping("/comm/empList.do")
	public String empList(Model model) {
		return "comm/empList.page";
	}

	@RequestMapping("/comm/insertEmp.do")
	public String insertEmp(EmployeeVO vo) {
		if (vo.getEmpCode().equals("")) {
			vo.setEmpCode(String.valueOf(dao.maxEmpCode() + 1));
			dao.insertEmp(vo);
		} else {
			dao.updateEmp(vo);
		}
		return "redirect:empList.do";
	}

	@RequestMapping("/comm/ajax/empList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetEmp(EmployeeVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getEmp(vo));
		data.put("data", datas);
		return data;
	}

	@PostMapping(value = "/comm/ajax/deleteEmp.do")
	@ResponseBody
	public Map<String, Object> deleteEmp(@RequestBody GridData gridData) {
		Map<String, Object> data = new HashMap<String, Object>();
		for (int i = 0; i < gridData.deletedRows.size(); i++) {
			dao.deleteEmp(gridData.deletedRows.get(i));
		}
		data.put("result", true);
		data.put("data", gridData.deletedRows);
		return data;
	}
}
