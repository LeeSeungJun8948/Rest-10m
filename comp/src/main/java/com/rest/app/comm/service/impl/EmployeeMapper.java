package com.rest.app.comm.service.impl;

import java.util.List;
import java.util.Map;

import com.rest.app.comm.vo.EmployeeVO;

public interface EmployeeMapper {
	public List<EmployeeVO> getEmp(EmployeeVO vo);
	public List<EmployeeVO> searchEmp(Map<String, Object> param);
	public int deleteEmp(EmployeeVO vo);
	public int updateEmp(EmployeeVO vo);
	public int insertEmp(EmployeeVO vo);
}  
