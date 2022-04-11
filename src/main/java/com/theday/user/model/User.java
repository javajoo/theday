package com.theday.user.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class User {

	private int id;
	private String loginId;
	private String password;
	private String name;
	private String birth;
	private String gender;
	private String profileImagePath; // db에 저장되는 이미지경로
	private MultipartFile profileImage; // 파일에 저장되는 이미지
	private String date;
	private Date createdAt;
	private Date updatedAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getProfileImagePath() {
		return profileImagePath;
	}

	public void setProfileImagePath(String profileImagePath) {
		this.profileImagePath = profileImagePath;
	}

	public MultipartFile getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(MultipartFile profileImage) {
		this.profileImage = profileImage;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", loginId=" + loginId + ", password=" + password + ", name=" + name + ", birth="
				+ birth + ", gender=" + gender + ", profileImagePath=" + profileImagePath + ", profileImage="
				+ profileImage + ", date=" + date + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + "]";
	}
}
