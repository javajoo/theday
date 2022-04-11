package com.theday.couple;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.theday.couple.bo.CoupleBO;
import com.theday.couple.model.Couple;
import com.theday.user.model.User;

@RestController
@RequestMapping("/couple")
public class CoupleRestController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private CoupleBO coupleBO;
	
	/**
	 * 커플 연결 api
	 * @param couple
	 * @param session
	 * @return
	 */
	@PostMapping("/connect")
	public Map<String, Object> insertCouple( @RequestBody Couple couple, HttpSession session) { // @RequestBody : json
		User user = (User) session.getAttribute("user");
		couple.setUserId1(user.getId());
		Map<String, Object> result = new HashMap<>();
		log.debug("couple=>{}", couple);
		int exist = coupleBO.countUser(couple);
		result.put("result", "success");
		if (exist > 1) {
			result.put("result", "error");
		}
		coupleBO.insertCouple(couple);
		return result;
	}
	
	/**
	 * 커플 수락 api
	 * @param session
	 * @param couple
	 * @return
	 */
	@PostMapping("/agree")
	public Map<String, Object> agree (HttpSession session, 	@RequestBody Couple couple) { 
		Map<String, Object> result = new HashMap<>();	
		int row = coupleBO.updateCouple(couple);
		result.put("result", "success");
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "커플매칭에 실패했습니다.");
		} 
		return result;
	}
	
	/**
	 * 커플 거절 api
	 * @param session
	 * @param couple
	 * @return
	 */
	@DeleteMapping("/reject")
	public Map<String, Object> reject(HttpSession session, 	@RequestBody Couple couple) {
		User user = (User) session.getAttribute("user");
		couple.setUserId1(user.getId());
		Map<String, Object> result = new HashMap<>();	
		coupleBO.deleteCouple(couple);
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 커펄 거절2 api
	 * @param session
	 * @param couple
	 * @return
	 */
	@DeleteMapping("/reject2")
	public Map<String, Object> reject1(HttpSession session, @RequestBody Couple couple) {
		Map<String, Object> result = new HashMap<>();	
		coupleBO.deleteCouple2(couple);
		result.put("result", "success");
		return result;
	}
	
}
