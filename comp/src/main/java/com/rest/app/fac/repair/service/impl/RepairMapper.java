package com.rest.app.fac.repair.service.impl;

import java.util.List;
import java.util.Map;

import com.rest.app.fac.repair.vo.RepairVO;

public interface RepairMapper {
	public List<RepairVO> getRep();
	public int insertRep(RepairVO vo);
	public int deleteRep(RepairVO vo);
	public RepairVO getRepInfo(RepairVO vo);
	public int updateRep(RepairVO vo);
	public int getRepCode();
	public List<RepairVO> repairList();
	public int insertRepair(RepairVO vo);
	public List<RepairVO> repairList(Map<String, Object> param);
}
 