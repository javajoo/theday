package com.theday.couple.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theday.couple.dao.CoupleDAO;
import com.theday.couple.model.Couple;

@Service
public class CoupleBO {
	
	@Autowired
	private CoupleDAO coupleDAO;
	
	public int countUser (Couple couple) {
		
		return coupleDAO.countUser(couple);
	}
	
	public boolean existSelectedUser(int userId) {
		return coupleDAO.existSelectedUser(userId)>=1?true:false;
	}
	
	public boolean addCouple (Couple couple) {
		return countUser(couple) == 1 ? false:true;
	}
	
	public int insertCouple(Couple couple) {
		return coupleDAO.insertCouple(couple);
	}
	
	public Couple getCouple(int userId) {
		return coupleDAO.selectCouple(userId);
	}
	
	
	public int updateCouple(Couple couple) {
		return coupleDAO.updateCouple(couple);
	}

	public void deleteCouple(Couple couple) {
		coupleDAO.deleteCouple(couple);
	}
	public void deleteCouple2(Couple couple) {
		coupleDAO.deleteCouple2(couple);
	}

}
