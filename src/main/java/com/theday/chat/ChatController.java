package com.theday.chat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theday.couple.bo.CoupleBO;
import com.theday.couple.model.Couple;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private CoupleBO coupleBO;
	
	/**
	 * 채팅 뷰1
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/chat_view")
	public String chatView(Model model, HttpSession session) {
		int userId = (int)session.getAttribute("userId");
		Couple couple = coupleBO.getCouple(userId);
		model.addAttribute("couple",couple);
		model.addAttribute("viewName","chat/chat");
		return "template/layout";
	}
}
