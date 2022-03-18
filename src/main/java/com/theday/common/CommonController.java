package com.theday.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	@GetMapping("/")
	public String goHome(Model model) {
		model.addAttribute("viewName", "user/sign_in");
		return "template/layout";
	}

	@RequestMapping({"/*/*_view", "/*/*/*_view", "/*/*/*/*_view"})
	public String goPage(Model model, HttpServletRequest req) {
		String viewName = req.getRequestURI();
		viewName = viewName.substring(1,viewName.length()-5);
		model.addAttribute("viewName",viewName);
		return "template/layout";
	}
}
