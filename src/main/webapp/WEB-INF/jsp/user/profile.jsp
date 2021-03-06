<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="d-flex justify-content-center">
	<div class="sign-up-box">
		 <input type="file" id="file" name="file" class="d-none" accept=".jpg, .png, .jpeg, .gif"  onchange="PreviewImage()" >
		 <c:if test="${empty user.profileImagePath}">
			  <a href="#" id="fileUpLoadBtn" ><img src="/static/image/user.png" class="profile" id="userImage"></a>
		 </c:if>
		 <c:if test="${!empty user.profileImagePath}">
		 	<a href="#" id="fileUpLoadBtn" ><img src="${user.profileImagePath}" class="profile" id="userImage"></a>
		 </c:if>
		<div class="mt-3 mb-2">
			<label class="mr-2"><input type="radio" value="여자" name="gender" <c:if test="${user.gender eq '여자'}">checked="checked"</c:if>/>여자</label>
			<label><input type="radio" value="남자" name="gender"  <c:if test="${user.gender eq '남자'}">checked="checked"</c:if>/>남자</label>
		</div>
		
		<div class="mt-3"><small>아이디</small></div>
		<input type="text" id="loginId" name="loginId" class="form-control bg-light" placeholder="아이디"  value="${user.loginId}" disabled >
		
		<div id="inputId" class="small text-danger d-none">아이디를 입력해주세요</div>
		<div id="isDuplicatedId" class="small text-danger d-none">중복된 아이디 입니다.</div>
		<div id="isAvailableId" class="small text-success d-none">사용가능한 아이디 입니다.</div>
		
		<div class="mt-3"><small>비밀번호</small></div>
		<input type="password" id="password" name="password" class="form-control" placeholder="비밀번호"  value="${user.password}">
		<div id="inputPassword" class="small text-danger d-none">비밀번호를 입력해주세요</div>
		
		<div class="mt-3"><small>비밀번호 확인</small></div>
		<input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="비밀번호 확인" value="${user.password}">
		<div id="inputConfirmPassword" class="small text-danger d-none">비밀번호를 다시 입력해주세요</div>
		<div id="inputSamePassword" class="small text-danger d-none">비밀번호가 틀립니다.<br> 비밀번호를 확인 해주세요.</div>
		
		<div class="mt-3"><small>이름</small></div>
		<input type="text" id="name" name="name" class="form-control" placeholder="이름"  value="${user.name}">
		<div id="inputName" class="small text-danger d-none">이름을 입력해주세요</div>
		
		<div class="mt-3"><small>생년월일</small></div>
		<input type="text" id="birth" name="birth" class="form-control" placeholder="생년월일"  value="${user.birth}">
		<div id="inputBirth" class="small text-danger d-none">생년월일을 입력해주세요</div>
		
		<div class="mt-3"><small>처음 만난 날</small></div>
		<input type="text" id="date" name="date" class="form-control bg-light" placeholder="처음 만난 날"  value="${user.date}" disabled>
		<div id="inputDate" class="small text-danger d-none">처음 만난 날을 입력해주세요</div>
		
		<button type="button" class="update-btn btn btn-outline-primary w-100 mt-3">수정하기</button>
		<a href="${pageContext.request.contextPath}/couple/home_view" type="button" class=" btn btn-outline-danger w-100 mt-3">취소하기</a>
	
	</div>
</div>

  
<script>
	function PreviewImage() {
	    // 파일리더 생성 
	    var preview = new FileReader();
	    preview.onload = function (e) {
	    // img id 값 
	    document.getElementById("userImage").src = e.target.result;
		};
		// input id 값 
		preview.readAsDataURL(document.getElementById("file").files[0]);
		};

		$(document).ready(function(e) {
		//alert('click');
		
		$('#fileUpLoadBtn').on('click',function(e) {
			//alert('click');
			e.preventDefault();
			$('#file').click();
		
		}); 
		
		$('#password').val('');
		$('#confirmPassword').val('');
		
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
			let profileImage = $('#profileImage').val();
	
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
			
			
			var formData = new FormData();
			formData.append('gender', gender);
			formData.append('loginId', loginId);
			formData.append('password', password);
			formData.append('name', name);
			formData.append('birth', birth);
			formData.append('date', date);
			//formData.append('profileImage',  $('#file')[0].files[0]);
			// 사진 있을 때만 저장 (파일에 저장되는 경로를 불러와야 한다)
	 		 if( $('#file')[0].files[0]){
				formData.append('profileImage',  $('#file')[0].files[0]);
			} 
			 
			
			$.ajax({
				type: 'PUT' 
				,data: formData
				,url: '/user/profile_update'
				// 파일 업로드를 위한 필수 설정
				,enctype : 'multipart/form-data'
				,contentType : false
				,processData : false
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
		
		
		$('#birth').datepicker({
		 	changeMonth: true
			, changeYear: true
			, dateFormat: "yy-mm-dd"
			, showAnim: "clip"
			, nextText: '다음 달'
		    , prevText: '이전 달'
			, monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
			, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
			, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
			, showButtonPanel: true 
			, showMonthAfterYear: true
			, yearSuffix: '년'
	

		});
		
		$('#date').datepicker({
			changeMonth: true
			, changeYear: true
			, dateFormat: "yy-mm-dd"
			, showAnim: "clip"
			, monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
			, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
			, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
			, showButtonPanel: true 
			, showMonthAfterYear: true
			, yearSuffix: '년'
		});
		 $('#datepicker').datepicker('setDate', 'today'); 
	});
</script>