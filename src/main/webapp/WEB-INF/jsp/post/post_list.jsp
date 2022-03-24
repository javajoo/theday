<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="d-flex justify-content-center">
	<div class="top-part">               
		<div class="d-flex justify-content-between">
			<div class="story ml-3 font-weight-bold"><h1>스토리</h1></div>
			<a href="/post/post_create_view"><img src="/static/image/upload.jpg" class="mr-3 mt-1"></a>
		</div>
		
		<div class="list-box">
			<c:forEach items="${postList}" var="post">
				<div class="border border-rounded p-3 mb-4">
					<div class="mb-2"><b>2022년 3월 8일 화요일</b></div>
					<div class="d-flex mb-2">
						<img src="${user.profileImagePath}" class="post-profile">
						<div class="ml-2 mt-1"><b>${post.userId}</b></div>
					</div>
					 	<img src="${post.imagePath}"  alt="image" width="400">
					 	<div class=" ml-2 mt-2">${post.content}</div>
				 	<hr>
				 	<div class="d-flex mb-2">
					 	<a href="#"><img src="/static/image/chat.jpg" alt="image"width="40"></a>
					 	<div class="ml-1 mt-1"><small>댓글 2</small></div>
				 	</div>
				 	
					<div class="d-flex mb-2">
						<img src="${user.profileImagePath}" class="post-profile">
						<div class="ml-2 mt-1"><b>${post.userId}</b></div>
						<div class="ml-2 mt-1">안녕하세요~</div>
					</div>
			 	</div>
			</c:forEach>
		</div>
	</div>
</div>

<div class="d-flex justify-content-center mt-3">
	<a href="/couple/home_view"><img src="/static/image/home.jpg" class="mr-4" height="50"></a>
	<a href="#"><img src="/static/image/chat.jpg" class="mr-4"></a>
	<a href="#"><img src="/static/image/calender.jpg"></a>
</div>