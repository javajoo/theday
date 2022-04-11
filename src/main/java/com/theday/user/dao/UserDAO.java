package com.theday.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.theday.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(User user);
	
	public boolean existLoginId(String loginId); 
	
	public User selectUserByLoginIdPassword(
			@Param("loginId") String loginId, 
			@Param("password") 	String password);
	
	public List<User> selectUserListById();
	
	public List<User> selectUserByLoginId(
			@Param("loginId")String loginId, 
			@Param("sessionLoginId") String sessionLoginId);
	
	public int updateUserByLoginId(User user);

	public List<User> selectUserCoupleByUserId1(int userId);
	
	public List<User> selectUserCoupleByUserId2(int userId);
	
	public User selectUserById(int userId);
}
