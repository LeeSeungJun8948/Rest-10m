package com.rest.app.prod.service.impl;

import java.util.List;

import com.rest.app.prod.vo.ErrorListVO;

public interface ErrorListMapper {
	public List<ErrorListVO> getErrorList(ErrorListVO vo);

}
