package com.theday.couple.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.theday.couple.model.Couple;

@Repository
public interface CoupleDAO {
	
	public int CountUser(Couple couple);
	
	public int insertCouple(Couple couple);

	public Couple selectCouple();
	
	public int updateCouple(Couple couple);
}
