package com.rest.app.mat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.mat.service.MaterialService;
import com.rest.app.mat.vo.MaterialVO;

@Service("MaterialService")
public class MaterialServiceImpl implements MaterialService{

	@Autowired
	MaterialMapper mapper;
	
	@Override
	public List<MaterialVO> getMatList() {
		return mapper.getMatList();
	}

	@Override
	public MaterialVO getMatInfo(MaterialVO vo) {
		return mapper.getMatInfo(vo);
	}

}
