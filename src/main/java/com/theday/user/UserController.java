package com.theday.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {

	

	
	@RequestMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/user/sign_in_view";
	}
	
//	@RequestMapping("/search_view")
//	public String searchView(HttpSession session) {
//		boolean hasCouple = (boolean)session.getAttribute("hasCouple");
//		if(hasCouple) {
//			return "redirect:/couple/home_view";
//		} else {
//		return "redirect:/user/search_view";}
//	}
	
	@RequestMapping("/profile_view")
	public String profileView(Model model) {
//		User user = (User)session.getAttribute("user");
//		model.addAttribute("user",user);
		model.addAttribute("viewName","user/profile");
		return "template/layout";
		
	}
	

	
}
