package com.rest.app.bus.service;

import java.util.List;
import java.util.Map;

import com.rest.app.bus.vo.CompanyVO;
import com.rest.app.bus.vo.DetailExportVO;
import com.rest.app.bus.vo.ExportLotVO;
import com.rest.app.bus.vo.ExportVO;
import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.comm.vo.BomVO;

public interface BusinessService {
	public List<OrdersVO> getBus(Map<String, Object> param);// 주문관리참조 조회 리스트

//	public List<OrdersVO> getExport(Map<String, Object> param);//출고검색
	List<ExportVO> getExportModal(Map<String, Object> param);// 출고검색 모달

	List<ExportVO> searchExport(Map<String, Object> param);// 출고조회

	public List<OrdersVO> getUnExport(Map<String, Object> param);// 미출고검색

	public List<CompanyVO> getCompany(CompanyVO vo);// 고객사리스트 모달창

	public List<BomVO> getProduct(BomVO vo);// 제품 모달창

	public List<OrdersVO> getProInventory(Map<String, Object> param);// 제품재고조회

	public int insertExport(ExportVO vo);

	public int updateExport(ExportVO vo);

	public int deleteExport(String exportCode);

	int insertDetailExport(DetailExportVO vo);

	int updateDetailExport(DetailExportVO vo);

	int deleteDetailExport(int idx);

	int deleteAllDetailExport(String exportCode);

	public List<DetailExportVO> getDetailExport(Map<String, Object> param);// 세부기록

	int insertExportLot(ExportLotVO vo);

	int updateExportLot(ExportLotVO vo);

	int deleteExportLot(int lotIdx);

	int deleteAllExportLot(String exportCode);

	List<ExportLotVO> readExportLot(Map<String, Object> param);

	public List<ExportLotVO> getProdLotModal(Map<String, Object> param);

	public List<ExportLotVO> searchProdLotModal(Map<String, Object> param);
}
