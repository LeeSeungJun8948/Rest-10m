package com.rest.app.prod.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.prod.service.ErrorListService;
import com.rest.app.prod.vo.ErrorListVO;
@Service
public class ErorrListServiceImpl implements ErrorListService {
	@Autowired ErrorListMapper dao;
	@Override
	public List<ErrorListVO> getErrorList(ErrorListVO vo) {
		return dao.getErrorList(vo);
	}

}
