package com.rest.app.mat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.mat.service.MaterialService;
import com.rest.app.mat.vo.InorderVO;
import com.rest.app.mat.vo.InoutVO;
import com.rest.app.mat.vo.MaterialVO;

import lombok.extern.log4j.Log4j;

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

	@Override
	public int saveMat(MaterialVO vo) { // 업데이트인지 새로운 값인지 
		if(mapper.saveMat(vo) == 0) // 입력된 matCode가 없으면 새 자재 입력
			return istMat(vo);
		else 
			return udtMat(vo);
	}

	@Override
	public int udtMat(MaterialVO vo) { // 업데이트
		return mapper.udtMat(vo);
	}

	@Override
	public MaterialVO newMatCode() { // 새 자재 입력시 새 자재코드 불러오기
		return mapper.newMatCode();
	}

	@Override
	public int istMat(MaterialVO vo) { // 새 자재정보 입력
		return mapper.istMat(vo);
	}

	@Override
	public int matDel(MaterialVO vo) { // 자재삭제
		return mapper.matDel(vo);
	}

	@Override
	public List<InorderVO> getInorderList(InorderVO vo) { // 발주 리스트
		return mapper.getInorderList(vo);
	}

	@Override
	public List<InoutVO> getMatList(InoutVO vo) { // 입출고 리스트
		return mapper.getMatList(vo);
	}
}
