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
				<th>번호</th>
				<th>아이디</th>
				<th>성별</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			
				<tr>
					<td data-couple-userId1="${couple.userId1}">${couple.userId1}</td>
			 		<td>${coupleList.loginId}</td>
					<td>
						<button id="state" class="search-btn btn btn-outline-primary ml-2" type="button" onclick="agree(this)" value='성공'
						data-couple-userId2="${coupleList.id}">커플연결${coupleList.id}</button>
					</td>
				</tr>
			
		</tbody>
	</table>
	
	
	<script>
		function agree() {
			//alert('click');
			var userId2 = $(this).data('couple-userId2');
			var state = $('#state').val();
			
			console.log(userId2);
			var data = {
					"userId2" : userId2,
					"state" : state
					}
			
	
			$.ajax({
				type: 'PUT'
				,url: '/user/agree'
				 ,data: { 'userId2': userId2, 'state': state} 
				/* ,data: JSON.stringify(data)  */
				/* ,contentType: 'application/json;charset=UTF-8' */
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
	</script>