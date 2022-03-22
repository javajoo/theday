package com.theday.post;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/post")
@RestController
public class PostRestController {

	@PostMapping("/create")
	public Map<String, Object> create() {
		Map<String, Object> result = new HashMap<>();
		return null;
	}
}
