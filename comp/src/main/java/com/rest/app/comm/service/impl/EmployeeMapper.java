package com.rest.app.comm.service.impl;

import java.util.List;

import com.rest.app.comm.vo.EmployeeVO;

public interface EmployeeMapper {
	public List<EmployeeVO> getEmp();
	public int deleteEmp(EmployeeVO vo);
	public int updateEmp(EmployeeVO vo);
	public int insertEmp(EmployeeVO vo);
}  
