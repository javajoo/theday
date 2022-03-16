package com.theday.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@PostMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId (@RequestParam("loginId") String loginId) {
		Map<String, Object> result = new HashMap<>();
		boolean exist = userBO.existLoginId(loginId);
				
		if (exist) {
			result.put("result", "success");
		} else {
			result.put("result", "error");
		}
	
		return result;
		
	}
	
	@PostMapping("/sign_in")
	public Map<String, Object> signInView(
			@RequestParam("loginId") String loginId, 
			@RequestParam("password") String password,
			HttpServletRequest request
			) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		User user = userBO.getUserByLoginIdPassword(loginId, password);
		
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginId", user.getLoginId());
		} else {
			result.put("result", "error");
			result.put("errorMessage", "로그인에 실패했습니다.");
		}
		
		return result;
		
	}


}
