package com.theday.couple.dao;

import org.springframework.stereotype.Repository;

import com.theday.couple.model.Couple;

@Repository
public interface CoupleDAO {
	
	public int CountUser(Couple couple);
	
	public int insertCouple(Couple couple);

}
