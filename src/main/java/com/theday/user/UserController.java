package com.theday.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {
	
	/**
	 * 로그아웃
	 * @param session
	 * @return
	 */
	@RequestMapping("/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/user/sign_in_view";
	}
	
	/**
	 * 프로필 수정 뷰
	 * @param model
	 * @return
	 */
	@RequestMapping("/profile_view")
	public String profileView(Model model) {
		model.addAttribute("viewName","user/profile");
		return "template/layout";
	}
}
