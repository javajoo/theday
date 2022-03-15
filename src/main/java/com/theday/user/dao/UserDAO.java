package com.theday.user.dao;

import org.springframework.stereotype.Repository;

import com.theday.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(User user);
}
