package com.theday.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theday.user.model.User;

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
//			return "";
//		}
//		return "";
//	}
	@RequestMapping("/profile_view")
	public String profileView(Model model, HttpSession session) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("user",user);
		model.addAttribute("viewName","user/profile");
		return "template/layout";
		
	}
}
