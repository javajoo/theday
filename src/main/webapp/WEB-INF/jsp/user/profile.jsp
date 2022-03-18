<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<div class="sign-up-box">
		 <input type="file" class="profile" accept='.jpg, .png, .jpeg' id="profileImage" name="profileImage">
		
		<div class="mt-3 mb-2">
			<label class="mr-2"><input type="radio" value="여자" name="gender" checked>여자</label>
			<label><input type="radio" value="남자" name="gender">남자</label>
		</div>
		
		<div class="d-flex justify-content-between">
			<input type="text" id="loginId" name="loginId" class="form-control mt-3" placeholder="아이디" value="">
		</div>
		
		<div id="inputId" class="small text-danger d-none">아이디를 입력해주세요</div>
		<div id="isDuplicatedId" class="small text-danger d-none">중복된 아이디 입니다.</div>
		<div id="isAvailableId" class="small text-success d-none">사용가능한 아이디 입니다.</div>
		
		<input type="password" id="password" name="password" class="form-control mt-3" placeholder="비밀번호" value="">
		<div id="inputPassword" class="small text-danger d-none">비밀번호를 입력해주세요</div>
		
		<input type="password" id="confirmPassword" name="confirmPassword" class="form-control mt-3" placeholder="비밀번호 확인" value="">
		<div id="inputConfirmPassword" class="small text-danger d-none">비밀번호를 다시 입력해주세요</div>
		<div id="inputSamePassword" class="small text-danger d-none">비밀번호가 틀립니다.<br> 비밀번호를 확인 해주세요.</div>
		
		<input type="text" id="name" name="name" class="form-control mt-3" placeholder="이름" value="">
		<div id="inputName" class="small text-danger d-none">이름을 입력해주세요</div>
		
		<input type="text" id="birth" name="birth" class="form-control mt-3" placeholder="생년월일" value="">
		<div id="inputBirth" class="small text-danger d-none">생년월일을 입력해주세요</div>
		
		<input type="text" id="date" name="date" class="form-control mt-3" placeholder="처음 만난 날" value="">
		<div id="inputDate" class="small text-danger d-none">처음 만난 날을 입력해주세요</div>
		
		<button type="button" class="update-btn btn btn-outline-primary w-100 mt-3">수정하기</button>
	
	</div>
</div>

  
<script>
	$(document).ready(function(e) {
		//alert('click');
				
		$('.update-btn').on('click',function(e) {
			//alert('click');
			let gender = $('input[name="gender"]:checked').val();
			//console.log(person);
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val();
			let confirmPassword = $('#confirmPassword').val();
			let name = $('#name').val().trim();
			let birth = $('#birth').val().trim();
			let date = $('#date').val().trim();
			let profileImage = $('#profileImage').val().trim();
	
			$('#inputId').addClass('d-none');
			$('#inputPassword').addClass('d-none');
			$('#inputConfirmPassword').addClass('d-none');
			$('#inputSamePassword').addClass('d-none');
			$('#inputName').addClass('d-none');
			$('#inputBirth').addClass('d-none');
			$('#inputDate').addClass('d-none');
			
			$('#loginId').removeClass('is-invalid');
			$('#password').removeClass('is-invalid');
			$('#confirmPassword').removeClass('is-invalid');
			$('#name').removeClass('is-invalid');
			$('#birth').removeClass('is-invalid');
			$('#date').removeClass('is-invalid');
			
			
			if (loginId == '') {
				$('#inputId').removeClass('d-none');
				$('#loginId').addClass('is-invalid');
				
				return;
			} 
			
			if (password == '') {
				$('#inputPassword').removeClass('d-none');
				$('#password').addClass('is-invalid');
				return;
			} 
			
			if (confirmPassword == '') {
				$('#inputConfirmPassword').removeClass('d-none');
				$('#confirmPassword').addClass('is-invalid');
				return;
			} 
			
			if (confirmPassword != password) {
				$('#inputSamePassword').removeClass('d-none');
				$('#password').addClass('is-invalid');
				$('#confirmPassword').addClass('is-invalid');
				$('#password').val('');
				$('#confirmPassword').val('');
				return;
			} 
			
			if (name == '') {
				$('#inputName').removeClass('d-none');
				$('#name').addClass('is-invalid');
				return;
			} 
			
			if (birth == '') {
				$('#inputBirth').removeClass('d-none');
				$('#birth').addClass('is-invalid');
				return;
			} 
			
			if (date == '') {
				$('#inputDate').removeClass('d-none');
				$('#date').addClass('is-invalid');
				return;
			} 
			
			$.ajax({
				type: 'POST'
				,url: '/user/profile'
				,data: {
					"profileImage":profileImage,
					"gender":gender,
					"loginId":loginId, 
					"password":password,
					"name":name,
					"birth":birth,
					"date":date
				}
				,success: function(data) {
					if (data.result == 'success') {
						alert(loginId + '님 정보가 수정되었습니다.');
						location.href = "/couple/home_view";
					} else {
						alert(data.errorMessage);
					}
				}
				,error: function(data) {
					alert('관리자에게 문의바랍니다.');
				}
					
			});
		
		});
	});
</script>