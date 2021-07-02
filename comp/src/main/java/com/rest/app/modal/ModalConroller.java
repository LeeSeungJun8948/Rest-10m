package com.rest.app.modal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ModalConroller {

	@RequestMapping("/matCodeModal.do")
	@ResponseBody
	public String matCodeModal() {
		return "modal/matCodeModal";
	}
}
