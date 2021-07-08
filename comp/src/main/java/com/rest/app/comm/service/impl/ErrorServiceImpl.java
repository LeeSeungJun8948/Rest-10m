package com.rest.app.comm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rest.app.comm.service.ErrorService;
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
	public int insertError(ErrorVO vo) {
		// TODO 불량코드,명 입력
		return mapper.insertError(vo);
	}

	@Override
	public int updateError(ErrorVO vo) {
		// TODO 불량코드,명 수정
		return mapper.updateError(vo);
	}
	@Override
	public int deleteError(ErrorVO vo) {
		// TODO 불량코드,명 삭제
		return mapper.deleteError(vo);
	}

	@Override
	public ErrorVO MaxErrorCode() {
		// TODO Auto-generated method stub
		return mapper.MaxErrorCode();
	}
	


}
