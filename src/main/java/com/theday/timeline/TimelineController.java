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
	
	/**
	 * 타임라인 뷰
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/timeline_list_view")
	public String timelineListView(Model model, HttpSession session) {
		int userId = (int)session.getAttribute("userId");
		List<ContentView> contentViewList = contentBO.generateContentViewList(userId);
		Couple couple = coupleBO.getCouple(userId);
		model.addAttribute("couple",couple);
		model.addAttribute("contentViewList",contentViewList);
		model.addAttribute("viewName","timeline/timeline_list");
		return "template/layout";
	}
}
