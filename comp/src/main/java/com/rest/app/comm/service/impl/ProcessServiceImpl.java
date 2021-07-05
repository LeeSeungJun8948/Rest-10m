package com.rest.app.comm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rest.app.comm.service.ProcessService;
import com.rest.app.comm.vo.ProcessVO;

@Repository
public class ProcessServiceImpl implements ProcessService {

	@Autowired
	ProcessMapper mapper;

	@Override
	public List<ProcessVO> getProcessList(ProcessVO vo) {
		// TODO Auto-generated method stub
		return mapper.getProcessList(vo);
	}

	@Override
	public int insertProcess(ProcessVO vo) {
		// TODO Auto-generated method stub
		return mapper.insertProcess(vo);
	}

	@Override
	public int updateProcess(ProcessVO vo) {
		// TODO Auto-generated method stub
		return mapper.updateProcess(vo);
	}

	@Override
	public int deleteProcess(ProcessVO vo) {
		// TODO Auto-generated method stub
		return mapper.deleteProcess(vo);
	}

}