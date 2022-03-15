<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<div class="sign-up-box">
		<div class="profile"></div>
		
		<div class="mt-3 mb-2">
			<label class="mr-2"><input type="radio" value="여자" name="gender" checked>여자</label>
			<label><input type="radio" value="남자" name="gender">남자</label>
		</div>
		
		<div class="d-flex justify-content-between">
			<input type="text" id="loginId" name="loginId" class="form-control col-7" placeholder="아이디">
			<div><button type="button" id="isDuplicatedBtn" class="btn btn-outline-primary">중복확인</button></div>
		</div>
		
		<div id="inputId" class="small text-danger d-none">아이디를 입력해주세요</div>
		<div id="isDuplicatedId" class="small text-danger d-none">중복된 아이디 입니다.</div>
		<div id="isAvailableId" class="small text-success d-none">사용가능한 아이디 입니다.</div>
		
		<input type="password" id="password" name="password" class="form-control mt-3" placeholder="비밀번호">
		<div id="inputPassword" class="small text-danger d-none">비밀번호를 입력해주세요</div>
		
		<input type="password" id="confirmPassword" name="confirmPassword" class="form-control mt-3" placeholder="비밀번호 확인">
		<div id="inputConfirmPassword" class="small text-danger d-none">비밀번호를 다시 입력해주세요</div>
		<div id="inputSamePassword" class="small text-danger d-none">비밀번호가 틀립니다.<br> 비밀번호를 확인 해주세요.</div>
		
		<input type="text" id="name" name="name" class="form-control mt-3" placeholder="이름">
		<div id="inputName" class="small text-danger d-none">이름을 입력해주세요</div>
		
		<input type="text" id="birth" name="birth" class="form-control mt-3" placeholder="생년월일">
		<div id="inputBirth" class="small text-danger d-none">생년월일을 입력해주세요</div>
		
		<input type="text" id="date" name="date" class="form-control mt-3" placeholder="처음 만난 날">
		<div id="inputDate" class="small text-danger d-none">처음 만난 날을 입력해주세요</div>
		
		<button type="button" class="sign-up-btn btn btn-outline-primary w-100 mt-3">가입하기</button>
	
		<hr>
		<div class="text-center">계정이 있으신가요? <a href="/user/sign_in_view">로그인</a></div>
	</div>
</div>

<script>
	$(document).ready(function(e) {
		//alert('click');
		
		$('#isDuplicatedBtn').on('click',function(e) {
			//alert('click');
			
			let loginId = $('#loginId').val().trim();
			
			$('#inputId').addClass('d-none');
			$('#isDuplicatedId').addClass('d-none');
			$('#isAvailableId').addClass('d-none');
			
			if (loginId == '') {
				$('#inputId').removeClass('d-none');
				return;
			} 
			
	/* 		$.ajax({
				type: 'GET'
				,url: '/user/is_duplicated_id'
				,data: {"loginId": loginId}
				,success: function(data) {
					if (data.result == 'success') {
						$('#isDuplicatedId').removeClass('d-none');
					} else {
						$('#isAvailableId').removeClass('d-none');
					}
				}
				,error: function(data) {
					alert('관리자에게 문의바랍니다');
				}
			}); */
			
		});
		
		
		$('.sign-up-btn').on('click',function(e) {
			//alert('click');
			let gender = $('input[name="gender"]:checked').val();
			//console.log(person);
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val();
			let confirmPassword = $('#confirmPassword').val();
			let name = $('#name').val().trim();
			let birth = $('#birth').val().trim();
			let date = $('#date').val().trim();
	
			$('#inputId').addClass('d-none');
			$('#inputPassword').addClass('d-none');
			$('#inputConfirmPassword').addClass('d-none');
			$('#inputSamePassword').addClass('d-none');
			$('#inputName').addClass('d-none');
			$('#inputBirth').addClass('d-none');
			$('#inputDate').addClass('d-none');
			
			if (loginId == '') {
				$('#inputId').removeClass('d-none');
				return;
			} 
			
			if (password == '') {
				$('#inputPassword').removeClass('d-none');
				return;
			} 
			
			if (confirmPassword == '') {
				$('#inputConfirmPassword').removeClass('d-none');
				return;
			} 
			
			if (confirmPassword != password) {
				$('#inputSamePassword').removeClass('d-none');
				$('#password').val('');
				$('#confirmPassword').val('');
				return;
			} 
			
			if (name == '') {
				$('#inputName').removeClass('d-none');
				return;
			} 
			
			if (birth == '') {
				$('#inputBirth').removeClass('d-none');
				return;
			} 
			
			if (date == '') {
				$('#inputDate').removeClass('d-none');
				return;
			} 
			
			$.ajax({
				type: 'POST'
				,url: '/user/sign_up'
				,data: {
					"gender":gender,
					"loginId":loginId, 
					"password":password,
					"name":name,
					"birth":birth,
					"date":date
				}
				,success: function(data) {
					if (data.result == 'success') {
						alert(loginId + '님 환영합니다');
					}
				}
				,error: function(data) {
					alert(data.errorMessage);
				}
					
			});
		
		});
	});
</script>