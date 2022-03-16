package com.theday.couple;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.theday.couple.bo.CoupleBO;
import com.theday.user.model.User;

@RestController("/couple")
public class CoupleRestController {
	
	@Autowired
	private CoupleBO coupleBO;

	@PostMapping("/search")
	public Map<String, Object> search (@ModelAttribute User user) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		int row = coupleBO.getCoupleByLoginId(user);
		
		if (row < 1) {
			result.put("result", "error");
			result.put("errorMessage", "아이디가 없습니다.");
		}
		return result;
	}
	
	
}
