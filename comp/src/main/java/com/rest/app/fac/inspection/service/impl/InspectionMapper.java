package com.rest.app.fac.inspection.service.impl;

import java.util.List;
import java.util.Map;

import com.rest.app.fac.inspection.vo.InspectionVO;
import com.rest.app.fac.vo.FacilitiesVO;

public interface InspectionMapper {
	public List<InspectionVO> getIns(InspectionVO vo);
	public int deleteIns(InspectionVO vo);
	public int insertIns(InspectionVO vo);
	public int updateIns(InspectionVO vo);
	public InspectionVO getInsCode();
	public List<FacilitiesVO> getFacListModal(FacilitiesVO vo);
	public List<InspectionVO> inspectionList();
	public List<InspectionVO> inspectionList(Map<String, Object> param);
}
