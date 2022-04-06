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
			<c:forEach items="${contentViewList}" var="content">
				<div class="border border-rounded p-3 mb-4">
					<div class="d-flex justify-content-between">
						<div class="mb-2"><b><fmt:formatDate value="${content.post.createdAt}" pattern="yyyy년 MM월 dd일 E요일" /></b></div>
						<c:if test="${userId == content.user.id}">
							<a href="#" class="more-btn" data-target="#moreModal" data-post-id="${content.post.id}"><img src="/static/image/more.png" alt="image" width="30"></a>
						</c:if>
					</div>
					<div class="d-flex mb-2">
						 <c:if test="${empty content.user.profileImagePath}">
			 				 <a href="#" id="fileUpLoadBtn" ><img src="/static/image/user.png" class="post-profile"></a>
						 </c:if>
						 
						 <c:if test="${!empty content.user.profileImagePath}">
							<img src="${content.user.profileImagePath}" class="post-profile">
						 </c:if>
						<div class="ml-2 mt-1"><b>${content.user.loginId}</b></div>
					</div>
					
						<c:if test="${not empty content.post.imagePath}">
			 				<img src="${content.post.imagePath}"  alt="image" width="400">
						</c:if>
						
					 	<div class=" ml-2 mt-2">${content.post.content}</div>
				 	<hr>
				 	
				 	<!-- 댓글 보기 -->
				 	<div class="d-flex mb-2">
					 	<a href="#" ><img src="/static/image/comment.png" alt="image" width="20" ></a>
					 	<div class="ml-1"><small>댓글</small></div>
				 	</div>
				 	
					<div class="mb-2">
						<c:forEach items="${content.commentList}" var="comment">
							<div class="d-flex mb-2">
								 <c:if test="${empty comment.user.profileImagePath}">
					 				 <a href="#" id="fileUpLoadBtn" ><img src="/static/image/user.png" class="post-profile"></a>
					 				 <span class="ml-2 mt-1"><b>${comment.user.loginId}</b></span>
					 				 <span class="ml-2 mt-1">${comment.comment.content}</span>
								 </c:if>
							 </div>
							 
							 <div class="d-flex mb-1">
								 <c:if test="${!empty comment.user.profileImagePath}">
									<img src="${comment.user.profileImagePath}" class="post-profile">
									<span class="ml-2 mt-1"><b>${comment.user.loginId}</b></span>
									<span class="ml-2 mt-1">${comment.comment.content}</span>
								 </c:if>
							 </div>
						</c:forEach>
					</div>
					
					<!-- 댓글 쓰기 -->
					<div class="input-group mt-3 col-10">
						<input type="text" class="comment-text form-control" id="commentText${content.post.id}" placeholder="댓글달기">
						<div class="input-group-prepend">
							<button class="btn input-group-text commentBtn" data-post-id="${content.post.id}">게시</button>
						</div>
					</div>
					<div id="inputComment${content.post.id}" class="small text-danger ml-3 mt-1 d-none">댓글을 입력해주세요</div>
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
	<a href="/chat/chat_view"><img src="/static/image/chat.png" class="mr-4" height="50"></a>
	<a href="/calendar/calendar_view"><img src="/static/image/calendar.png" height="50"></a>
</div>


<script>
	
		$('.more-btn').on('click', function(e) {
			//alert('click');
			var id = $(this).data('post-id');
			$('#moreModal').data('post-id', id);
			$('#moreModal').modal();
		});
		
		$('#moreModal .del-post').on('click',function(e) {
			//e.preventDefault();
			var id = $('#moreModal').data('post-id');
			$.ajax({
				type: 'DELETE'
				,url: '/post/delete'
				,data: {'id' : id}
				,success: function(data) {
					if (data.result == 'success') {
						alert('게시글이 삭제 되었습니다.');
						location.reload();
					}
				}
				,error: function(data) {
					alert('관리자에게 문의 바랍니다.');
				}
			});
		});
		
		$('.commentBtn').on('click',function(e) {
			//alert('click');
			//e.preventDefault();
			 e.stopImmediatePropagation();
			
			var postId = $(this).data('post-id');
			var commentContent = $('#commentText' + postId).val().trim();
			
			$('#inputComment' + postId).addClass('d-none');
			$('#commentText' + postId).removeClass('is-invalid');
			
			if (commentContent == '') {
			 	$('#inputComment' + postId).removeClass('d-none');
				$('#commentText' + postId).addClass('is-invalid'); 
				return;
			}
			
			$.ajax({
				type: 'post'
				,url: '/comment/create'
				,data: {'postId' : postId , 'content': commentContent}
				,success: function(data) {
					if (data.result == 'success') {
						alert('댓글이 입력 되었습니다.');
						location.reload();
					} else {
						alert(data.errorMessage);
					}
				}
				,error: function(data) {
					alert('관리자에게 문의 바랍니다.');
				}
			});
		});
		
	
</script>





