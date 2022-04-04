<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <div class="d-flex justify-content-center">
		<div class="agree-box">
		<div class="sign-text mb-3">THE DAY<br>아이디로 계정을 연결하세요</div>
		</div>
			
	</div>
	<table class="table text-center table-hover mt-3">
		<thead>
			<tr>
				<th>아이디</th>
				<th>내가 요청한 사람</th>
				<th>내가 요청받은 사람</th>
			</tr>
		</thead>

		<tbody>
			<!-- 내가 요청한 사람 -->
	 	 	<c:forEach var="coupleList1" items="${coupleList1}"> 
				<tr>
			 		<td>${coupleList1.loginId}</td>
					<td>
						<button type="button" class="state reject-btn btn btn-outline-danger ml-2"  onclick="reject(this)" value='취소' data-couple1-id="${coupleList1.id}">취소</button>
					</td>
					<td></td>
				</tr>
			</c:forEach> 
			
			<!-- 내가 요청받은 사람 -->
			<c:forEach var="coupleList2" items="${coupleList2}"> 
				<tr>
			 		<td>${coupleList2.loginId}</td>
			 		<td></td>
					<td>
						<button type="button" class="state agree-btn btn btn-outline-primary ml-2"  onclick="agree(this)" value='성공' data-couple2-id="${coupleList2.id}">수락</button>
						<button type="button" class="state reject-btn btn btn-outline-danger ml-2"  onclick="reject2(this)" value='취소' data-couple2-id="${coupleList2.id}">거절</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<script>
		function agree(obj) {
			var data = {
				userId1 : obj.getAttribute('data-couple2-id')
				//,"state" : state
				}
			$.ajax({
				type: 'POST'
				,url: '/couple/agree'
				,data: JSON.stringify(data)  
				,contentType: 'application/json;charset=UTF-8' 
				,success: function(data) {
					if (data.result == 'success') {
						alert('커플연결이 되었습니다.');
						location.href='/couple/home_view';
					} else {
						alert(data.errorMessage);
					}
				}
				,error: function(data) {
					alert('관리자에게 문의바랍니다.');
				}
			});
		}
		
		function reject(obj) {
			var data = {
				userId2 : obj.getAttribute('data-couple1-id')
				//,"state" : state
				}
			$.ajax({
				type: 'delete'
				,url: '/couple/reject'
				,data: JSON.stringify(data)  
				,contentType: 'application/json;charset=UTF-8' 
				,success: function(data) {
					if (data.result == 'success') {
						alert('커플연결이 취소되었습니다.');
						location.reload();
					} 
				}
				,error: function(data) {
					alert('관리자에게 문의바랍니다.');
				}
			});
		}
		
		function reject2(obj) {
			var data = {
				userId1 : obj.getAttribute('data-couple2-id')
				}
			$.ajax({
				type: 'delete'
				,url: '/couple/reject2'
				,data: JSON.stringify(data)  
				,contentType: 'application/json;charset=UTF-8' 
				,success: function(data) {
					if (data.result == 'success') {
						alert('커플연결이 취소되었습니다.');
						location.reload();
					} 
				}
				,error: function(data) {
					alert('관리자에게 문의바랍니다.');
				}
			});
		}
	</script>