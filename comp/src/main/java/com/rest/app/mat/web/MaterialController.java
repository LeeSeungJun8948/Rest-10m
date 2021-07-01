package com.rest.app.mat.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.app.mat.service.MaterialService;
import com.rest.app.mat.vo.InorderVO;
import com.rest.app.mat.vo.InoutVO;
import com.rest.app.mat.vo.MaterialVO;

import lombok.Data;

@Controller
public class MaterialController {
	
	@Autowired
	MaterialService dao;

	@RequestMapping("/matForm.do")
	public String matForm(Model model) { // 자재 정보 관리 page 
		return "mat/matForm.page";
	}
	
	@RequestMapping("/ajax/matList.do")
	@ResponseBody
	public List<MaterialVO> ajaxMatForm(Model model) { // 자재 요약 리스트 출력
		return dao.getMatList();
	}
	
	
	@RequestMapping("/ajax/matInfo.do")
	@ResponseBody
	public MaterialVO ajaxMatInfo(Model model, MaterialVO vo) { // 자재 리스트에서 클릭시 자재 상세 정보 출력
		return dao.getMatInfo(vo);
	}
	
	@RequestMapping("/ajax/matSave.do")
	@ResponseBody
	public int ajaxMatSave(Model model, MaterialVO vo) { // 자재 입력&수정
		return dao.saveMat(vo);
	}
	
	@RequestMapping("/ajax/newMatCode.do")
	@ResponseBody
	public MaterialVO ajaxNewMatCode(Model model, MaterialVO vo) { // 새 자재 입력폼에서  새로 들어갈 자재코드 불러오기
		return dao.newMatCode();
	}
	
	@RequestMapping("/ajax/matDel.do")
	@ResponseBody
	public int ajaxMatDel(Model model, MaterialVO vo) { // 자재 입력&수정
		return dao.matDel(vo);
	}
	
	@RequestMapping("inorderForm.do")
	public String inorderForm(Model model) {
		return "mat/inorderForm.page";
	}
	
	@RequestMapping("/ajax/inorderList.do")
	@ResponseBody
	public Map<String, Object> ajaxInorderList(InorderVO vo) {
		
		Map<String,Object> datas = new HashMap<>();
		Map<String,Object> data = new HashMap<>();
		
		
		data.put("result", true);
		datas.put("contents", dao.getInorderList(vo));
		data.put("data", datas);
		
		return data;
	}
	
	@RequestMapping(value = {"/ajax/matInList.do", "/ajax/matOutList.do"}, method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> ajaxInoutList(InoutVO vo, HttpServletRequest request) {
		
		String url = request.getServletPath();
		if(url.equals("/ajax/matInList.do")) {
			vo.setIoType("01");
		}else if(url.equals("/ajax/matOutList.do")) {
			vo.setIoType("02");
		}
		
		Map<String,Object> datas = new HashMap<>();
		Map<String,Object> data = new HashMap<>();
		
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
	
	
	@PutMapping(value = {"/ajax/matInModify.do", "/ajax/matOutModify.do"})
	@ResponseBody
	public Map<String, Object> modifyEmp(HttpServletRequest request, @RequestBody GridData gridData) {
		Map<String,Object> data = new HashMap<String, Object>();
		
		String url = request.getServletPath();
		
		for(int i = 0; i < gridData.createdRows.size(); i++) {
			
			if(url.equals("/ajax/matInModify.do")) {
				gridData.createdRows.get(i).setIoType("01");
			}else if(url.equals("/ajax/matOutModify.do")) {
				gridData.createdRows.get(i).setIoType("02");
			}
			dao.istInout(gridData.createdRows.get(i));
		}
		
		for(int i = 0; i < gridData.updatedRows.size(); i++) {
			
			if(url.equals("/ajax/matInModify.do")) {
				gridData.updatedRows.get(i).setIoType("01");
			}else if(url.equals("/ajax/matOutModify.do")) {
				gridData.updatedRows.get(i).setIoType("02");
			}
			
			dao.udtInout(gridData.updatedRows.get(i));	
		}
		
		
		for(int i = 0; i < gridData.deletedRows.size(); i++) {
			
			if(url.equals("/ajax/matInModify.do")) {
				gridData.deletedRows.get(i).setIoType("01");
			}else if(url.equals("/ajax/matOutModify.do")) {
				gridData.deletedRows.get(i).setIoType("02");
			}
			
			dao.delInout(gridData.deletedRows.get(i));
		}
		
		data.put("result", true);
		data.put("data", gridData.updatedRows);
		data.put("data", gridData.createdRows);
		data.put("data", gridData.deletedRows);
		return data;
	}

	@RequestMapping("matInForm.do")
	public String matInForm(Model model) {
		return "mat/matInForm.page";
	}
	
	
	@RequestMapping("matStockForm.do")
	public String matStockForm(Model model) {
		return "mat/matStockForm.page";
	}
	
	@RequestMapping("matSaveStockList.do")
	public String matSaveStockList(Model model) {
		return "mat/matSaveStockList.page";
	}
	
	@RequestMapping("matOutForm.do")
	public String matOutForm(Model model) {
		return "mat/matOutForm.page";
	}
	
}

@Data
class GridData {	
	List<InoutVO> deletedRows;
	List<InoutVO> updatedRows;
	List<InoutVO> createdRows;
}
