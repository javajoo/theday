package com.theday.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.theday.comment.bo.CommentBO;
import com.theday.comment.model.Comment;

@RestController
@RequestMapping("/comment")
public class CommentRestController {

	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/create")
	public Map<String, Object> create(@ModelAttribute Comment comment, HttpSession session) {
		//	post.setUserId(user.getId()); // post에 userId 넣어준다.
		int userId = (int) session.getAttribute("userId");
		comment.setUserId(userId);
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		commentBO.insertComment(comment) ;
		return result;
		
	}
	
}
