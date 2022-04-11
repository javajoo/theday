package com.theday.couple;

import java.util.List;

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
	
	/**
	 * 커플 홈 뷰
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/home_view")
	public String connectView(Model model, HttpSession session) {
		int userId = (int)session.getAttribute("userId");
		Couple couple = coupleBO.getCouple(userId);
		model.addAttribute("couple",couple);
		model.addAttribute("viewName", "couple/home");
		return "template/layout";
	}
	
	/**
	 * 커플 동의 뷰
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/agree_view")
	public String agreeView(Model model	,HttpSession session) {
		int userId = (int)session.getAttribute("userId");
		List<User> coupleList1 = userBO.selectUserCoupleByUserId1(userId);
		List<User> coupleList2 = userBO.selectUserCoupleByUserId2(userId);
		model.addAttribute("coupleList1", coupleList1); 
		model.addAttribute("coupleList2", coupleList2); 
		model.addAttribute("viewName", "couple/agree");
		return "template/layout";
	}
	
}
