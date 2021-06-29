package com.rest.app.comm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.comm.service.EmployeeService;
import com.rest.app.comm.vo.EmployeeVO;


@Service("EmployeeService")
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	EmployeeMapper mapper;
	
	
	@Override
	public List<EmployeeVO> getEmp() {
		return mapper.getEmp();
	}

	
	@Override
	public int deleteEmp(EmployeeVO vo) {
		return mapper.deleteEmp(vo);
	}


	@Override
	public int updateEmp(EmployeeVO vo)   {
		return mapper.updateEmp(vo);
	}


	@Override
	public int insertEmp(EmployeeVO vo) {
		return mapper.insertEmp(vo);
	}
}