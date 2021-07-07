package com.rest.app.comm.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.rest.app.comm.service.QualityControlService;
import com.rest.app.comm.vo.BomVO;
import com.rest.app.comm.vo.QualityControlVO;

import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.util.EgovResourceCloseHelper;

@Controller
public class QcController {

	@Autowired
	QualityControlService dao;
	
	//모달
	@RequestMapping("QcModal.do")
	public String modal() {
		
		return "app/comm/QcModal";
	}
	
	//모달창 제품 리스트 조회
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
	
	@RequestMapping("QualityControl.do")
	public String QualityControl() {
		return "comm/QualityControl.page";
	}
	
	//제품 단건 조회 
	@RequestMapping("getQcProduct.do")
	public ModelAndView getQcProduct(Model model, QualityControlVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/comm/QualityControl.page");
		mv.addObject("proInfo", dao.getProduct(vo));
		mv.addObject("company", dao.getCompany(vo));
		return mv;
	}
	
	//이미지 업로드 
	@RequestMapping(value = "/qcfiledown.do")
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
