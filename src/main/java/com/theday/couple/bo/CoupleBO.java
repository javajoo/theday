package com.theday.couple.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theday.couple.dao.CoupleDAO;
import com.theday.couple.model.Couple;

@Service
public class CoupleBO {
	
	@Autowired
	private CoupleDAO coupleDAO;
	
	public int CountUser (Couple couple) {
		
		return coupleDAO.CountUser(couple);
	}
	
	public boolean addCouple (Couple couple) {
		if (CountUser(couple) == 1) {
			return false; //막다
		}
		return true; //실행
	}
	
	public int insertCouple(Couple couple) {
		return coupleDAO.insertCouple(couple);
	}
	
	public Couple getCouple() {
		return coupleDAO.selectCouple();
	}
	
	public int updateCouple(Couple couple) {
		return coupleDAO.updateCouple(couple);
	}



}
