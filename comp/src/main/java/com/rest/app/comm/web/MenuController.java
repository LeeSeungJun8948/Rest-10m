package com.rest.app.comm.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.comm.service.MenuService;

import egovframework.com.cmm.LoginVO;

@Controller
public class MenuController {
	@Autowired
	MenuService dao;

	@RequestMapping("getMenuList.do")
	@ResponseBody
	public Map<String, Object> getMenuList(LoginVO vo) {
		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("contents", dao.getMenuList(vo));
		data.put("result", true);
		data.put("data", datas);
		return data;
	}
}
