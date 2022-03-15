package com.theday.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theday.user.dao.UserDAO;
import com.theday.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;

	public int insertUser(User user) {
		return userDAO.insertUser(user);
	}
}
