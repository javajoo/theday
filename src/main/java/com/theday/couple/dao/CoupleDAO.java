package com.theday.couple.dao;

import org.springframework.stereotype.Repository;

import com.theday.user.model.User;

@Repository
public interface CoupleDAO {

	public int selectCoupleByLoginId (User user);
}
