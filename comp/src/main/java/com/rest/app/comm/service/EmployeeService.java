package com.rest.app.comm.service;

import java.util.List;

import com.rest.app.comm.vo.EmployeeVO;

public interface EmployeeService {
	public List<EmployeeVO> getEmp();
	public int deleteEmp(EmployeeVO vo);
	public int updateEmp(EmployeeVO vo);
	public int insertEmp(EmployeeVO vo); 
}
