package com.theday.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theday.comment.bo.CommentBO;
import com.theday.comment.model.CommentView;
import com.theday.post.bo.PostBO;
import com.theday.post.model.Post;
import com.theday.timeline.model.ContentView;
import com.theday.user.bo.UserBO;
import com.theday.user.model.User;

@Service 
public class ContentBO {

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;
	
	public List<ContentView> generateContentViewList(int userId) {
		List<ContentView> contentViewList = new ArrayList<>();
		
		List<Post> postList = postBO.getPostList();
		
		for (Post post : postList) {
			ContentView content = new ContentView();
			
			// 글정보
			content.setPost(post);
			
			// 글쓴이 정보
			User user = userBO.getUserByUserId(post.getUserId());
			content.setUser(user);
			
			// 댓글정보
			List<CommentView> commentList = commentBO.generateCommentViewListByPostId(post.getId());
			content.setCommentList(commentList);
			
			
			contentViewList.add(content);
			
			
		}
		return contentViewList;
	}
}
