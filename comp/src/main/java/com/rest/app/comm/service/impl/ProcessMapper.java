package com.rest.app.comm.service.impl;

import java.util.List;

import com.rest.app.comm.vo.ProcessVO;

public interface ProcessMapper {
	public List<ProcessVO> getProcessList(ProcessVO vo);
	int insertProcess(ProcessVO vo);
	int updateProcess(ProcessVO vo);
	int deleteProcess(ProcessVO vo);
	
}
