package com.rest.app.mat.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rest.app.mat.service.MaterialService;
import com.rest.app.mat.service.impl.MaterialMapper;
import com.rest.app.mat.vo.CommonCodeVO;
import com.rest.app.mat.vo.InorderVO;
import com.rest.app.mat.vo.InoutVO;
import com.rest.app.mat.vo.MaterialVO;
import com.rest.app.mat.vo.ProcMoveVO;
import com.rest.app.mat.vo.ProdVO;
import com.rest.app.mat.vo.SelectListVO;

import egovframework.com.cmm.service.EgovProperties;
import lombok.Data;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;

import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;

@Controller
public class MaterialController {

	@Autowired
	MaterialService dao;

	@Autowired
	MaterialMapper mapper;

	@RequestMapping("/comm/matForm.do")
	public String matForm(Model model) { // 자재 정보 관리 page
		return "mat/matForm.page";
	}
	
	@RequestMapping("/ajax/matNo.do")
	@ResponseBody
	public List<MaterialVO> ajaxMatNo(Model model) {
		return dao.getMatNo();
	}
	
	@RequestMapping("/ajax/unitNo.do")
	@ResponseBody
	public List<MaterialVO> ajaxUnitNo(Model model) {
		return dao.getUnitNo();
	}

	@RequestMapping("/ajax/matList.do")
	@ResponseBody
	public Map<String, Object> ajaxMatForm(Model model, MaterialVO vo) { // 자재 요약 리스트 출력
		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		data.put("result", true);
		datas.put("contents", dao.getMatList(vo));
		data.put("data", datas);

		return data;
	}

	@RequestMapping("/ajax/newMatCode.do")
	@ResponseBody
	public MaterialVO ajaxNewMatCode(Model model, MaterialVO vo) { // 새 자재 입력폼에서 새로 들어갈 자재코드 불러오기
		return dao.newMatCode();
	}

	@PutMapping("/ajax/matModify.do")
	@ResponseBody
	public Map<String, Object> ajaxMatModify(HttpServletRequest request, @RequestBody MatGridData gridData) {
		Map<String, Object> data = new HashMap<String, Object>();

		for (int i = 0; i < gridData.createdRows.size(); i++) {
			dao.istMat(gridData.createdRows.get(i));
		}
		for (int i = 0; i < gridData.updatedRows.size(); i++) {
			dao.udtMat(gridData.updatedRows.get(i));
		}
		for (int i = 0; i < gridData.deletedRows.size(); i++) {
			dao.matDel(gridData.deletedRows.get(i));
		}

		data.put("result", true);
		data.put("data", gridData.updatedRows);
		data.put("data", gridData.createdRows);
		data.put("data", gridData.deletedRows);
		return data;
	}
	
	@RequestMapping("/mat/view/inorderList.do")
	public String inorderList(Model model) {
		return "mat/inorderList.page";
	}

	@RequestMapping("/mat/mng/inorderForm.do")
	public String inorderForm(Model model) {
		return "mat/inorderForm.page";
	}
	
	@RequestMapping("/ajax/getInorderList.do")
	@ResponseBody
	public Map<String, Object> ajaxInorderList(InorderVO vo) {

		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		data.put("result", true);
		datas.put("contents", dao.getInorderList(vo));
		data.put("data", datas);

		return data;
	}
	
	@RequestMapping("/ajax/getNewInorderCode.do")
	@ResponseBody
	public InorderVO getNewInorderCode(InorderVO vo) { // 입출력 행 추가시 불러올 새 입출고 코드
		return dao.getNewInorderCode();
	}
	
	@RequestMapping("/ajax/getInorderComp.do")
	@ResponseBody
	public InorderVO ajaxGetInorderComp(InorderVO vo) {
		return dao.getInorderComp(vo);
	}
	
	@PutMapping("/ajax/modifyInorder.do")
	@ResponseBody
	public Map<String, Object> ajaxModifyInorder(HttpServletRequest request, @RequestBody InorderGridData gridData) {
		Map<String, Object> data = new HashMap<String, Object>();

		for (int i = 0; i < gridData.createdRows.size(); i++) {
			dao.istInorder(gridData.createdRows.get(i));
		}
		for (int i = 0; i < gridData.updatedRows.size(); i++) {
			dao.udtInorder(gridData.updatedRows.get(i));
		}
		for (int i = 0; i < gridData.deletedRows.size(); i++) {
			dao.delInorder(gridData.deletedRows.get(i));
		}

		data.put("result", true);
		data.put("data", gridData.updatedRows);
		data.put("data", gridData.createdRows);
		data.put("data", gridData.deletedRows);
		return data;
	}

	@RequestMapping(value = { "/ajax/matInList.do", "/ajax/matOutList.do" }, method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> ajaxInoutList(InoutVO vo, HttpServletRequest request) {

		String url = request.getServletPath();
		if (url.equals("/ajax/matInList.do")) {
			vo.setInoutNo("01");
		} else if (url.equals("/ajax/matOutList.do")) {
			vo.setInoutNo("02");
		}

		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		data.put("result", true);

		datas.put("contents", dao.getMatInoutList(vo));
		data.put("data", datas);

		return data;
	}

	@RequestMapping("/ajax/getMatInfoForIn.do")
	@ResponseBody
	public InoutVO ajaxGetMatInfoForIn(Model model, InoutVO vo) { // 자재 리스트에서 클릭시 자재 상세 정보 출력
		return dao.getMatInfoForIn(vo);
	}

	@RequestMapping("/ajax/getNewIoCode.do")
	@ResponseBody
	public InoutVO getNewIoCode(InoutVO vo) { // 입출력 행 추가시 불러올 새 입출고 코드
		return dao.getNewIoCode();
	}

	@PutMapping(value = { "/ajax/matInModify.do", "/ajax/matOutModify.do" })
	@ResponseBody
	public Map<String, Object> modifyMatInout(HttpServletRequest request, @RequestBody GridData gridData) {
		Map<String, Object> data = new HashMap<String, Object>();

		String url = request.getServletPath();

		for (int i = 0; i < gridData.createdRows.size(); i++) {

			if (url.equals("/ajax/matInModify.do")) {
				gridData.createdRows.get(i).setInoutNo("01");
			} else if (url.equals("/ajax/matOutModify.do")) {
				gridData.createdRows.get(i).setInoutNo("02");
			}
			dao.istInout(gridData.createdRows.get(i));
		}

		for (int i = 0; i < gridData.updatedRows.size(); i++) {

			if (url.equals("/ajax/matInModify.do")) {
				gridData.updatedRows.get(i).setInoutNo("01");
			} else if (url.equals("/ajax/matOutModify.do")) {
				gridData.updatedRows.get(i).setInoutNo("02");
			}

			dao.udtInout(gridData.updatedRows.get(i));
		}

		for (int i = 0; i < gridData.deletedRows.size(); i++) {

			if (url.equals("/ajax/matInModify.do")) {
				gridData.deletedRows.get(i).setInoutNo("01");
			} else if (url.equals("/ajax/matOutModify.do")) {
				gridData.deletedRows.get(i).setInoutNo("02");
			}

			dao.delInout(gridData.deletedRows.get(i));
		}

		data.put("result", true);
		data.put("data", gridData.updatedRows);
		data.put("data", gridData.createdRows);
		data.put("data", gridData.deletedRows);
		return data;
	}

	@RequestMapping("/ajax/getMatInfoForOut.do")
	@ResponseBody
	public InoutVO ajaxGetMatInfoForOut(Model model, InoutVO vo) {
		return dao.getMatInfoForOut(vo);
	}

	@RequestMapping("/ajax/getProcessList.do")
	@ResponseBody
	public List<SelectListVO> ajaxGetProcessList(SelectListVO vo) {
		return dao.getProcessList(vo);
	}

	@RequestMapping("/ajax/matLotStock.do")
	@ResponseBody
	public Map<String, Object> ajaxMatLotStock(InoutVO vo) {

		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		data.put("result", true);
		datas.put("contents", dao.getMatLotStock(vo));
		data.put("data", datas);

		return data;
	}

	// 그리드에 널값 넣기
	@RequestMapping("/ajax/matAdjustNull.do")
	@ResponseBody
	public Map<String, Object> ajaxMatAdjust() {

		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		data.put("result", true);
		datas.put("contents", new int[0]);
		data.put("data", datas);

		return data;
	}

	@PutMapping("/ajax/matAdjustModify.do")
	@ResponseBody
	public Map<String, Object> modifyMatAdjust(HttpServletRequest request, @RequestBody GridData gridData) {
		Map<String, Object> data = new HashMap<String, Object>();

		for (int i = 0; i < gridData.createdRows.size(); i++) {
			if (gridData.createdRows.get(i).getIoVolume() != 0) {
				dao.istMatAdjust(gridData.createdRows.get(i));
			}
		}
		for (int i = 0; i < gridData.updatedRows.size(); i++) {
			dao.udtMatAdjust(gridData.updatedRows.get(i));
		}
		for (int i = 0; i < gridData.deletedRows.size(); i++) {
			dao.delMatAdjust(gridData.deletedRows.get(i));
		}

		data.put("result", true);
		data.put("data", gridData.updatedRows);
		data.put("data", gridData.createdRows);
		data.put("data", gridData.deletedRows);
		return data;
	}

	@RequestMapping("/ajax/matAdjustList.do")
	@ResponseBody
	public Map<String, Object> ajaxMatAdjustList(InoutVO vo) {

		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		data.put("result", true);
		datas.put("contents", dao.getMatAdjustList(vo));
		data.put("data", datas);

		return data;
	}

	@RequestMapping("/ajax/getInoutNo.do")
	@ResponseBody
	public InoutVO getInoutNo(InoutVO vo) {
		return mapper.getInoutNo(vo); // 서비스 만들기 귀찮아서 걍 바로씀..
	}

	@RequestMapping("/mat/view/matInList.do")
	public String matInList(Model model) {
		return "mat/matInList.page";
	}

	@RequestMapping("/mat/mng/matInForm.do")
	public String matInForm(Model model) {
		return "mat/matInForm.page";
	}

	@RequestMapping("/mat/mng/matAdjustWrite.do")
	public String matStockForm(Model model) {
		return "mat/matAdjustWrite.page";
	}

	@RequestMapping("/mat/mng/matAdjustForm.do")
	public String matSaveStockForm(Model model) {
		return "mat/matAdjustForm.page";
	}

	@RequestMapping("/mat/view/matAdjustList.do")
	public String matSaveStockList(Model model) {
		return "mat/matAdjustList.page";
	}

	@RequestMapping("/mat/mng/matOutForm.do")
	public String matOutForm(Model model) {
		return "mat/matOutForm.page";
	}

	@RequestMapping("/mat/view/matOutList.do")
	public String matOutList(Model model) {
		return "mat/matOutList.page";
	}

	@RequestMapping("/pro/view/procMovePrint.do")
	public String procMovePrint(Model model) {
		return "mat/procMovePrint.page";
	}

	@RequestMapping("/ajax/planGrid.do")
	@ResponseBody
	public Map<String, Object> ajaxPlanGrid(ProcMoveVO vo) {

		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		data.put("result", true);
		datas.put("contents", dao.getPlanList(vo));
		data.put("data", datas);

		return data;
	}

	@RequestMapping("/ajax/getInputMatList.do")
	@ResponseBody
	public List<ProcMoveVO> ajaxGetInputMatList(ProcMoveVO vo) {
		return dao.getInputMat(vo);
	}

	@RequestMapping("/ajax/getProcStatus.do")
	@ResponseBody
	public List<ProcMoveVO> ajaxGetProcStatus(ProcMoveVO vo) {
		return dao.getProcStatus(vo);
	}

	@RequestMapping("/pro/view/printProcessMove.do")
	public String printProcessMove(ProcMoveVO vo, Model model) {

		String str = vo.getProductLot();
		try {
			Barcode barcode = BarcodeFactory.createCode128B(str);
			barcode.setBarHeight(80);
			File file = new File(EgovProperties.getProperty("Globals.fileStorePath"), str + ".jpg");
			BarcodeImageHandler.saveJPEG(barcode, file);
			model.addAttribute("barcode", str + ".jpg");
			model.addAttribute("vo", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "app/mat/printProcessMove";
	}

	// 공통 코드
	@RequestMapping("/comm/commonCodeForm.do")
	public String commonCodeForm() {
		return "mat/commonCodeForm.page";
	}

	@RequestMapping("/ajax/getCodeIdList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetCodeIdList(CommonCodeVO vo) {

		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		data.put("result", true);
		datas.put("contents", dao.getCodeIdList(vo));
		data.put("data", datas);

		return data;
	}

	@RequestMapping("/ajax/getDetailCode.do")
	@ResponseBody
	public CommonCodeVO ajaxGetCode(CommonCodeVO vo) {
		return dao.getDetailCodeId(vo);
	}

	@RequestMapping("/ajax/getDetailCodeList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetCodeList(CommonCodeVO vo) {

		Map<String, Object> datas = new HashMap<>();
		Map<String, Object> data = new HashMap<>();

		data.put("result", true);
		datas.put("contents", dao.getCodeList(vo));
		data.put("data", datas);

		return data;
	}

	@PutMapping("/ajax/codeIdModify.do")
	@ResponseBody
	public Map<String, Object> ajaxCodeIdModify(HttpServletRequest request, @RequestBody CommonGridData gridData) {
		Map<String, Object> data = new HashMap<String, Object>();

		for (int i = 0; i < gridData.createdRows.size(); i++) {
			dao.istCodeId(gridData.createdRows.get(i));
		}
		for (int i = 0; i < gridData.updatedRows.size(); i++) {
			dao.udtCodeId(gridData.updatedRows.get(i));
		}
		for (int i = 0; i < gridData.deletedRows.size(); i++) {
			dao.delCodeId(gridData.deletedRows.get(i));
		}

		data.put("result", true);
		data.put("data", gridData.updatedRows);
		data.put("data", gridData.createdRows);
		data.put("data", gridData.deletedRows);
		return data;
	}

	@PutMapping("/ajax/codeModify.do")
	@ResponseBody
	public Map<String, Object> ajaxCodeModify(HttpServletRequest request, @RequestBody CommonGridData gridData) {
		Map<String, Object> data = new HashMap<String, Object>();

		for (int i = 0; i < gridData.createdRows.size(); i++) {
			dao.istCode(gridData.createdRows.get(i));
		}
		for (int i = 0; i < gridData.updatedRows.size(); i++) {
			dao.udtCode(gridData.updatedRows.get(i));
		}
		for (int i = 0; i < gridData.deletedRows.size(); i++) {
			dao.delCode(gridData.deletedRows.get(i));
		}

		data.put("result", true);
		data.put("data", gridData.updatedRows);
		data.put("data", gridData.createdRows);
		data.put("data", gridData.deletedRows);
		return data;
	}

	@RequestMapping("/pro/view/prodMonitoring.do")
	public String prodMonitoring(Model model) {
		return "mat/prodMonitoring.page";
	}

	@RequestMapping("/ajax/getProdMonitoring.do")
	@ResponseBody
	public List<ProdVO> ajaxGetProdMonitoring() {
		return dao.getProdMonitoring();
	}

	// 출력
	@RequestMapping("/mat/view/inorderExcel.do")
	public ModelAndView inorderExcel(InorderVO vo)
			throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {

		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> headerMap = new HashMap<String, Object>();
		List<InorderVO> list = dao.getInorderList(vo);
		List<Map<String, String>> data = new ArrayList<>();

		for (InorderVO e : list) {
			data.add(BeanUtils.describe(e));
		}

		headerMap.put("inorderCode", "발주코드");
		headerMap.put("inorderDate", "발주일자");
		headerMap.put("materialName", "자재명");
		headerMap.put("inorderCount", "발주업체");
		headerMap.put("inorderCount", "발주량");
		headerMap.put("inCount", "입고량");
		headerMap.put("yetCount", "미입고량");
		headerMap.put("companyName", "발주업체");
		headerMap.put("comments", "비고");

		map.put("headerMap", headerMap);
		map.put("filename", "inorder_excel");
		map.put("datas", data);
		return new ModelAndView("commonExcelView", map);
	}

	@RequestMapping("/mat/view/matInExcel.do")
	public ModelAndView matInExcel(@RequestParam String param) throws JsonParseException, JsonMappingException, IOException {
		param = param.replaceAll("&quot;", "\"");
		System.out.println(param);
		ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		List<Map<String, String>> data = mapper.readValue(param, new TypeReference<List<Map<String, String>>>() {});
			
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> headerMap = new HashMap<String, Object>();
		
		headerMap.put("ioCode", "입고코드");
		headerMap.put("ioDate", "입고일자");
		headerMap.put("inorderCode", "발주번호");
		headerMap.put("materialName", "자재명");
		headerMap.put("ioVolume", "입고량");
		headerMap.put("unitNo", "단위");
		headerMap.put("unitPrice", "단가");
		headerMap.put("price", "총액");
		headerMap.put("lotNo", "LOT");
		headerMap.put("stock", "자재재고");
		headerMap.put("companyName", "입고업체");
		headerMap.put("comments", "비고");
		
		map.put("headerMap", headerMap);
		map.put("filename", "matIn_excel");
		map.put("datas", data);
		return new ModelAndView("commonExcelView", map);
	}

	@RequestMapping("/mat/view/matOutExcel.do")
	public ModelAndView matOutExcel(@RequestParam String param) throws JsonParseException, JsonMappingException, IOException {
		param = param.replaceAll("&quot;", "\"");
		System.out.println(param);
		ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		List<Map<String, String>> data = mapper.readValue(param, new TypeReference<List<Map<String, String>>>() {});
			
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> headerMap = new HashMap<String, Object>();

		headerMap.put("ioCode", "출고코드");
		headerMap.put("ioDate", "출고일자");
		headerMap.put("materialName", "출고자재");
		headerMap.put("ioVolume", "출고량");
		headerMap.put("unitNo", "단위");
		headerMap.put("lotNo", "LOT");
		headerMap.put("processName", "출고공정");
		headerMap.put("stock", "자재재고");
		headerMap.put("comments", "비고");

		map.put("headerMap", headerMap);
		map.put("filename", "matOut_excel");
		map.put("datas", data);
		return new ModelAndView("commonExcelView", map);
	}

	@RequestMapping("/mat/view/matAdjustExcel.do")
	public ModelAndView matAdjustExcel(@RequestParam String param) throws JsonParseException, JsonMappingException, IOException {
		param = param.replaceAll("&quot;", "\"");
		System.out.println(param);
		ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		List<Map<String, String>> data = mapper.readValue(param, new TypeReference<List<Map<String, String>>>() {});
			
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> headerMap = new HashMap<String, Object>();


		headerMap.put("ioCode", "정산코드");
		headerMap.put("materialName", "자재명");
		headerMap.put("lotNo", "LOT");
		headerMap.put("ioVolume", "정산량");
		headerMap.put("unitPrice", "단가");
		headerMap.put("stock", "총액");
		headerMap.put("unitNo", "단위");
		headerMap.put("inoutNo", "정산");
		headerMap.put("stock", "자재재고");
		headerMap.put("ioDate", "정산일자");
		headerMap.put("comments", "비고");

		map.put("headerMap", headerMap);
		map.put("filename", "matAdjust_excel");
		map.put("datas", data);
		return new ModelAndView("commonExcelView", map);
	}

}

@Data
class MatGridData {
	List<MaterialVO> deletedRows;
	List<MaterialVO> updatedRows;
	List<MaterialVO> createdRows;
}

@Data
class InorderGridData {
	List<InorderVO> deletedRows;
	List<InorderVO> updatedRows;
	List<InorderVO> createdRows;
}
@Data
class CommonGridData {
	List<CommonCodeVO> deletedRows;
	List<CommonCodeVO> updatedRows;
	List<CommonCodeVO> createdRows;
}

@Data
class GridData {
	List<InoutVO> deletedRows;
	List<InoutVO> updatedRows;
	List<InoutVO> createdRows;
}
