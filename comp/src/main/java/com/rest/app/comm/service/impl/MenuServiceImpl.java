package com.rest.app.comm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.comm.service.MenuService;

import egovframework.com.cmm.LoginVO;

@Service("menuService")
public class MenuServiceImpl implements MenuService {
	@Autowired
	MenuMapper mapper;

	@Override
	public List<?> getMenuList(LoginVO vo) {
		return mapper.getMenuList(vo);
	}
}
