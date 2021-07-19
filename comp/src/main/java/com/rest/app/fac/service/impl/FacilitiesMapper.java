package com.rest.app.fac.service.impl;

import java.util.List;
import java.util.Map;

import com.rest.app.comm.vo.EmployeeVO;
import com.rest.app.fac.vo.FacilitiesVO;

public interface FacilitiesMapper {
	public List<FacilitiesVO> getFac(FacilitiesVO vo); // facList.do리스트
	public int insertFac(FacilitiesVO vo);
	public int deleteFac(FacilitiesVO vo);
	public List<FacilitiesVO> getFacList(); // tab1 리스트
	public List<FacilitiesVO> getFacProcess(); // tab2 설비공정 목록
	public FacilitiesVO getFacInfo(FacilitiesVO vo); // grid 데이터 input칸에 불러오기
	public int updateFac(FacilitiesVO vo); // 불러온 데이터 수정하기
	public int getFacCode();
	public List<EmployeeVO> getEmpListModal(EmployeeVO vo);
	public int insertFacilities(FacilitiesVO vo);
	public List<FacilitiesVO> getFac(Map<String, Object> param);
}
