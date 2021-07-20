package com.rest.app.mat.service;

import java.util.List;

import com.rest.app.bus.vo.OrdersVO;
import com.rest.app.mat.vo.CommonCodeVO;
import com.rest.app.mat.vo.InorderVO;
import com.rest.app.mat.vo.InoutVO;
import com.rest.app.mat.vo.MaterialVO;
import com.rest.app.mat.vo.ProcMoveVO;
import com.rest.app.mat.vo.ProdVO;
import com.rest.app.mat.vo.SelectListVO;

public interface MaterialService {
	
	public List<MaterialVO> getMatList(); // 자재 요약 리스트 출력
	
	public MaterialVO getMatInfo(MaterialVO vo); // 자재 리스트에서 클릭시 자재 상세 정보 출력
	
	public List<MaterialVO> getMatNo();
	
	public List<MaterialVO> getUnitNo();
	
	public int istMat(MaterialVO vo); // 새 자재 추가
	
	public int udtMat(MaterialVO vo); // 자재 정보 업데이트
	
	public MaterialVO newMatCode(); // 새자재 입력시 다음 자재코드 불러오기
	
	public int matDel(MaterialVO vo); // 자재 삭제
	
	
	public List<InorderVO> getInorderList(InorderVO vo); // 발주 리스트
	
	public InorderVO getNewInorderCode();
	public InorderVO getInorderComp(InorderVO vo);
	public int istInorder(InorderVO vo);
	public int udtInorder(InorderVO vo);
	public int delInorder(InorderVO vo);
	
	public List<InoutVO> getMatInoutList(InoutVO vo); // 입출고 리스트
	
	public InoutVO getNewIoCode(); // 새 입출고 코드 불러오기
	
	
	public InoutVO getMatInfoForIn(InoutVO vo); // 발주번호 입력시 자재정보 불러오기 
	
	public int istInout(InoutVO vo); // 입출고 인설트
	
	public int udtInout(InoutVO vo); // 입출고 업데이트
	
	public int delInout(InoutVO vo); // 입출고 삭제
	
	public InoutVO getMatInfoForOut(InoutVO vo); // 출고관리시 자재코드 입력시 자재정보 불러오기
	
	public List<SelectListVO> getProcessList(SelectListVO vo); // 자재당 공정 리스트 출력
	
	public List<InoutVO> getMatLotStock(InoutVO vo); // 자재 lot별 재고 (재고조정용)
	
	public List<InoutVO> getMatAdjustList(InoutVO vo);
	public int istMatAdjust(InoutVO vo);
	public int udtMatAdjust(InoutVO vo);
	public int delMatAdjust(InoutVO vo);
	
	public List<ProcMoveVO> getPlanList(ProcMoveVO vo);
	
	public List<ProcMoveVO> getInputMat(ProcMoveVO vo);
	
	public List<ProcMoveVO> getProcStatus(ProcMoveVO vo);
	
	//공통코드
	public List<CommonCodeVO> getCodeIdList(CommonCodeVO vo);
	public List<CommonCodeVO> getCodeList(CommonCodeVO vo);
	public CommonCodeVO getDetailCodeId(CommonCodeVO vo);
	
	public int istCodeId(CommonCodeVO vo);
	public int udtCodeId(CommonCodeVO vo);
	public int delCodeId(CommonCodeVO vo);
	public int istCode(CommonCodeVO vo);
	public int udtCode(CommonCodeVO vo);
	public int delCode(CommonCodeVO vo);

	// 생산 모니터링
	public List<ProdVO> getProdMonitoring();
	
	// 모달
	public List<SelectListVO> getMatListModal(SelectListVO vo); // 자재검색 모달 자재리스트
	
	public List<SelectListVO> getProcListModal(SelectListVO vo); // 공정검색 모달 공정리스트
	
	public List<SelectListVO> getMatLotListModal(SelectListVO vo); // 자재별 재고0이상 로트리스트
	
	public List<SelectListVO> getCompListModal(SelectListVO vo); // 업체검색 모달 업체리스트
	
	public List<InorderVO> getInorderListModal(InorderVO vo); // 발주검색 모달 미입고량 0 이상 발주리스트


	
	public List<SelectListVO> getProdListModal(SelectListVO vo); // 제품검색
	
}
