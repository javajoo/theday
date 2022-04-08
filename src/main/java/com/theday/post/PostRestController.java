package com.theday.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.theday.comment.model.Comment;
import com.theday.post.bo.PostBO;
import com.theday.post.model.Post;
import com.theday.user.model.User;

@RequestMapping("/post")
@RestController
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, Object> create(@ModelAttribute Post post, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		post.setUserId(user.getId()); // post에 userId 넣어준다.
	
		int row = postBO.insertPost(post, session);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 사용 가능합니다.");
			return result;
		}
		
		
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> delete(@ModelAttribute Post post, @ModelAttribute Comment comment, HttpSession session) {
		
		User user = (User) session.getAttribute("user");
		post.setUserId(user.getId());
		comment.setUserId(user.getId());
		comment.setPostId(post.getId());
		postBO.deletePostById(post, comment);
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
	
}
