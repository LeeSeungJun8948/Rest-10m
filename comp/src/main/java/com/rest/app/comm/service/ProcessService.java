package com.rest.app.comm.service;

import java.util.List;

import com.rest.app.comm.vo.ProcessVO;

public interface ProcessService {
	public List<ProcessVO> getProcessList(ProcessVO vo);
	public List<ProcessVO> getCompList(ProcessVO vo);
	ProcessVO getCompName(ProcessVO vo);
	int insertProcess(ProcessVO vo);
	int updateProcess(ProcessVO vo);
	int deleteProcess(ProcessVO vo);
	public ProcessVO maxProcessCode();
}