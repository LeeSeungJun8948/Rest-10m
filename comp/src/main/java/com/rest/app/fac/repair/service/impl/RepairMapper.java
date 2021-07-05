package com.rest.app.fac.repair.service.impl;

import java.util.List;

import com.rest.app.fac.repair.vo.RepairVO;

public interface RepairMapper {
	public List<RepairVO> getRep();
	public int insertRep(RepairVO vo);
	public int deleteRep(RepairVO vo);
}
 