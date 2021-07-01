package com.rest.app.fac.service.impl;

import java.util.List;

import com.rest.app.fac.vo.FacilitiesVO;

public interface FacilitiesMapper {
	public List<FacilitiesVO> getFac();
	public int insertFac(FacilitiesVO vo);
	public int deleteFac(FacilitiesVO vo);
	public List<FacilitiesVO> getFacProcess();
}
