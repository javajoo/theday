package com.theday.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theday.user.bo.UserBO;
import com.theday.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserBO userBO;

	//localhost/user/sign_up_view
	@RequestMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("viewName", "user/sign_up");
		return "template/layout";

	}

	//localhost/user/sign_in_view
	@RequestMapping("/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("viewName", "user/sign_in");
		return "template/layout";
	}
	
	
	//localhost/user/search_view
	@RequestMapping("/search_view")
	public String searchView(Model model) {
		
		List<User> userList = userBO.getUserListById();
		
		model.addAttribute("viewName","user/search");
		model.addAttribute("userList",userList);
		
		return "template/layout";	
	}
	
	//localhost/user/profile_view
	@RequestMapping("/profile_view")
	public String profileView(Model model) {
		model.addAttribute("viewName","user/profile");
		
		return "template/layout";	
	}
	

}
