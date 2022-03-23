package com.theday.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.theday.common.FileManagerService;
import com.theday.post.bo.PostBO;
import com.theday.post.model.Post;
import com.theday.user.model.User;

@RequestMapping("/post")
@RestController
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private FileManagerService fileManagerService;
	
	@PostMapping("/create")
	public Map<String, Object> create(@ModelAttribute Post post, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		// 이미지 사진 넣기
		String imagePath = fileManagerService.saveFile(user.getLoginId() , post.getImage());
		post.setImagePath(imagePath);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		int row = postBO.insertPost(post);
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "로그인 후 사용 가능합니다.");
		}
		
		
		return result;
	}
}
