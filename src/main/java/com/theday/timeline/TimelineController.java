package com.theday.timeline;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theday.couple.bo.CoupleBO;
import com.theday.couple.model.Couple;
import com.theday.timeline.bo.ContentBO;
import com.theday.timeline.model.ContentView;

@Controller
@RequestMapping("/timeline")
public class TimelineController {

	@Autowired
	private ContentBO contentBO;
	

	@Autowired
	private CoupleBO coupleBO;
	
	@RequestMapping("/timeline_list_view")
	public String timelineListView(Model model, HttpSession session) {
		int userId = (int)session.getAttribute("userId");
		
		List<ContentView> contentViewList = contentBO.generateContentViewList(userId);
		//List<Post> postList = postBO.getPostList();
		//model.addAttribute("postList",postList);
		
		// 매칭이 성공한 유저의 정보만 가져오는 로직이 필요함
		
		Couple couple = coupleBO.getCouple(userId);
		model.addAttribute("couple",couple);
		model.addAttribute("contentViewList",contentViewList);
		model.addAttribute("viewName","timeline/timeline_list");
		
		return "template/layout";
	}
}
