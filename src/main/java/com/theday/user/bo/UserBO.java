package com.theday.user.bo;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theday.common.FileManagerService;
import com.theday.user.dao.UserDAO;
import com.theday.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private FileManagerService fileManagerService;

	@Autowired
	private UserDAO userDAO;
	

	public int insertUser(User user) {
		
		
		// 이미지 사진 넣기
		String imagePath = null;
		if (user.getProfileImage() != null) {
			imagePath = fileManagerService.saveFile(user.getLoginId() , user.getProfileImage());
			user.setProfileImagePath(imagePath);
		}
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
	
	public List<User> getUserByLoginId(String loginId, String sessionLoginId) {
		return userDAO.selectUserByLoginId(loginId,sessionLoginId);
	}

	public int updateUser(User user, String preImagePath) {
		
		// 이미지 사진 수정하기
		String imagePath = null;
		if (user.getProfileImage() != null) {
			imagePath = fileManagerService.saveFile(user.getLoginId() , user.getProfileImage());
			user.setProfileImagePath(imagePath);
			
			// 기존 이미지 삭제
			if (preImagePath != null && imagePath != null ) {
				try {
					fileManagerService.deleteFile(preImagePath);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}
		
		return userDAO.updateUser(user);
	}
	
	public User getUserCouple(int userId1) {
		return userDAO.selectUserCouple(userId1);
	}
}
