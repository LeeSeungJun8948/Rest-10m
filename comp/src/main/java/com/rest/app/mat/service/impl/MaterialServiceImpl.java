package com.rest.app.mat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.mat.service.MaterialService;
import com.rest.app.mat.vo.InorderVO;
import com.rest.app.mat.vo.InoutVO;
import com.rest.app.mat.vo.MaterialVO;
import com.rest.app.mat.vo.SelectListVO;

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
	public List<InoutVO> getMatInoutList(InoutVO vo) { // 입출고 리스트
		return mapper.getMatInoutList(vo);
	}

	@Override
	public InoutVO getNewIoCode() { // 입출고 행 추가시 새 입출고코드 불러오기
		return mapper.getNewIoCode();
	}

	@Override
	public InoutVO getMatInfoForIn(InoutVO vo) { // 발주번호 입력시 자재정보 불러오기
		return mapper.getMatInfoForIn(vo);
	}

	@Override
	public int istInout(InoutVO vo) { // 입출고 인설트
		return mapper.istInout(vo);
	}

	@Override
	public int udtInout(InoutVO vo) { // 입출고 업데이트
		return mapper.udtInout(vo);
	}

	@Override
	public int delInout(InoutVO vo) {
		return mapper.delInout(vo);
	}

	@Override
	public List<SelectListVO> getProcessList(SelectListVO vo) {
		return mapper.getProcessList(vo);
	}

	@Override
	public InoutVO getMatInfoForOut(InoutVO vo) {
		return mapper.getMatInfoForOut(vo);
	}

	@Override
	public List<MaterialVO> getMatListModal(MaterialVO vo) {
		return mapper.getMatListModal(vo);
	}
	
	
	
}
