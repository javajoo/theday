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
//	public String searchView(HttpSession session, Model model) {
//		boolean hasCouple = (boolean)session.getAttribute("hasCouple");
//		if(hasCouple) { // 커플이 아닌경우인데도 커플화면으로 이동????
//			return "redirect:/couple/home_view";
//		} else {
//			model.addAttribute("viewName","user/agree");
//			return "template/layout";
//		}
//			
//	}
	
	@RequestMapping("/profile_view")
	public String profileView(Model model) {
//		User user = (User)session.getAttribute("user");
//		model.addAttribute("user",user);
		model.addAttribute("viewName","user/profile");
		return "template/layout";
		
	}
	

	
}
