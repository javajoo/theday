<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-center">
	<div class="home-box">
		<div class=" d-flex justify-content-between">
			<c:forEach var="coupleList1" items="${coupleList1}"> 
				<div>
					<c:if test="${empty coupleList1.profileImagePath}">
						<a href="#" data-toggle="modal" data-target="#moreModalLeft"><img src="/static/image/user.png" class="profile" id="userImage"></a>
					</c:if>
					<c:if test="${!empty coupleList1.profileImagePath}">
			 			<a href="#" data-toggle="modal" data-target="#moreModalLeft" ><img src="${coupleList1.profileImagePath}" class="profile" id="userImage"></a>
					</c:if>
					<div class="text-center mt-2"><b>${coupleList1.loginId}</b></div>
				</div>
				
				<div class="d-flex align-items-center">
					<div>
						<div><h6>처음 만난 날로부터</h6></div>
						<div class="text-center"><div id="dayCount" data-date-id="${user.date}"></div></div>
					</div>
				</div>
			</c:forEach> 
			
			<div>
				<c:if test="${empty user.profileImagePath}">
					<a href="#" data-toggle="modal" data-target="#moreModalRight"><img src="/static/image/user.png" class="profile" id="userImage"></a>
				</c:if>
				
				<c:if test="${!empty user.profileImagePath}">
			 		<a href="#" data-toggle="modal" data-target="#moreModalRight" ><img src="${user.profileImagePath}" class="profile" id="userImage"></a>
				</c:if>
				
				<div class="text-center mt-2"><b>${user.name}</b></div>
				</div>
			</div>
	
		<div class="day-box">
			<div class="d-flex">
				<div class="col-3 ml-5">
					<div>100일</div>
					<div></div>
				</div>
				<div class="col-9" id="dayCount100"></div>
			</div>
			<hr>
			
			<div class="d-flex">
				<div class="col-3 ml-5">
					<div>200일</div>
					<div></div>
				</div>
				<div class="col-9" id="dayCount200"></div>
			</div>
			<hr>
			
			<div class="d-flex">
				<div class="col-3 ml-5">
					<div>300일</div>
					<div></div>
				</div>
				<div class="col-9" id="dayCount300"></div>
			</div>
			<hr>
			
			<div class="d-flex">
				<div class="col-3 ml-5">
					<div>365일</div>
					<div></div>
				</div>
				<div class="col-9" id="dayCount365"></div>
			</div>
			<hr>
			<c:forEach var="coupleList1" items="${coupleList1}">
				<div class="d-flex">
					<div class="col-4 ml-5">
						<div>${coupleList1.name}의 생일</div>
						<div>
							<fmt:parseDate value="${coupleList1.birth}" pattern="yyyy-mm-dd" var="date"/>
							<fmt:formatDate value="${date}" pattern=" m월 d일" />
						</div>
					</div>
					<div class="col-8 mt-3"><span class="text-danger ">127</span>일 남았습니다.</div>
				</div>
				<hr>
			 </c:forEach>
			<div class="d-flex">
				<div class="col-4 ml-5">
					<div>${user.name}의 생일</div>
					<div>
						<fmt:parseDate value="${user.birth}" var="date" pattern="yyyy-mm-dd" />
						<fmt:formatDate value="${date}" pattern="m월 d일" />
					</div>
				</div>
				<div class="col-8 mt-3"><span class="text-danger ">127</span>일 남았습니다.</div>
			</div>
		</div>
		
		<div class="d-flex justify-content-center mt-3">
			<a href="/timeline/timeline_list_view"><img src="/static/image/pictures.png" class="mr-4" width="50"></a>
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
      <c:forEach var="coupleList1" items="${coupleList1}">
	      <div class="modal-body">
	      		<c:if test="${empty coupleList1.profileImagePath}"> 
					<img src="/static/image/user.png" class="profile" id="userImage">
				</c:if>
				<c:if test="${!empty coupleList1.profileImagePath}">
			 		<img src="${coupleList1.profileImagePath}" class="profile" id="userImage">
				</c:if> 
	     	 <div class="mt-3">
		        <div class="ml-1">${coupleList1.name}</div>
		        <div class="ml-1">
		        	<fmt:parseDate value="${coupleList1.birth}" var="date" pattern="yyyy-mm-dd" />
		        	<fmt:formatDate value="${date}" pattern="m월 d일" />
		        </div>
	        </div>
	      </div>
      </c:forEach>
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
            <c:if test="${empty user.profileImagePath}">
				<img src="/static/image/user.png" class="profile" id="userImage">
			</c:if>
			<c:if test="${!empty user.profileImagePath}">
		 		<img src="${user.profileImagePath}" class="profile" id="userImage">
			</c:if>
      	<%-- <img src="${user.profileImagePath}" class="profile" id="userImage"> --%>
     	 <div class="mt-3">
	        <div class="ml-1">${user.name}</div>
	        <div class="ml-1">
	        	<fmt:parseDate value="${user.birth}" var="date" pattern="yyyy-mm-dd" />
	        	<fmt:formatDate value="${date}" pattern="m월 d일" />
	        </div>
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

	<script>
      
    	//var dday = $('#ddCounter').data('date-id').getTime();
    	var dday = new Date("april 31,2022").getTime(); //디데이
    	var now = new Date(); //현재 날짜 가져오기
    	var distance = dday - now;
    	var d = Math.floor(distance / (1000 * 60 * 60 * 24));
    	$('#dayCount').html('<span class="text-danger">' + d +'</span>일째');
    	$('#dayCount100').html('D-day까지 ' +'<span class="text-danger">' + (d + 100) +'</span>일 남았습니다.');
    	$('#dayCount200').html('D-day까지 ' +'<span class="text-danger">' + (d + 200) +'</span>일 남았습니다.');
    	$('#dayCount300').html('D-day까지 ' +'<span class="text-danger">' + (d + 300) +'</span>일 남았습니다.');
    	$('#dayCount365').html('D-day까지 ' +'<span class="text-danger">' + (d + 365) +'</span>일 남았습니다.');

        
  </script>