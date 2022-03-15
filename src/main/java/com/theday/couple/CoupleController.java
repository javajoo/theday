package com.theday.couple;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/couple")
public class CoupleController {

	//localhost/couple/search_view
	@RequestMapping("/search_view")
	public String searchView(Model model) {
		model.addAttribute("viewName","couple/search");
		return "template/layout";
	}
	
	
	//localhost/couple/connect_view
	@RequestMapping("/connect_view")
	public String connectView(Model model) {
		model.addAttribute("viewName","couple/connect");
			return "template/layout";
	}
	
	
	//localhost/couple/home_view
	@RequestMapping("/home_view")
	public String homeView(Model model) {
		model.addAttribute("viewName","user/sign_connect");
		return "template/layout";
	}
}
