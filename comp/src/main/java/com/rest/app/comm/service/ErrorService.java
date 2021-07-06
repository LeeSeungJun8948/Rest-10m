package com.rest.app.comm.service;

import java.util.List;

import com.rest.app.comm.vo.ErrorListVO;
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
		
	//불량내역 리스트
	public List<ErrorListVO> getAllErrorList(ErrorListVO vo);
		
	//블량내역 입력
	public int insertErrorList(ErrorListVO vo);
		
	//불량내역 수정
	public int updateErrorList(ErrorListVO vo);
	
	//불량내역 삭제
	public int deleteErrorList(ErrorListVO vo);
	
}
