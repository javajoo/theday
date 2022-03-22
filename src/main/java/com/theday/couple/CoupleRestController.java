package com.theday.couple;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.theday.couple.bo.CoupleBO;
import com.theday.couple.model.Couple;

@RestController
public class CoupleRestController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private CoupleBO coupleBO;
	
	@PostMapping("/couple")
	public Map<String, Object> insertCouple(@RequestBody Couple couple) { // @RequestBody : json
		Map<String, Object> result = new HashMap<>();
		log.debug("couple=>{}", couple);
		
		int exist = coupleBO.CountUser(couple);
		result.put("result", "성공");
		if (exist > 1) {
			result.put("result", "실패");
		}
		
		return result;
	}
	
	
}
