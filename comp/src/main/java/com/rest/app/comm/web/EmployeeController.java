package com.rest.app.comm.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	@RequestMapping("empList.do")
	public String empList(Model model) {
		return "comm/empList.page";
	}
	
	public int updateEmp(EmployeeVO vo) {
		return dao.updateEmp(vo);
	}
	
	@RequestMapping("/ajax/empList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetEmp() {
		Map<String,Object> datas = new HashMap();
		Map<String,Object> data = new HashMap();
		data.put("result", true);
		datas.put("contents", dao.getEmp());
		data.put("data", datas);
/*		 "result": true,
	  		"data": {
	  		
	  		result + data vo하나
	  		contents vo하나
	  		pagingation page,totalcount 들어가는 vo하나
		    "contents": [],
		    "pagination": {
		      "page": 1,
		      "totalCount": 100
		    }
		  }
*/		
		return data;
	}
	@PostMapping(value = "/ajax/deleteEmp.do")
	@ResponseBody
	public Map deleteEmp(@RequestBody GridData gridData) {

		Map<String,Object> data = new HashMap();
		dao.deleteEmp(gridData.deletedRows.get(0));
		data.put("result", true);
		data.put("data", gridData.deletedRows);
		return data;
	}
	
	@PutMapping(value = "/ajax/updateEmp.do")
	@ResponseBody
	public Map updateEmp(@RequestBody GridData gridData) {

		Map<String,Object> data = new HashMap();
		for(int i =0; i<gridData.updatedRows.size(); i++) {
			dao.updateEmp(gridData.updatedRows.get(i));	
		}
		data.put("result", true);
		data.put("data", gridData.updatedRows);
		return data;
	}
	   
	@PostMapping(value = "/ajax/insertEmp.do")
	@ResponseBody
	public Map insertEmp(@RequestBody GridData gridData) {
		Map<String,Object> data = new HashMap();
		dao.insertEmp(gridData.createdRows.get(0));
		data.put("result", true);
		data.put("data", gridData.createdRows);
		return data;
	}
	
}
