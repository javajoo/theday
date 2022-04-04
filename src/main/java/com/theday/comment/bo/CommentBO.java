package com.theday.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theday.comment.dao.CommentDAO;
import com.theday.comment.model.Comment;
import com.theday.comment.model.CommentView;
import com.theday.user.bo.UserBO;
import com.theday.user.model.User;

@Service
public class CommentBO {


	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	public void  insertComment(Comment comment) {
		commentDAO.insertComment(comment);
	}
	
	public List<Comment> selectCommentListByPostId(int postId) {
		return commentDAO.selectCommentListByPostId(postId);
	}
	
	public List<CommentView> generateCommentViewListByPostId(int postId) {
		List<CommentView> resultList = new ArrayList<>();
		List<Comment> commentList = selectCommentListByPostId(postId);
		
		for (Comment comment : commentList) {
			CommentView commentView = new CommentView();
			
			//댓글
			commentView.setComment(comment);
			
			//댓글쓴이
			User user = userBO.getUserByUserId(comment.getUserId());
			commentView.setUser(user);
			
			resultList.add(commentView);
		}
		return resultList;
	}
}
