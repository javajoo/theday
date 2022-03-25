<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-center">
	<div class="top-part">               
		<div class="d-flex justify-content-between">
			<div class="story ml-3 font-weight-bold"><b>스토리</b></div>
			<a href="/post/post_create_view"><img src="/static/image/edit.png" width="40" class="mr-3 mt-2"></a>
		</div>
		
		<div class="list-box">
			<c:forEach items="${postList}" var="post">
				<div class="border border-rounded p-3 mb-4">
					<div class="d-flex justify-content-between">
						<div class="mb-2"><b><fmt:formatDate value="${post.createdAt}" pattern="yyyy년 MM월 dd일 E요일" /></b></div>
						<a href="#"  data-toggle="modal" data-target="#moreModal"><img src="/static/image/more.png" alt="image" width="30"></a>
					</div>
					<div class="d-flex mb-2">
						 <c:if test="${empty user.profileImagePath}">
			 				 <a href="#" id="fileUpLoadBtn" ><img src="/static/image/img1.webp" class="profile" id="userImage"></a>
						 </c:if>
						<img src="${user.profileImagePath}" class="post-profile">
						<div class="ml-2 mt-1"><b>${post.userId}</b></div>
					</div>
					
						<c:if test="${not empty post.imagePath}">
			 				<img src="${post.imagePath}"  alt="image" width="400">
						</c:if>
						
					 	<div class=" ml-2 mt-2">${post.content}</div>
				 	<hr>
				 	<div class="d-flex mb-2">
					 	<a href="#"><img src="/static/image/comment.png" alt="image" width="30"></a>
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

<!-- more Modal -->
<div class="modal" id="moreModal">
  <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <div class="modal-content">
      	<!-- modal 창 안에 내용 넣기 -->
      	<div>
      		<!-- class="d-block" : 버튼 전체를 선택할 수 있게 해준다. -->
      		<div class="my-3 text-center"><a href="#" class="del-post d-block">삭제하기</a></div>
      		<hr>
      		<div class="my-3 text-center"><a href="#" class="d-block" data-dismiss="modal">취소</a></div>
      	</div>
    </div>
  </div>
</div>



<div class="d-flex justify-content-center mt-3">
	<a href="/couple/home_view"><img src="/static/image/house.png" class="mr-4" height="50"></a>
	<a href="#"><img src="/static/image/chat.png" class="mr-4" height="50"></a>
	<a href="/calendar/calendar_view"><img src="/static/image/calendar.png" height="50"></a>
</div>