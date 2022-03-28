package com.theday.couple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theday.couple.bo.CoupleBO;
import com.theday.couple.model.Couple;

@Controller
@RequestMapping("/couple")
public class CoupleController {

	@Autowired
	private CoupleBO coupleBO;
	
	@RequestMapping("/home_view")
	public String connectView(Model model) {
		Couple couple = coupleBO.getCouple();
		model.addAttribute("couple",couple);
		model.addAttribute("viewName", "couple/home");
		
		return "template/layout";
	}
	

	
}
