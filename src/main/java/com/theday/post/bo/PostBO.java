package com.theday.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theday.post.dao.PostDAO;
import com.theday.post.model.Post;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;	
	
	public int insertPost (Post post) {
	
		return postDAO.insertPost(post);
	}
	
	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	
}
