package com.rest.app.mat.service;

import java.util.List;

import com.rest.app.mat.vo.InorderVO;
import com.rest.app.mat.vo.InoutVO;
import com.rest.app.mat.vo.MaterialVO;

public interface MaterialService {
	
	public List<MaterialVO> getMatList(); // 자재 요약 리스트 출력
	
	public MaterialVO getMatInfo(MaterialVO vo); // 자재 리스트에서 클릭시 자재 상세 정보 출력
	
	public int saveMat(MaterialVO vo); // 자재 상세 폼에서 값 입력시 matCode로 검색해 update인지 insert인지 파악
	
	public int udtMat(MaterialVO vo); // 자재 정보 업데이트
	
	public MaterialVO newMatCode(); // 새자재 입력시 다음 자재코드 불러오기
	
	public int istMat(MaterialVO vo); // 새 자재 추가

	public int matDel(MaterialVO vo); // 자재 삭제
	
	
	public List<InorderVO> getInorderList(InorderVO vo); // 발주 리스트
	
	public List<InoutVO> getMatList(InoutVO vo); // 입출고 리스트
	
}
