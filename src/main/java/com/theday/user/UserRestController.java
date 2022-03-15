package com.theday.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.theday.user.bo.UserBO;
import com.theday.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@ModelAttribute User user) {

		
		int row = userBO.insertUser(user);
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
	
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "로그인에 실패했습니다.");
		}
		return result;
	}


}
