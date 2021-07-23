package com.rest.app.fac.web;
 
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.rest.app.comm.vo.EmployeeVO;
import com.rest.app.fac.service.impl.FacilitiesMapper;
import com.rest.app.fac.vo.FacilitiesVO;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovResourceCloseHelper;

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
	
	// 설비 조회 페이지
	@RequestMapping("/fac/view/facList.do")
	public String getFac(Model model) {
		return "fac/facList.page";
	}
	
	// 설비 조회
	@RequestMapping("/ajax/facList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetFac(FacilitiesVO vo) {
		Map<String,Object> datas = new HashMap<String,Object>();
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("result", true);
		datas.put("contents", mapper.getFac(vo));
		data.put("data", datas);
		return data;
	}
	
	// 설비 조회 Excel
	@RequestMapping("/fac/view/facListExcel.do")
	public ModelAndView facListExcel(@RequestParam Map<String, Object> param)
			throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> headerMap = new HashMap<String, Object>();
		List<FacilitiesVO> list = mapper.getFac(param);
		List<Map<String, String>> data = new ArrayList<>();
		for(FacilitiesVO vo : list) {
			data.add(BeanUtils.describe(vo));
		}
		headerMap.put("facCode", "설비코드");
		headerMap.put("facilitiesName", "설비명");
		headerMap.put("model", "모델");
		headerMap.put("facSize", "규격");
		headerMap.put("productionCompany", "제작업체");
		headerMap.put("purpose", "용도");
		headerMap.put("volume", "용량/규격");
		headerMap.put("productionDate", "제작일자");
		headerMap.put("employeeName", "사원명");
		headerMap.put("price", "구매금액");
		headerMap.put("facInspection", "정기점검주기");
		headerMap.put("purchaseDate", "구매일자");
		headerMap.put("processName", "공정명");
		map.put("headerMap", headerMap);
		map.put("filename", "excel_plan");
		map.put("datas", data);
		return new ModelAndView("commonExcelView", map); 
	}
	
	// 설비관리
	@RequestMapping("/fac/mng/facAdmin.do")
	public String facAdmin(Model model) {
		model.addAttribute("max", mapper.getFacCode());
		return "fac/facAdmin.page";
	}
	
	
	// 탭1 설비 관리 목록
	@RequestMapping("/ajax/facList2.do")
	@ResponseBody
	public Map<String, Object> ajaxGetFacList() {
		Map<String,Object> datas = new HashMap<String,Object>();
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("result", true);
		datas.put("contents", mapper.getFacList());
		data.put("data", datas);
		return data;
	}
	// 탭2 설비 공정 목록
	@RequestMapping("/ajax/facProcessList.do")
	@ResponseBody
	public Map<String, Object> ajaxGetFacProcess() {
		Map<String,Object> datas = new HashMap<String,Object>();
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("result", true);
		datas.put("contents", mapper.getFacProcess());
		data.put("data", datas);
		return data;
	}
	
	// 저장&수정
	@RequestMapping("/fac/mng/insertFacilities.do")
	public String insertFacilities(HttpServletRequest request, FacilitiesVO vo) throws IOException, Exception {
		MultipartFile uploadFile = vo.getUploadFile();
		String fileName = null;
		if(uploadFile !=null && !uploadFile.isEmpty() && uploadFile.getSize()>0) {
			fileName = uploadFile.getOriginalFilename();
			String storePathString = EgovProperties.getProperty("Globals.fileStorePath");
			fileName = uploadFile(fileName, uploadFile.getBytes());
			uploadFile.transferTo(new File(storePathString, fileName));
			//첨부파일명 VO에 지정
			vo.setImg(fileName);
		}
		mapper.insertFacilities(vo);
		return "redirect:facAdmin.do";
	}

	// 저장
	@RequestMapping(value = "/insertFac.do")
	public String insertFac(HttpServletRequest request, FacilitiesVO vo) throws Exception {
		MultipartFile uploadFile = vo.getUploadFile();
		String fileName = null;
		if(uploadFile !=null && !uploadFile.isEmpty() && uploadFile.getSize()>0) {
			fileName = uploadFile.getOriginalFilename();
			String storePathString = EgovProperties.getProperty("Globals.fileStorePath");
			fileName = uploadFile(fileName, uploadFile.getBytes());
			uploadFile.transferTo(new File(storePathString, fileName));
			//첨부파일명 VO에 지정
			vo.setImg(fileName);
		}
		
		mapper.insertFac(vo);
		return "redirect:facAdmin.do";
	}
	
	// 삭제
	@PostMapping(value="/ajax/deleteFac.do")
	@ResponseBody
	public Map<String,Object> deleteFac(@RequestBody GridData gridDate) {
		Map<String,Object> data = new HashMap<String,Object>();
		for(int i=0; i<gridDate.deletedRows.size(); i++) {
			mapper.deleteFac(gridDate.deletedRows.get(i));
		}
		data.put("result", true);
		data.put("data", gridDate.deletedRows);
		return data;
	}
	
	
	// 수정
	@RequestMapping("/ajax/updateFac.do")
	@ResponseBody
	public int ajaxUpdateFac(Model model, FacilitiesVO vo) throws Exception {
		MultipartFile uploadFile = vo.getUploadFile();
		String fileName = null;
		if(uploadFile !=null && !uploadFile.isEmpty() && uploadFile.getSize()>0) {
			fileName = uploadFile.getOriginalFilename();
			String storePathString = EgovProperties.getProperty("Globals.fileStorePath");
			fileName = uploadFile(fileName, uploadFile.getBytes());
			uploadFile.transferTo(new File(storePathString, fileName));
			//첨부파일명 VO에 지정
			vo.setImg(fileName);
		}
		
		return mapper.updateFac(vo);
	}
	
	// grid list 불러오기
	@RequestMapping("/ajax/facInfo.do")
	@ResponseBody
	public FacilitiesVO ajaxFacInfo(Model model, FacilitiesVO vo) {
		return mapper.getFacInfo(vo);
	}
	
	// 사원검색 모달
	@RequestMapping("/modal/empListModal.do")
	public String empModal() {
		return "app/modal/empModal";
	}
	
	@RequestMapping("/ajax/empListModal.do")
	@ResponseBody
	public Map<String, Object> ajaxEmpModal(Model model, EmployeeVO vo) {
		Map<String,Object> datas = new HashMap<>();
		Map<String,Object> data = new HashMap<>();
		
		data.put("result", true);
		datas.put("contents", mapper.getEmpListModal(vo));
		data.put("data", datas);
		
		return data;
	}
	
	// 파일
	@RequestMapping(value = "/fac/mng/filedown.do")
	public void getDown(HttpServletResponse response, @RequestParam String fileName) throws Exception{
		String serverSubPath  = "c:/upload";
		String downFileName = serverSubPath + "/" + fileName;

		File file = new File(EgovWebUtil.filePathBlackList(downFileName));

		if (!file.exists()) {
			throw new FileNotFoundException(downFileName);
		}

		if (!file.isFile()) {
			throw new FileNotFoundException(downFileName);
		}

		byte[] b = new byte[8192];

		String original = fileName.replaceAll("\r", "").replaceAll("\n", "");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + original + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");

		BufferedInputStream fin = null;
		BufferedOutputStream outs = null;

		try {
			fin = new BufferedInputStream(new FileInputStream(file));
			outs = new BufferedOutputStream(response.getOutputStream());

			int read = 0;

			while ((read = fin.read(b)) != -1) {
				outs.write(b, 0, read);
			}
		} finally {
			EgovResourceCloseHelper.close(outs, fin);
		}
	}
	
	 public String uploadFile(String originalName, byte[] fileData) throws Exception{
		    
	        UUID uuid = UUID.randomUUID();
	        
	        String fileName = uuid.toString()+"_"+originalName;
	        String storePathString = EgovProperties.getProperty("Globals.fileStorePath");
	        File target = new File(storePathString, fileName);
	        FileCopyUtils.copy(fileData, target);
	 
	        return fileName;
	    }
}
