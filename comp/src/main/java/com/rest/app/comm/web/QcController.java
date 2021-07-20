package com.rest.app.comm.web;

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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.rest.app.comm.service.QualityControlService;
import com.rest.app.comm.vo.QualityControlVO;
import com.rest.app.prod.vo.DetailPlanVO;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.util.EgovResourceCloseHelper;


class qcGrid {
	List<QualityControlVO>  deletedRows;
	List<QualityControlVO> updatedRows;
	List<QualityControlVO> createdRows;
	public List<QualityControlVO> getDeletedRows() {
		return deletedRows;
	}
	public void setDeletedRows(List<QualityControlVO> deletedRows) {
		this.deletedRows = deletedRows;
	}
	public List<QualityControlVO> getUpdatedRows() {
		return updatedRows;
	}
	public void setUpdatedRows(List<QualityControlVO> updatedRows) {
		this.updatedRows = updatedRows;
	}
	public List<QualityControlVO> getCreatedRows() {
		return createdRows;
	}
	public void setCreatedRows(List<QualityControlVO> createdRows) {
		this.createdRows = createdRows;
	}

}

@Controller
public class QcController {

	@Autowired
	QualityControlService dao;
	
	//제품 List 조회
	@RequestMapping("/ajax/getProductList.do")
	@ResponseBody
	public Map<String, Object> ajaxgetProductList(QualityControlVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getProductList(vo));
		data.put("data", datas);
		return data;
	}
	
	//제품List 엑셀
	@RequestMapping("/comm/proudctListExcel.do")
	public ModelAndView proudctListExcel(@RequestParam Map<String, Object> param) 
		throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
			HashMap<String, Object> map = new HashMap<String, Object>();
			HashMap<String, Object> headerMap = new HashMap<String, Object>();
			List<QualityControlVO> list = dao.getProductList(param);
			List<Map<String, String>> data = new ArrayList<>();
			for (QualityControlVO vo : list) {
				data.add(BeanUtils.describe(vo));
		}
			headerMap.put("productCode", "제품코드");
			headerMap.put("productName", "제품명");
			headerMap.put("empCode", "사원코드");
			headerMap.put("employeeName", "제품코드");
			map.put("headerMap", headerMap);
			map.put("filename", "excel_pro");
			map.put("datas", data);
			
		
		return new ModelAndView("commonExcelView", map);
	}
	
	//단위 , 규격 조회
	@RequestMapping("/comm/QualityControl.do")
	public String QualityControl(Model model , QualityControlVO vo) {
		
		model.addAttribute("empList", dao.getEmpList(vo));
		model.addAttribute("unit", dao.getUnitList(vo));
		model.addAttribute("std", dao.getCodeList(vo));
		model.addAttribute("max", dao.maxProductCode());
		return "comm/QualityControl.page";
	}
	
	//제품 단건 조회 
	@RequestMapping("/comm/getQcProduct.do")
	public ModelAndView getQcProduct(Model model, QualityControlVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/comm/QualityControl.page");
		mv.addObject("proInfo", dao.getProduct(vo));
		mv.addObject("company", dao.getCompany(vo));
		System.out.println();
		return mv;
		
	}
	//제품 단건 조회 ajax
	@RequestMapping("/ajax/getProduct.do")
	@ResponseBody
	public Map<String, Object> ajaxgetProduct(QualityControlVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getProduct(vo));
		data.put("data", datas);
		
		return data;
	}
	
	
	//규격 리스트
	@RequestMapping("/ajax/getCodeList.do")
	@ResponseBody
	public Map<String, Object> ajaxgetCodeList(QualityControlVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getCodeList(vo));
		data.put("data", datas);
		return data;
	}
	//단위 리스트
	@RequestMapping("/ajax/getUnitList.do")
	@ResponseBody
	public Map<String, Object> ajaxgetUnitList(QualityControlVO vo) {
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", dao.getUnitList(vo));
		data.put("data", datas);
		return data;
	}

	
	// 제품삭제
	@PostMapping(value = "/ajax/deleteProduct.do")
	@ResponseBody
	public Map deleteProduct(@RequestBody qcGrid qcgrid) {
		Map<String, Object> data = new HashMap();
		for (int i = 0; i < qcgrid.deletedRows.size(); i++) {
			dao.deleteProduct(qcgrid.deletedRows.get(i));
		}
		data.put("result", true);
		data.put("data", qcgrid.deletedRows);
		return data;
	}
	//제품저장
	@RequestMapping(value= "/comm/insertProduct.do")
	public String insertProduct(HttpServletRequest request, QualityControlVO vo) throws IllegalStateException, IOException {
		MultipartFile uploadFile = vo.getUploadFile();
		String fileName = null;
		if(uploadFile !=null && !uploadFile.isEmpty() && uploadFile.getSize()>0) {
			fileName = uploadFile.getOriginalFilename();
			String storePathString = EgovProperties.getProperty("Globals.fileStorePath");
			uploadFile.transferTo(new File(storePathString, fileName));
			//첨부파일명 VO에 지정
			vo.setQcImg(fileName);
		}
		System.out.println("************************************");
		dao.insertProduct(vo);
		return "redirect:QualityControl.do";
	}
	//제품 수정
	@RequestMapping("/ajax/updateProdcut.do")
	@ResponseBody
	public int ajaxUpdateProdcut(Model model, QualityControlVO vo ) throws IllegalStateException, IOException {
		MultipartFile uploadFile = vo.getUploadFile();
		String fileName = null;
		if(uploadFile !=null && !uploadFile.isEmpty() && uploadFile.getSize()>0) {
			fileName = uploadFile.getOriginalFilename();
			String storePathString = EgovProperties.getProperty("Globals.fileStorePath");
			uploadFile.transferTo(new File(storePathString, fileName));
			//첨부파일명 VO에 지정
			vo.setQcImg(fileName);
		}
		
		return dao.updateProdcut(vo);
	}
	
	//이미지 업로드 
	@RequestMapping(value = "/comm/qcfiledown.do")
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
	
	
}
