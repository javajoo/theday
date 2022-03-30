package com.theday.couple;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theday.couple.bo.CoupleBO;
import com.theday.couple.model.Couple;
import com.theday.user.bo.UserBO;
import com.theday.user.model.User;

@Controller
@RequestMapping("/couple")
public class CoupleController {

	@Autowired
	private CoupleBO coupleBO;
	
	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/home_view")
	
	public String connectView(Model model	,HttpSession session) {
		int userId = (int)session.getAttribute("userId");
		
		Couple couple = coupleBO.getCouple();
		User coupleList = userBO.getUserCouple(userId);
		model.addAttribute("couple",couple);
		model.addAttribute("viewName", "couple/home");
		model.addAttribute("coupleList", coupleList);
		
		return "template/layout";
	}
	
	@RequestMapping("/agree_view")
	public String agreeView(Model model
			,HttpSession session
			) {
		int userId = (int)session.getAttribute("userId");
		//List<Post> postList = postBO.getPostList();
		User coupleList = userBO.getUserCouple(userId);
		Couple couple = coupleBO.getCouple();
		model.addAttribute("couple", couple);
		model.addAttribute("coupleList", coupleList);
		model.addAttribute("viewName", "user/agree");
		return "template/layout";
	}
	
}
