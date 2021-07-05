package com.rest.app.comm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rest.app.comm.service.ErrorService;
import com.rest.app.comm.vo.ErrorListVO;
import com.rest.app.comm.vo.ErrorVO;

@Repository
public class ErrorServiceImpl implements ErrorService {

	@Autowired
	ErrorMapper mapper;
	
	@Override
	public List<ErrorVO> getErrorList(ErrorVO vo) {
		// TODO 불량코드,명 리스트 
		return mapper.getErrorList(vo);
	}

	@Override
	public List<ErrorListVO> getAllErrorList(ErrorListVO vo) {
		// TODO 불량내역 리스트
		return mapper.getAllErrorList(vo);
	}

}
