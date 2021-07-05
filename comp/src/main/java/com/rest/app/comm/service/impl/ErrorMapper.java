package com.rest.app.comm.service.impl;

import java.util.List;

import com.rest.app.comm.vo.ErrorListVO;
import com.rest.app.comm.vo.ErrorVO;

public interface ErrorMapper {
	//불량코드,명 리스트
	public List<ErrorVO> getErrorList(ErrorVO vo);
	
	//불량내역 리스트
	public List<ErrorListVO> getAllErrorList(ErrorListVO vo);
}
