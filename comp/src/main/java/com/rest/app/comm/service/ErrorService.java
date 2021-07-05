package com.rest.app.comm.service;

import java.util.List;

import com.rest.app.comm.vo.ErrorListVO;
import com.rest.app.comm.vo.ErrorVO;

public interface ErrorService {
	//불량코드,명 리스트
	public List<ErrorVO> getErrorList(ErrorVO vo);
	
	//불량내역 리스트
	public List<ErrorListVO> getAllErrorList(ErrorListVO vo);
}
