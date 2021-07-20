package com.rest.app.comm.service.impl;

import java.util.List;

import egovframework.com.cmm.LoginVO;

public interface MenuMapper {
	List<?> getMenuList(LoginVO vo);
}
