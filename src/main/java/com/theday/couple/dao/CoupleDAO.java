package com.theday.couple.dao;

import org.springframework.stereotype.Repository;

import com.theday.couple.model.Couple;

@Repository
public interface CoupleDAO {

	public int countUser(Couple couple);

	public int existSelectedUser(int userId);

	public int insertCouple(Couple couple);

	public Couple selectCouple(int userId);

	public int updateCouple(Couple couple);

	public void deleteCouple(Couple couple);
	
	public void deleteCouple2(Couple couple);

}
