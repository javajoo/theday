package com.theday.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.theday.user.model.User;

@Component
public class PermissionInterceptor implements HandlerInterceptor {

	private Logger log = LoggerFactory.getLogger(PermissionInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		
		String uri = request.getRequestURI();
		
		if (user == null && !uri.startsWith("/user/sign_in") && !uri.startsWith("/user/sign_up") && !uri.startsWith("/user/is_duplicated_id")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
//		else if (user != null && uri.startsWith("/user")) {
//			if (!uri.endsWith("search_view")) { 
//				response.sendRedirect("/couple/home_view");
//			} 
//			response.sendRedirect("/couple/home_view");
//		} 
		
		else if (user == null && uri.startsWith("/post")) {
			response.sendRedirect("/user/sign_in_view"); //ok
		} else if (user == null && uri.startsWith("/couple")) {
			response.sendRedirect("/user/sign_in_view"); //ok
		}
		
			
			log.warn("######### preHandle 호출, uri:{}", uri);
			
			return true;
		}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) {
		
		// URI 확인 (URL path를 가져온다)
		String uri = request.getRequestURI();
		
		
		log.warn("######### postHandle 호출,url:{}" ,uri);
		
	}
	
	@Override
	public void afterCompletion (HttpServletRequest request, HttpServletResponse response,
			Object handler, Exception ex) {


		// URI 확인 (URL path를 가져온다)
		String uri = request.getRequestURI();
		
		log.warn("######## afterCompletion 호출,uri:{}", uri);
		
	}
}
