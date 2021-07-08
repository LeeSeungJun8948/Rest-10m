package com.rest.app.comm.service;

import java.util.List;

import com.rest.app.comm.vo.ErrorVO;

public interface ErrorService {
	//불량코드,명 리스트
	public List<ErrorVO> getErrorList(ErrorVO vo);
		
	//블량코드,명 입력
	public int insertError(ErrorVO vo);
		
	//불량코드,명 수정
	public int updateError(ErrorVO vo);
		
	//불량코드,명 삭제
	public int deleteError(ErrorVO vo);
		
	public ErrorVO MaxErrorCode();
	
}
