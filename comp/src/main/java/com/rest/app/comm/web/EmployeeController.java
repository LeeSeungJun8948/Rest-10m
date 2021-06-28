package com.rest.app.comm.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.comm.service.EmployeeService;
import com.rest.app.comm.vo.EmployeeVO;

class GridData {
	List<EmployeeVO> deletedRows;
	List<EmployeeVO> updatedRows;
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
	@DeleteMapping(value = "/ajax/deleteEmp.do")
	@ResponseBody
	public Map deleteEmp(@RequestBody GridData gridData, EmployeeVO vo) {
		Map<String,Object> data = new HashMap();
		dao.deleteEmp(vo);
		data.put("result", true);
		data.put("data", gridData.deletedRows);
		return data;
	}
	
	@PutMapping(value = "/ajax/updateEmp.do")
	@ResponseBody
	public Map updateEmp(@RequestBody GridData gridData) {
		System.out.println(gridData.updatedRows);
		Map<String,Object> data = new HashMap();
		dao.updateEmp(gridData.updatedRows.get(0));
		data.put("result", true);
		data.put("data", gridData.updatedRows);
		return data;
	}
}
