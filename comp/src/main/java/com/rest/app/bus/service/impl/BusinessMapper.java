package com.rest.app.bus.service.impl;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.CompanyVO;
import com.rest.app.bus.vo.DetailExportVO;
import com.rest.app.bus.vo.ExportVO;
import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.BomVO;
import com.rest.app.prod.vo.DetailPlanVO;

public interface BusinessMapper {
	public List<OrdersVO> getBus(Map<String, Object> param);// 주문관리조회

	List<ExportVO> getExportModal(Map<String, Object> param);// 출고검색 모달

	List<ExportVO> searchExport(Map<String, Object> param);// 출고조회

	public List<OrdersVO> getUnExport(Map<String, Object> param);// 미출고읽기

	public List<CompanyVO> getCompany(CompanyVO vo);// 고객사 모달

	public List<BomVO> getProduct(BomVO vo);// 제품모달

	public List<OrdersVO> getProInventory(Map<String, Object> param);

	public int insertExport(ExportVO vo);

	public int updateExport(ExportVO vo);

	public int deleteExport(String exportCode);

	int insertDetailExport(DetailExportVO vo);

	int updateDetailExport(DetailExportVO vo);

	int deleteDetailExport(int idx);

	int deleteAllDetailExport(String exportCode);

	public List<DetailExportVO> getDetailExport(Map<String, Object> param);// 출고 세부기록 검색
}
