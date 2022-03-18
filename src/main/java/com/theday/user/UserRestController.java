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

import com.theday.common.EncryptUtils;
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

		// 비밀번호 암호화
		String encryptUtils = EncryptUtils.md5(user.getPassword());
		user.setPassword(encryptUtils);
		
		
		
		int row = userBO.insertUser(user);
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
	
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "회원가입에 실패했습니다.");
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
		
		// 비밀번호 암호화
		String encryptUtils = EncryptUtils.md5(password);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		User user = userBO.getUserByLoginIdPassword(loginId, encryptUtils);
		
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginId", user.getLoginId());
		} else {
			result.put("result", "error");
			result.put("errorMessage", "아이디 또는 비밀번호를 잘못 입력했습니다. \n"
					+ "입력하신 내용을 다시 확인해주세요.");
		}
		
		return result;
		
	}
	
	@PostMapping("/search")
	public Map<String, Object> search (@RequestParam("loginId") String loginId) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		int row = userBO.getUserByLoginId(loginId);
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "아이디가 없습니다.");
		}
		return result;
	}
	
	@PostMapping("/profile")
	public Map<String, Object> profile () {
		Map<String, Object> result = new HashMap<>();	
		result.put("result", "success");
		int row = userBO.updateUserByLoginId();
		
		if(row < 1) {
			result.put("success", "error");
			result.put("errorMessage", "");
		}
		
	
	
		return result;
	}
	


}
