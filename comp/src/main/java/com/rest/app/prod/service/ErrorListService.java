package com.rest.app.prod.service;

import java.util.List;

import com.rest.app.prod.vo.ErrorListVO;

public interface ErrorListService {
	public List<ErrorListVO> getErrorList(ErrorListVO vo);

}
