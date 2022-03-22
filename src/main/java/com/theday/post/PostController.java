package com.theday.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

	@RequestMapping("/create_view")
	public String createView() {
		return "post/post_create";
	}
}
