<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<div class="post-box">
		<div class="mb-2 story-create"><b>스토리 작성하기!</b></div>
		<textarea id="content" name="content" rows="6" cols="50" class="content form-control" placeholder="스토리에 올릴 내용을 작성해주세요."></textarea>
		<div id="textareaId" class="small text-danger d-none mt-2" >내용을 입력해주세요</div>
		<div class="mt-3">
			<input type="file" id="file" name="file" accept=".jpg, .png, .jpeg, .gif" class="d-none" onchange="PreviewImage()">
			
			<a href="#" id="fileUpLoadBtn"><img src="/static/image/upload.png" id="userImage" width="100" height="100"></a>
		</div>
		<input type="hidden" id="userId" value="${sessionScope.user.id}">
		<button type="button" class="upload-btn btn btn-outline-primary mt-3 w-100">업로드</button>
	</div>
</div>

<div class="d-flex justify-content-center mt-3">
	<a href="/couple/home_view"><img src="/static/image/house.png" class="mr-4" height="50"></a>
	<a href="/post/post_list_view"><img src="/static/image/pictures.png" class="mr-4" width="50"></a>
	<a href="#"><img src="/static/image/chat.png" class="mr-4" height="50"></a>
	<a href="/calendar/calendar_view"><img src="/static/image/calendar.png" height="50"></a>
</div>

<script>

	$('#content').focus();

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
	
	$('#fileUpLoadBtn').on('click',function(e) {
		//alert('click');
		e.preventDefault();
		$('#file').click();
	
	}); 
	
	
	$(document).ready(function(e) {
		//alert('click');
		$('.upload-btn').on('click',function(e) {
			//alert('click');
			
			var textareaId = $('#textareaId').val();
			$('#content').removeClass('is-invalid');
			
			var content = $('#content').val();
			if (content == '') {
				$('#content').addClass('is-invalid');
				$('#textareaId').removeClass('d-none');
				return;
			}
			
			var file = $('#file').val();
			
			var formData = new FormData();
			formData.append('content',content);
			
			// 사진 있을 때만 저장
			if ($('#file')[0].files[0]) {
				formData.append('image',$('#file')[0].files[0]);
			}
		
			
			$.ajax({
				type : 'POST'
				,url: '/post/create'
				,data: formData
				,enctype: 'multipart/form-data'
				,contentType: false
				,processData: false
				,success: function(data) {
					if(data.result == 'success') {
						alert('게시글이 저장되었습니다.');
						location.href='/post/post_list_view';
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