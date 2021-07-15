package com.rest.app.comm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.comm.service.EmployeeService;
import com.rest.app.comm.vo.EmployeeVO;

import egovframework.com.utl.sim.service.EgovFileScrty;


@Service("EmployeeService")
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	EmployeeMapper mapper;
	
	
	@Override
	public List<EmployeeVO> getEmp(EmployeeVO vo) {
		return mapper.getEmp(vo);
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
		try {
			String pwd =  EgovFileScrty.encryptPassword(vo.getPwd(), vo.getId());
			vo.setPwd(pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.insertEmp(vo);
	}


	@Override
	public int maxEmpCode() {
		return mapper.maxEmpCode();
	}
}
