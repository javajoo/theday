package com.theday.timeline.model;

import java.util.List;

import com.theday.comment.model.CommentView;
import com.theday.post.model.Post;
import com.theday.user.model.User;

public class ContentView {

	private Post post;
	private User user;
	private List<CommentView> commentList;
	private int commentCount;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<CommentView> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommentView> commentList) {
		this.commentList = commentList;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	
	@Override
	public String toString() {
		return "ContentView [post=" + post + ", user=" + user + ", commentList=" + commentList + ", commentCount="
				+ commentCount + "]";
	}
	
	


}
