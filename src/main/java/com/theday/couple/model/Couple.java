package com.theday.couple.model;

import java.util.Date;

import com.theday.user.model.User;

public class Couple {

	private int id;
	private int userId1;
	private int userId2;
	private String state;
	private Date createdAt;
	private Date updatedAt;
	private User u1;
	private User u2;
	
	
	public User getU1() {
		return u1;
	}

	public void setU1(User u1) {
		this.u1 = u1;
	}

	public User getU2() {
		return u2;
	}

	public void setU2(User u2) {
		this.u2 = u2;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId1() {
		return userId1;
	}

	public void setUserId1(int userId1) {
		this.userId1 = userId1;
	}

	public int getUserId2() {
		return userId2;
	}

	public void setUserId2(int userId2) {
		this.userId2 = userId2;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
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
		return "Couple [id=" + id + ", userId1=" + userId1 + ", userId2=" + userId2 + ", state=" + state
				+ ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + ", u1=" + u1 + ", u2=" + u2 + "]";
	}

	

}
