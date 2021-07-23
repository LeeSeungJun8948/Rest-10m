package com.rest.app.fac.repair.web;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rest.app.fac.repair.service.impl.RepairMapper;
import com.rest.app.fac.repair.vo.RepairVO;

class GridData {
	List<RepairVO> deletedRows;

	public List<RepairVO> getDeletedRows() {
		return deletedRows;
	}

	public void setDeletedRows(List<RepairVO> deletedRows) {
		this.deletedRows = deletedRows;
	}
	
}

@Controller
public class RepairController {
	@Autowired
	RepairMapper mapper;
	
	@RequestMapping("/fac/mng/repList.do")
	public String getRep(Model model) {
		model.addAttribute("max", mapper.getRepCode());
		return "fac/repList.page";
	}

	
	@RequestMapping("/ajax/repList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetRep() {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", mapper.getRep());
		data.put("data", datas);
		return data;
	}
	
	
	// 수리내역조회
	@RequestMapping("/fac/view/repairList.do")
	public String repList() {
		return "fac/repairList.page";
	}
	
	@RequestMapping("/ajax/repairList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetRepair() {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", mapper.repairList());
		data.put("data", datas);
		return data;
	}
	
	// 수리 조회 Excel
	@RequestMapping("/fac/view/repairListExcel.do")
	public ModelAndView repairListExcel(@RequestParam Map<String, Object> param)
			throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> headerMap = new HashMap<String, Object>();
		List<RepairVO> list = mapper.repairList(param);
		List<Map<String, String>> data = new ArrayList<>();
		for(RepairVO vo : list) {
			data.add(BeanUtils.describe(vo));
		}
		headerMap.put("repairCode", "수리코드");
		headerMap.put("facilitiesName", "설비명");
		headerMap.put("repairDate", "수리일자");
		headerMap.put("repairComment", "수리내역");
		headerMap.put("companyName", "업체명");
		headerMap.put("cost", "수리금액");
		headerMap.put("etc", "비고");
		map.put("headerMap", headerMap);
		map.put("filename", "excel_plan");
		map.put("datas", data);
		return new ModelAndView("commonExcelView", map); 
	}
	
	// 저장&수정
	@RequestMapping("/fac/mng/insertRepair.do")
	public String insertRepiar(HttpServletRequest request, RepairVO vo) {
		mapper.insertRepair(vo);
		return "redirect:repList.do";
	}
	
	// 저장
	@RequestMapping(value="/insertRep.do")
	public String insertRep(HttpServletRequest request, RepairVO vo) {
//		RepairVO vo = new RepairVO();
//		vo.setFacCode(request.getParameter("facCode"));
//		vo.setRepairDate(request.getParameter("repairDate"));
//		vo.setRepairComment(request.getParameter("repairComment"));
//		vo.setCompanyCode(request.getParameter("companyCode"));
//		vo.setCost(request.getParameter("cost"));
//		vo.setEtc(request.getParameter("etc"));
		mapper.insertRep(vo);
		return "redirect:repList.do";
	}
	
	// 삭제
	@PostMapping(value="/ajax/deleteRep.do")
	@ResponseBody
	public Map<String, Object> deleteRep(@RequestBody GridData gridData) {
		Map<String,Object> data = new HashMap<String,Object>();
		for(int i=0; i<gridData.deletedRows.size(); i++) {
			mapper.deleteRep(gridData.deletedRows.get(i));
		}
		data.put("result", true);
		data.put("data", gridData.deletedRows);
		return data;
	}
	
	// input 불러오기
	@RequestMapping("/ajax/repInfo.do")
	@ResponseBody
	public RepairVO ajaxRepInfo(Model model, RepairVO vo) {
		return mapper.getRepInfo(vo);
	}
	
	// 수정
	@RequestMapping("/ajax/updateRep.do")
	@ResponseBody
	public int ajaxUpdateRep(Model model, RepairVO vo) {
		return mapper.updateRep(vo);
	}

}
