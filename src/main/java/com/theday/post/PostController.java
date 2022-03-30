package com.theday.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theday.post.bo.PostBO;
import com.theday.post.model.Post;
import com.theday.user.bo.UserBO;
import com.theday.user.model.User;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;
	
	@RequestMapping("/post_list_view")
	public String postListView(Model model,HttpSession session) {
		int userId = (int)session.getAttribute("userId");
		User coupleList = userBO.getUserCouple(userId);
		List<Post> postList = postBO.getPostList();
		model.addAttribute("postList",postList);
		model.addAttribute("coupleList", coupleList);
		model.addAttribute("viewName","post/post_list");
		return "template/layout";
		
	}
	
	

}
