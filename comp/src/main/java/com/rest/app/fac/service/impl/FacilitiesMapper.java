package com.rest.app.fac.service.impl;

import java.util.List;

import com.rest.app.fac.vo.FacilitiesVO;

public interface FacilitiesMapper {
	public List<FacilitiesVO> getFac();
	public int insertFac(FacilitiesVO vo);
	public int deleteFac(FacilitiesVO vo);
	public List<FacilitiesVO> getFacProcess(); // tab2 설비공정 목록
	public FacilitiesVO getFacInfo(FacilitiesVO vo); // grid 데이터 input칸에 불러오기
	public int updateFac(FacilitiesVO vo); // 불러온 데이터 수정하기
	public int getFacCode();
}
