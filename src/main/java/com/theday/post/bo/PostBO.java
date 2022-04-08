package com.theday.post.bo;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theday.comment.bo.CommentBO;
import com.theday.comment.model.Comment;
import com.theday.common.FileManagerService;
import com.theday.post.dao.PostDAO;
import com.theday.post.model.Post;
import com.theday.user.model.User;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;	
	
	@Autowired
	private CommentBO commentBO;	
	
	@Autowired
	private FileManagerService fileManagerService;
	
	public int insertPost (Post post, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		// 이미지 사진 넣기
		String imagePath = null;
		if (post.getImage() != null) {
			imagePath = fileManagerService.saveFile(user.getLoginId(), post.getImage());
			post.setImagePath(imagePath);
		}
		
		return postDAO.insertPost(post);
	}
	
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	public void deletePostById(Post post,Comment comment) {
		commentBO.deleteComment(comment);
		postDAO.deletePostById(post);
		
	}
}
