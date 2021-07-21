package com.rest.app.mat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.app.mat.service.MaterialService;
import com.rest.app.mat.vo.CommonCodeVO;
import com.rest.app.mat.vo.InorderVO;
import com.rest.app.mat.vo.InoutVO;
import com.rest.app.mat.vo.MaterialVO;
import com.rest.app.mat.vo.ProcMoveVO;
import com.rest.app.mat.vo.ProdVO;
import com.rest.app.mat.vo.SelectListVO;
import com.sun.star.configuration.backend.PropertyInfo;

import lombok.extern.log4j.Log4j;
import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeFactory;

@Service("MaterialService")
public class MaterialServiceImpl implements MaterialService{

	@Autowired
	MaterialMapper mapper;
	
	@Override
	public List<MaterialVO> getMatList(MaterialVO vo) {
		return mapper.getMatList(vo);
	}

	@Override
	public int istMat(MaterialVO vo) { // 새 자재정보 입력
		return mapper.istMat(vo);
	}
	
	@Override
	public int udtMat(MaterialVO vo) { // 업데이트
		return mapper.udtMat(vo);
	}

	@Override
	public MaterialVO newMatCode() { // 새 자재 입력시 새 자재코드 불러오기
		return mapper.newMatCode();
	}

	@Override
	public int matDel(MaterialVO vo) { // 자재삭제
		return mapper.matDel(vo);
	}

	@Override
	public List<InorderVO> getInorderList(InorderVO vo) { // 발주 리스트
		return mapper.getInorderList(vo);
	}

	@Override
	public List<InoutVO> getMatInoutList(InoutVO vo) { // 입출고 리스트
		return mapper.getMatInoutList(vo);
	}

	@Override
	public InoutVO getNewIoCode() { // 입출고 행 추가시 새 입출고코드 불러오기
		return mapper.getNewIoCode();
	}

	@Override
	public InoutVO getMatInfoForIn(InoutVO vo) { // 발주번호 입력시 자재정보 불러오기
		return mapper.getMatInfoForIn(vo);
	}

	@Override
	public int istInout(InoutVO vo) { // 입출고 인설트
		return mapper.istInout(vo);
	}

	@Override
	public int udtInout(InoutVO vo) { // 입출고 업데이트
		return mapper.udtInout(vo);
	}

	@Override
	public int delInout(InoutVO vo) {
		return mapper.delInout(vo);
	}

	@Override
	public List<SelectListVO> getProcessList(SelectListVO vo) {
		return mapper.getProcessList(vo);
	}

	@Override
	public InoutVO getMatInfoForOut(InoutVO vo) {
		return mapper.getMatInfoForOut(vo);
	}

	// 모달
	@Override
	public List<SelectListVO> getMatListModal(SelectListVO vo) {
		return mapper.getMatListModal(vo);
	}

	@Override
	public List<SelectListVO> getProcListModal(SelectListVO vo) {
		return mapper.getProcListModal(vo);
	}

	@Override
	public List<SelectListVO> getMatLotListModal(SelectListVO vo) {
		return mapper.getMatLotListModal(vo);
	}

	@Override
	public List<SelectListVO> getCompListModal(SelectListVO vo) {
		return mapper.getCompListModal(vo);
	}

	@Override
	public List<MaterialVO> getMatNo() {
		return mapper.getMatNo();
	}

	@Override
	public List<MaterialVO> getUnitNo() {
		return mapper.getUnitNo();
	}

	@Override
	public List<InorderVO> getInorderListModal(InorderVO vo) {
		return mapper.getInorderListModal(vo);
	}

	@Override
	public List<InoutVO> getMatLotStock(InoutVO vo) {
		return mapper.getMatLotStock(vo);
	}

	@Override
	public int istMatAdjust(InoutVO vo) {
		return mapper.istMatAdjust(vo);
	}

	@Override
	public int udtMatAdjust(InoutVO vo) {
		return mapper.udtMatAdjust(vo);
	}

	@Override
	public int delMatAdjust(InoutVO vo) {
		return mapper.delMatAdjust(vo);
	}

	@Override
	public List<InoutVO> getMatAdjustList(InoutVO vo) {
		return mapper.getMatAdjustList(vo);
	}

	@Override
	public List<SelectListVO> getProdListModal(SelectListVO vo) {
		return mapper.getProdListModal(vo);
	}

	@Override
	public List<ProcMoveVO> getPlanList(ProcMoveVO vo) {
		return mapper.getPlanList(vo);
	}
	
	@Override
	public List<ProcMoveVO> getInputMat(ProcMoveVO vo){
		return mapper.getInputMat(vo);
	}

	@Override
	public List<ProcMoveVO> getProcStatus(ProcMoveVO vo) {
		List<ProcMoveVO> list = mapper.getProcStatus(vo);
		for(ProcMoveVO data : list) {
			if(data.getWorkCode() == null) {
				data.setStatus("예정");
			}else if(data.getEndTime() == null) {
				data.setStatus("진행중");
			}else {
				data.setStatus("완료");
			}
		}
		return list;
	}

	@Override
	public int istCodeId(CommonCodeVO vo) {
		return mapper.istCodeId(vo);
	}

	@Override
	public int udtCodeId(CommonCodeVO vo) {
		return mapper.udtCodeId(vo);
	}

	@Override
	public int delCodeId(CommonCodeVO vo) {
		return mapper.delCodeId(vo);
	}

	@Override
	public int istCode(CommonCodeVO vo) {
		return mapper.istCode(vo);
	}

	@Override
	public int udtCode(CommonCodeVO vo) {
		return mapper.udtCode(vo);
	}

	@Override
	public int delCode(CommonCodeVO vo) {
		return mapper.delCode(vo);
	}

	@Override
	public List<CommonCodeVO> getCodeIdList(CommonCodeVO vo) {
		return mapper.getCodeIdList(vo);
	}

	@Override
	public List<CommonCodeVO> getCodeList(CommonCodeVO vo) {
		return mapper.getCodeList(vo);
	}

	@Override
	public CommonCodeVO getDetailCodeId(CommonCodeVO vo) {
		return mapper.getDetailCodeId(vo);
	}

	@Override
	public List<ProdVO> getProdMonitoring(){
		return mapper.getProdMonitoring();
	}

	@Override
	public InorderVO getNewInorderCode() {
		return mapper.getNewInorderCode();
	}

	@Override
	public int istInorder(InorderVO vo) {
		return mapper.istInorder(vo);
	}

	@Override
	public int udtInorder(InorderVO vo) {
		return mapper.udtInorder(vo);
	}

	@Override
	public int delInorder(InorderVO vo) {
		return mapper.delInorder(vo);
	}
	
	@Override
	public InorderVO getInorderComp(InorderVO vo) {
		return mapper.getInorderComp(vo);
	}
}
