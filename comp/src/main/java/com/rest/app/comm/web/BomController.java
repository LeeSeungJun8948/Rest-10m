package com.rest.app.comm.web;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rest.app.comm.service.BomService;
import com.rest.app.comm.vo.BomVO;

import lombok.Data;

@Data
class BomGridData{
	List<BomVO> deletedRows;
	List<BomVO> updatedRows;
	List<BomVO> createdRows;
}

@Controller
public class BomController {

	@Autowired
	BomService dao;
	
	@RequestMapping("/commList.do")
	public String commList() {
		return "/sym/ccm/cde/SelectCcmCmmnDetailCodeList.do";
	}
	
	
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		return "comm/main.page";
	}
	
	
	//제품코드,제품명,규격 리스트 (모달)
	@RequestMapping("bomList.do")
	public String getProduct(Model model, BomVO vo) {
		return "comm/bomList.page";
	}

	
	
	//제품코드,제품명,규격 리스트 ajax
	@RequestMapping("/ajax/bomList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetBomList(BomVO vo) {
		Map<String,Object> datas = new HashMap<String, Object>();
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getProduct(vo));
		data.put("data", datas);
		return data;
	}
	//모달 
	@RequestMapping("modal.do")
	public String modal() {
		return "app/comm/modal";
	}
	
	
	//제품 조회 , 소요자재조회
	@RequestMapping("getInfoProduct.do")
	public ModelAndView getInfoProduct(Model model, BomVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/comm/bomList.page");
		mv.addObject("info", dao.getInfoProduct(vo));  //제품 단건조회
		mv.addObject("companyList", dao.getCompanyList(vo)); //제품에 대한 고객사명 리스트
		mv.addObject("binfo", dao.getInfoBom(vo));  //소요자재 조회
		return mv;  
	}
	
	//ajax  소요자재조회
	@RequestMapping("/ajax/getInfoProduct.do")
	@ResponseBody
	public Map<String, Object> ajaxgetInfoProduct(BomVO vo) {
		Map<String,Object> datas = new HashMap<String, Object>();
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getInfoBom(vo));
		data.put("data", datas);
		return data;
	}
	
	//자재명 불러오기
	@RequestMapping("/ajax/getMatName.do")
	@ResponseBody
	public BomVO ajaxgetMatNameT(Model model, BomVO vo) {
		return dao.getMatName(vo);
	}
	//공정명 불러오기
	@RequestMapping("/ajax/getProName.do")
	@ResponseBody
	public BomVO ajaxgetProName(Model model,BomVO vo) {
		return dao.getProName(vo);
	}
	
	//소요자재 추가
	@PostMapping(value="/ajax/insertBom.do")
	@ResponseBody
	public Map<String, Object> insertBom(@RequestBody BomGridData bomGridData) {
		Map<String,Object> data = new HashMap<String,Object>();
		dao.insertBom(bomGridData.createdRows.get(0));
		data.put("result", true);
		data.put("data", bomGridData.createdRows);
		return data;
	}
	
	//소요자재 수정
	@PutMapping(value="/ajax/updateBom.do")
	@ResponseBody
	public Map<String, Object> updateBom(@RequestBody BomGridData bomGridData) {
	
		Map<String,Object> data = new HashMap<String, Object>();
		for(int i =0; i<bomGridData.updatedRows.size(); i++) {
			dao.updateBom(bomGridData.updatedRows.get(i));	
		}
		data.put("result", true);
		data.put("data",bomGridData.updatedRows);
		return data;
	}
	
	@PutMapping(value= "/ajax/modifyBom.do")
	@ResponseBody
	public Map<String, Object> modifyBom(@RequestBody BomGridData bomGridData) {
		Map<String,Object> data = new HashMap<String,Object>();
		
		System.out.println(bomGridData.createdRows.size()+"++++++++++++++++");
		System.out.println(bomGridData.updatedRows.size());
		for(int i=0; i<bomGridData.createdRows.size(); i++){
			dao.insertBom(bomGridData.createdRows.get(i));
		}
		for(int i=0; i<bomGridData.updatedRows.size(); i++){
			dao.updateBom(bomGridData.updatedRows.get(i));
		}
		data.put("result", true);
		data.put("data",bomGridData.createdRows);
		data.put("data",bomGridData.updatedRows);
		return data;
	}
	
	//입출력 행 추가시 불러올 제품코드
	@RequestMapping("/ajax/getNewProductCode.do")
	@ResponseBody
	public BomVO getNewProductCode(BomVO vo) {
		return dao.getNewProductCode();
	}
	
	//소요자재 삭제
	@PostMapping(value="ajax/deleteBom.do")
	@ResponseBody
	public Map deleteBom(@RequestBody BomGridData bomGirdData) {
		Map<String,Object> data = new HashMap();
		for(int i =0; i<bomGirdData.deletedRows.size(); i++) {
			dao.deleteBom(bomGirdData.deletedRows.get(i));
		}
		data.put("result", true);
		data.put("data", bomGirdData.deletedRows);
		return data;
	}
	
	//Bom 삭제
	@RequestMapping("deleteBom.do")
	public String deleteBom(BomVO vo) {
		dao.deleteBom(vo);
		return "comm/bomList.page";
	} 
}	



