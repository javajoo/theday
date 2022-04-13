package com.theday.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.theday.common.SHA256;
import com.theday.couple.bo.CoupleBO;
import com.theday.user.bo.UserBO;
import com.theday.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private SHA256 sha256;
	
	@Autowired
	private UserBO userBO;

	@Autowired
	private CoupleBO coupleBO;
	
	/**
	 * 회원가입 api
	 * @param user
	 * @return
	 */
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(@ModelAttribute User user) {
		String encryptUtils = sha256.encrypt(user.getPassword());
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
	
	/**
	 * 아이디 중복확인 api
	 * @param loginId
	 * @return
	 */
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
	
	/**
	 * 로그인 api
	 * @param loginId
	 * @param password
	 * @param session
	 * @return
	 */
	@PostMapping("/sign_in")
	public Map<String, String> signInView(
			@RequestParam("loginId") String loginId, 
			@RequestParam("password") String password,
			HttpSession session
			) {
		String encryptUtils = sha256.encrypt(password);
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		User user = userBO.getUserByLoginIdPassword(loginId, encryptUtils);
		if (user != null) {
			Boolean selectedCouple = coupleBO.existSelectedUser(user.getId());
			result.put("selectedCouple", selectedCouple.toString());
			session.setAttribute("user", user);
			session.setAttribute("userId", user.getId());
			session.setAttribute("hasCouple", true);
			session.setAttribute("selectedCouple", selectedCouple);
		} 
		else {
			result.put("result", "error");
			result.put("errorMessage", "아이디와 비밀번호를 확인 해주세요.");
		}
		return result;
	}
	
	/**
	 * 검색 화면에서 아이디 넘기는 api
	 * @param loginId
	 * @param session
	 * @return
	 */
	@GetMapping("/search/{loginId}")
	public Map<String, Object> search (@PathVariable("loginId") String loginId, HttpSession session) {
		User user = (User)session.getAttribute("user");
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		List<User> userList = userBO.getUserByLoginId(loginId,user.getLoginId());
		result.put("userList", userList);
		if (userList.size() < 1) {
			result.put("result", "error");
		}
		return result;
	}
	
	/**
	 * 프로필수정 api
	 * @param user
	 * @param session
	 * @return
	 */
	@PutMapping("/profile_update")
	public Map<String, Object> profile (@ModelAttribute User user, HttpSession session) {
		String encryptUtils = sha256.encrypt(user.getPassword());
		user.setPassword(encryptUtils);
		Map<String, Object> result = new HashMap<>();	
		result.put("result", "success");
		User tmpUser = (User)session.getAttribute("user");
		int row = userBO.updateUserByLoginId(user, tmpUser.getProfileImagePath());
		if(row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "수정에 실패했습니다.");
		}else {
			session.setAttribute("user", user); // 수정된 정보 세션에 다시 저장
		}
		return result;
	}
}
