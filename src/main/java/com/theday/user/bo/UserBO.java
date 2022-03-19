package com.theday.user.bo;

import java.util.List;

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
	
	public boolean existLoginId(String loginId) {
		return  userDAO.existLoginId(loginId);
	}
	
	public User getUserByLoginIdPassword(String loginId, String password) {
		return userDAO.selectUserByLoginIdPassword(loginId, password);
	}
	
	public List<User> getUserListById() {
		return userDAO.selectUserListById();
	}
	
	public List<User> getUserByLoginId(String loginId) {
		return userDAO.selectUserByLoginId(loginId);
	}

	public int updateUserByLoginId() {
		return 0;
	}
	
}
