package com.theday.couple.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.theday.couple.model.Couple;

@Repository
public interface CoupleDAO {
	
	public int CountUser(Couple couple);
	
	public int insertCouple(Couple couple);

	public List<Couple> selectCouple(int userId);
	
	public int updateCouple(Couple couple);
}
