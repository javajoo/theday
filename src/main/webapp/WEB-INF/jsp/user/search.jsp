<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center">
	<div class="search-box">
		<div class="sign-text mb-3">THE DAY<br>아이디로 계정을 연결하세요</div>
		
		<div class="d-flex">
		    <input class="form-control col-9" type="search" id="loginId" name="loginId" placeholder="상대방의 아이디">
		    <div><button class="search-btn btn btn-outline-primary ml-2" type="button" onclick="search()">검색</button></div>
		</div>
		
		<div id="inputId" class="small text-danger d-none">아이디를 입력해주세요</div>

	</div>

</div>
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
				<tbody id="tBody">
					<tr>
						<td colspan="6">검색한 조건을 찾을 수 없습니다.</td>
					</tr>
				</tbody>
		</table>
	
<script>

	function connect(obj) {
		//alert(obj.getAttribute('data-user-id'));
		var data = {
				userId2 : obj.getAttribute('data-user-id')
				}
		$.post({
			url: "/couple"
			,data: JSON.stringify(data)
			,contentType: 'application/json;charset=UTF-8'
			,success : function(res) {
				console.log(res);
				location.href= "/couple/home_view";
			}
			,error: function(err) {
				alert(err);
			}
		})
	};
	
	function search() {
		let loginId = $('#loginId').val().trim();
		
		$('#inputId').addClass('d-none');
		$('#loginId').removeClass('is-invalid');
		
		if (loginId == '') {
			$('#inputId').removeClass('d-none');
			$('#loginId').addClass('is-invalid');
			return;
		}
		
		$.ajax({
			type: 'get'
			,url: '/user/search/' + loginId
			,success: function(data) {
				if (data.result == 'success') {
					var html = '';
					for(var user of data.userList){
						html += '<tr>';
						html += '<td class="pt-3">' + user.loginId+'</td>';
						html += '<td class="pt-3">' + user.name+'</td>';
						html += '<td class="pt-3">' + user.gender+'</td>';
						html += '<td class="pt-3">' + user.birth+'</td>';
						html += '<td class="pt-3">' + user.date+'</td>';
						html += '<td class=""><button type="button" class="sign-up-btn btn btn-outline-primary" data-user-id="${user.id}">연결</button></td>';
						html += '</tr>'
					}
					$('#tBody').html(html);
				} else {
					if(!data.userList.length){
						var html = '<tr>';
						html +=	'<td colspan="6">검색한 조건을 찾을 수 없습니다.</td>';
						html += '</tr>'
						$('#tBody').html(html);
					}
				}
			}
			,error: function(e) {
				alert('관리자에게 문의바랍니다.');
			}
		}); 
	};

</script>