package com.theday.couple;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	
	@PostMapping("/connect")
	public Map<String, Object> insertCouple( @RequestBody Couple couple, HttpSession session) { // @RequestBody : json
		User user = (User) session.getAttribute("user");
		
		couple.setUserId1(user.getId());

		
		Map<String, Object> result = new HashMap<>();
		log.debug("couple=>{}", couple);
		//post.setUserId(user.getId()); // post에 userId 넣어준다.
//		couple.setUserId1(couple.getUserId1());
//		couple.setUserId2(couple.getUserId2());
		
		int exist = coupleBO.CountUser(couple);
		result.put("result", "success");
		
		if (exist > 1) {
			result.put("result", "error");
		}
		
		coupleBO.insertCouple(couple);
		
		return result;
	}
	
	@PutMapping("/agree")
	public Map<String, Object> agree (HttpSession session, 
			@RequestBody Couple couple) { 
		
		
		User user = (User) session.getAttribute("user");
		couple.setUserId1(user.getId());
		
		Map<String, Object> result = new HashMap<>();	
			
		int row = coupleBO.updateCouple(couple);
		result.put("result", "success");
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "커플매칭에 실패했습니다.");
		} 
		return result;
	}
	

	
}
