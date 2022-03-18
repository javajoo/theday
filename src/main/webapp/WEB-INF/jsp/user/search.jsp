<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center">
	<div class="search-box">
		<div class="sign-text mb-3">THE DAY<br>아이디로 계정을 연결하세요</div>
		
		<div class="d-flex">
		    <input class="form-control col-9" type="search" id="loginId" name="loginId" placeholder="상대방의 아이디">
		    <div><button class="search-btn btn btn-outline-primary ml-2" type="button">검색</button></div>
		</div>
		
		<div id="inputId" class="small text-danger d-none">아이디를 입력해주세요</div>

	</div>

</div>
	<c:if test="${not empty loginId}">
		<table class="table text-center table-hover mt-5">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>생일</th>
						<th>처음만난날</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userList}" var="user">
						<c:choose>
							<c:when test="${user.loginId eq loginId}">
								<tr>
								 	<td class="pt-3">${user.loginId}</td>
									<td class="pt-3">${user.name}</td>
									<td class="pt-3">${user.gender}</td>
									<td class="pt-3">${user.birth}</td>
									<td class="pt-3">${user.date}</td>
									<td>
										<div><button class="connect-btn btn btn-outline-primary" type="button" data-post-id="${user.id}">연결 ${user.id}</button></div>
									</td>
								</tr>
							</c:when>
							
							<c:otherwise>
								<div>검색한 조건을 찾을 수 없습니다.</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
		</table>
	</c:if>
	
<script>
	$(document).ready(function(e) {
		//alert('click');
		$('.search-btn').on('click',function(e) {
			//alert('click');
			
			let loginId = $('#loginId').val().trim();
			
			$('#inputId').addClass('d-none');
			$('#loginId').removeClass('is-invalid');
			
			if (loginId == '') {
				$('#inputId').removeClass('d-none');
				$('#loginId').addClass('is-invalid');
				return;
			}
			
			$.ajax({
				type: 'post'
				,url: '/user/search'
				,data: {'loginId':loginId}
				,success: function(data) {
					if (data.result == 'success') {
						location.href='couple/home_view';
					} else {
						alert(data.errorMessage);
					}
				}
				,error: function(e) {
					alert('관리자에게 문의바랍니다.');
				}
			}); 
		});
	});
</script>