package com.rest.app.fac.inspection.service.impl;

import java.util.List;

import com.rest.app.fac.inspection.vo.InspectionVO;

public interface InspectionMapper {
	public List<InspectionVO> getIns(InspectionVO vo);
}
