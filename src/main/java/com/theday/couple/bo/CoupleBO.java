package com.theday.couple.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theday.couple.dao.CoupleDAO;
import com.theday.user.model.User;

@Service
public class CoupleBO {
	
	@Autowired
	private CoupleDAO coupleDAO;
	
	public int getCoupleByLoginId (User user) {
		return coupleDAO.selectCoupleByLoginId(user);
	}
}
