package com.rest.app.fac.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rest.app.fac.service.impl.FacilitiesMapper;
import com.rest.app.fac.vo.FacilitiesVO;

class GridData {
	
	List<FacilitiesVO> deletedRows;

	public List<FacilitiesVO> getDeletedRows() {
		return deletedRows;
	}

	public void setDeletedRows(List<FacilitiesVO> deletedRows) {
		this.deletedRows = deletedRows;
	}
	
}
	

@Controller
public class FacilitiesController {
	@Autowired
	FacilitiesMapper mapper;
	
	// 설비 조회
	@RequestMapping("/facList.do")
	public String getFac(Model model) {
		return "fac/facList.page";
	}

	// 설비 관리 목록
	@RequestMapping("ajax/facList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetFac() {
		Map<String,Object> datas = new HashMap();
		Map<String,Object> data = new HashMap();
		data.put("result", true);
		datas.put("contents", mapper.getFac());
		data.put("data", datas);
		return data;
	}
	
	// 탭2 설비 공정 목록
	@RequestMapping("ajax/facProcessList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetFacProcess() {
		Map<String,Object> datas = new HashMap();
		Map<String,Object> data = new HashMap();
		data.put("result", true);
		datas.put("contents", mapper.getFacProcess());
		data.put("data", datas);
		return data;
	}

	// 설비관리
	@RequestMapping("/facAdmin.do")
	public String facAdmin() {
		return "fac/facAdmin.page";
	}

	// 저장
	@RequestMapping(value = "/insertFac.do")
	public String insertFac(HttpServletRequest request, FacilitiesVO vo) throws IllegalStateException, IOException {
//		FacilitiesVO vo = new FacilitiesVO();
//		vo.setFacilitiesName(request.getParameter("facilitiesName"));
//		vo.setModel(request.getParameter("model"));
//		vo.setFacSize(request.getParameter("facSize"));
//		vo.setProductionCompany(request.getParameter("productionCompany"));
//		vo.setPurpose(request.getParameter("purpose"));
//		vo.setVolume(request.getParameter("volume"));
//		vo.setProductionDate(request.getParameter("productionDate"));
//		vo.setEmpNo(request.getParameter("empNo"));
//		vo.setPrice(request.getParameter("price"));
//		vo.setFacInspection(request.getParameter("facInspection"));
//		vo.setPurchaseDate(request.getParameter("purchaseDate"));
//		vo.setImg(request.getParameter("img"));
//		vo.setProcessCode(request.getParameter("processCode"));
		MultipartFile uploadFile = vo.getUploadFile();
		String fileName = null;
		if(uploadFile !=null && !uploadFile.isEmpty() && uploadFile.getSize()>0) {
		fileName = uploadFile.getOriginalFilename();
		uploadFile.transferTo(new File(fileName));
		}
		//첨부파일명 VO에 지정
		vo.setImg(fileName);
		
		mapper.insertFac(vo);
		return "redirect:facAdmin.do";
	}
	
	// 삭제
	@PostMapping(value="ajax/deleteFac.do")
	@ResponseBody
	public Map deleteFac(@RequestBody GridData gridDate) {
		Map<String,Object> data = new HashMap();
		for(int i=0; i<gridDate.deletedRows.size(); i++) {
			mapper.deleteFac(gridDate.deletedRows.get(i));
		}
		data.put("result", true);
		data.put("data", gridDate.deletedRows);
		return data;
	}
	
	// grid list 불러오기
	@RequestMapping("/ajax/facInfo.do")
	@ResponseBody
	public FacilitiesVO ajaxFacInfo(Model model, FacilitiesVO vo) {
		return mapper.getFacInfo(vo);
	}
	
	// 수정
	@RequestMapping("/ajax/updateFac.do")
	@ResponseBody
	public int ajaxUpdateFac(Model model, FacilitiesVO vo) {
		return mapper.updateFac(vo);
	}
}
