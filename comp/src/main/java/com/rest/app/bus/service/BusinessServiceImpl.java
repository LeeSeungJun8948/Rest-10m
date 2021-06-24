package com.rest.app.bus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.bus.mapper.BusinessMapper;
import com.rest.app.bus.vo.BusinessVO;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	BusinessMapper mapper;
	
	@Override
	public List<BusinessVO> getBus() {
		// TODO Auto-generated method stub
		return mapper.getBus();
	}

}
