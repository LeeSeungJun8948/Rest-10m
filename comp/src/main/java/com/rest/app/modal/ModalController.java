package com.rest.app.modal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ModalController {

	@RequestMapping("/matCodeModal.do")
	public String matCodeModal() {
		return "modal/matCodeModal.part";
	}
}