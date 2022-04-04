package com.theday.comment.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.theday.comment.model.Comment;

@Repository
public interface CommentDAO {

	public void insertComment(Comment comment);
	
	public List<Comment> selectCommentListByPostId(int postId);
}
