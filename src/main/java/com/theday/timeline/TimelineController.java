package com.theday.timeline;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theday.post.bo.PostBO;
import com.theday.post.model.Post;
import com.theday.timeline.bo.ContentBO;
import com.theday.timeline.model.ContentView;

@Controller
@RequestMapping("/timeline")
public class TimelineController {

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private ContentBO contentBO;
	
	@RequestMapping("/timeline_list_view")
	public String timelineListView(Model model, HttpSession session) {
		int userId = (int)session.getAttribute("userId");
		
		List<ContentView> contentViewList = contentBO.generateContentViewList(userId);
		List<Post> postList = postBO.getPostList();
		model.addAttribute("postList",postList);
		model.addAttribute("contentViewList",contentViewList);
		model.addAttribute("viewName","timeline/timeline_list");
		
		return "template/layout";
	}
}
