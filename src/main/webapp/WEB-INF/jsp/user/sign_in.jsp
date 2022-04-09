<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="sign-in-box">
		<div class="sign-text">썸은 끝났다.<br>연애의 시작, THE DAY</div>
		
		<input type="text" id="loginId" name="loginId" class="form-control mt-3" placeholder="아이디" >
		<div id="inputId" class="small text-danger d-none" >아이디를 입력해주세요</div>
		
		<input type="password" id="password" name="password" class="form-control mt-3" placeholder="비밀번호" >
		<div id="inputPassword" class="small text-danger d-none" >비밀번호를 입력해주세요</div> 
		
		<button type="button" class="sign-in-btn btn btn-outline-primary w-100 mt-3" onclick="signIn()" >로그인</button>
		<hr>
		<div class="text-center">계정이 없으신가요? <a href="${pageContext.request.contextPath}/user/sign_up_view" class="badge badge-primary">회원가입</a></div>
	</div>
</div>

<script>

	$('#loginId').focus();
	
	$(document).keypress(function(event){
		
	  var keycode = (event.keyCode ? event.keyCode : event.which);
	  if(keycode == '13'){
		  signIn();
	  }
	});
	
	function signIn() {
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val();
		
		$('#loginId').removeClass('is-invalid');
		$('#password').removeClass('is-invalid');
		
		$('#inputId').addClass('d-none');
		$('#inputPassword').addClass('d-none');
	


		if (loginId == '') {
			$('#loginId').addClass('is-invalid');
			$('#inputId').removeClass('d-none');
			return;
		}
		
		if (password == '') {
			$('#password').addClass('is-invalid');
			$('#inputPassword').removeClass('d-none');
			return;
		}
		
		$.ajax({
			type: 'POST'
			,url: '/user/sign_in'
			,data: {'loginId':loginId, 'password':password}
			,success: function(data) {
				if (data.result == 'success') {
					alert(loginId + '님 로그인 되었습니다.');
					if(data.selectedCouple==='true'){
						location.href ='/couple/home_view';
					}else{
						location.href = '/user/search_view';
					}
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