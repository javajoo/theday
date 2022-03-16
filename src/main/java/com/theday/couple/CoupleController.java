package com.theday.couple;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theday.user.model.User;

@Controller
@RequestMapping("/couple")
public class CoupleController {

	//localhost/couple/search_view
	@RequestMapping("/search_view")
	public String searchView(Model model) {
		model.addAttribute("viewName","couple/search");
		
		return "template/layout";
	}
	
	
	
	//localhost/couple/home_view
	@RequestMapping("/home_view")
	public String homeView(Model model,
			@ModelAttribute User user
			) {
		model.addAttribute("viewName","couple/home");
		return "template/layout";
	}
}
