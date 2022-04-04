package com.theday.post.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.theday.post.model.Post;

@Repository 
public interface PostDAO {

	public int insertPost (Post post);
	
	public List<Post> selectPostList();
	
	public void deletePostById(Post post);
}
