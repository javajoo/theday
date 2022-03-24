package com.theday.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.theday.post.bo.PostBO;
import com.theday.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@RequestMapping("/post_list_view")
	public String postListView(Model model) {
		
		List<Post> postList = postBO.getPostList();
		model.addAttribute("postList",postList);
		model.addAttribute("viewName","post/post_list");
		return "template/layout";
		
	}

}
