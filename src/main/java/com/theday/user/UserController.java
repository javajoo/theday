package com.theday.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theday.couple.bo.CoupleBO;
import com.theday.couple.model.Couple;
import com.theday.user.bo.UserBO;
import com.theday.user.model.User;

@RequestMapping("/user")
@Controller
public class UserController {

	
	@Autowired
	private CoupleBO coupleBO;
	
	@Autowired
	private UserBO userBO;
	
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
	public String profileView(Model model) {
//		User user = (User)session.getAttribute("user");
//		model.addAttribute("user",user);
		model.addAttribute("viewName","user/profile");
		return "template/layout";
		
	}
	
	@RequestMapping("/agree_view")
	public String agreeView(Model model
			,HttpSession session
			) {
		int userId1 = (int)session.getAttribute("userId");
		//List<Post> postList = postBO.getPostList();
		User coupleList = userBO.getUserCouple(userId1);
		Couple couple = coupleBO.getCouple();
		model.addAttribute("couple", couple);
		model.addAttribute("coupleList", coupleList);
		model.addAttribute("viewName", "user/agree");
		return "template/layout";
	}
	
}
