package com.theday.post.dao;

import org.springframework.stereotype.Repository;

import com.theday.post.model.Post;

@Repository 
public interface PostDAO {

	public int insertPost (Post post);
}
