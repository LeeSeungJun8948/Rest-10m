package com.rest.app.comm.service;

import java.util.List;

import egovframework.com.cmm.LoginVO;

public interface MenuService {
	List<?> getMenuList(LoginVO vo);
}
