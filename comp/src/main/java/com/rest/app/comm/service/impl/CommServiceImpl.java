package com.rest.app.comm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rest.app.comm.service.CommService;
import com.rest.app.comm.vo.CommVO;

@Repository
public class CommServiceImpl implements CommService {

	@Autowired
	CommMapper mapper;
	
	@Override
	public List<CommVO> getComm() {
		// TODO 공통코드 리스트 출력
		return mapper.getComm();
	}

}
