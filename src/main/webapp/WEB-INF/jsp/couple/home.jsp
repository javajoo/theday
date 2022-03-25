<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center">
	<div class="home-box">
		<div class=" d-flex justify-content-between">
			<div>
				<div class="profile " data-toggle="modal" data-target="#moreModalLeft"></div>
				<div class="text-center mt-2"><b>${couple.userId2}</b></div>
			</div>
			
			<div class="d-flex align-items-center">
				<div>
					<div><h6>처음 만난 날로부터</h6></div>
					<div class="text-center"><h4>1일째</h4></div>
				</div>
			</div>
			
			<div>
				<a href="#" data-toggle="modal" data-target="#moreModalRight"><img src="${user.profileImagePath}" class="profile" id="userImage"></a>
				<div class="text-center mt-2"><b>${user.name}</b></div>
			</div>
		</div>
	
		<div class="day-box">
			<div class="d-flex">
				<div class="col-6">
					<div>처음 만난 날</div>
					<div>2022년 3월 11일</div>
				</div>
				<div class="col-6 mt-3"><span class="text-danger ">127</span>일 남았습니다.</div>
			</div>
			<hr>
			
			<div class="d-flex">
				<div class="col-6">
					<div>1주년</div>
					<div>2023년 3월 11일</div>
				</div>
				<div class="col-6 mt-3"><span class="text-danger ">127</span>일 남았습니다.</div>
			</div>
			<hr>
			
			<div class="d-flex">
				<div class="col-6">
					<div>2주년</div>
					<div>2024년 3월 11일</div>
				</div>
				<div class="col-6 mt-3"><span class="text-danger ">127</span>일 남았습니다.</div>
			</div>
			<hr>
			
			<div class="d-flex">
				<div class="col-6">
					<div>3주년</div>
					<div>2025년 3월 11일</div>
				</div>
				<div class="col-6 mt-3"><span class="text-danger ">127</span>일 남았습니다.</div>
			</div>
			<hr>
			
			<div class="d-flex">
				<div class="col-6">
					<div>박박박 생일</div>
					<div>2025년 2월 5일</div>
				</div>
				<div class="col-6 mt-3"><span class="text-danger ">127</span>일 남았습니다.</div>
			</div>
			<hr>
			
			<div class="d-flex">
				<div class="col-6">
					<div>김김김 생일</div>
					<div>2025년 2월 5일</div>
				</div>
				<div class="col-6 mt-3"><span class="text-danger ">127</span>일 남았습니다.</div>
			</div>
		</div>
		
		<div class="d-flex justify-content-center mt-3">
			<a href="/post/post_list_view"><img src="/static/image/pictures.png" class="mr-4" width="50"></a>
			<a href="#"><img src="/static/image/chat.png" class="mr-4" width="50"></a>
			<a href="/calendar/calendar_view"><img src="/static/image/calendar.png" height="50"></a>
		</div>
		
<!-- 왼쪽 Modal -->
<div class="modal" id="moreModalLeft">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<img src="${user.profileImagePath}" class="profile" id="userImage">
     	 <div class="mt-3">
	        <div class="ml-1">${couple.userId2}</div>
	        <div class="ml-1">19900101</div>
        </div>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
		
<!-- 오른쪽 Modal -->
<div class="modal" id="moreModalRight">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<img src="${user.profileImagePath}" class="profile" id="userImage">
     	 <div class="mt-3">
	        <div class="ml-1">${user.name}</div>
	        <div class="ml-1">${user.birth}</div>
        </div>
      </div>
      <div class="modal-footer">
       <a type="button" href="/user/profile_view" class="btn btn-outline-primary">프로필 편집</a>
      </div>
    </div>
  </div>
</div>

	</div>
</div>