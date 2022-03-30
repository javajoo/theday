<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-center">
	<div class="home-box">
		<div class=" d-flex justify-content-between">
			<div>
				<c:if test="${empty user.profileImagePath}">
					<a href="#" data-toggle="modal" data-target="#moreModalLeft"><img src="/static/image/user.png" class="profile" id="userImage"></a>
				</c:if>
				<c:if test="${!empty user.profileImagePath}">
		 			<a href="#" data-toggle="modal" data-target="#moreModalLeft" ><img src="${user.profileImagePath}" class="profile" id="userImage"></a>
				</c:if>
				<div class="text-center mt-2"><b>${coupleList.name}</b></div>
			</div>
			
			<div class="d-flex align-items-center">
				<div>
					<div><h6>처음 만난 날로부터</h6></div>
					<div class="text-center"><h4>1일째</h4></div>
				</div>
			</div>
			
			<div>
			<c:if test="${empty user.profileImagePath}">
				<a href="#" data-toggle="modal" data-target="#moreModalRight"><img src="/static/image/user.png" class="profile" id="userImage"></a>
			</c:if>
			<c:if test="${!empty user.profileImagePath}">
		 		<a href="#" data-toggle="modal" data-target="#moreModalRight" ><img src="${user.profileImagePath}" class="profile" id="userImage"></a>
			</c:if>
			<div class="text-center mt-2"><b>${user.name}</b></div>
			</div>
			<%-- <div>
				<a href="#" data-toggle="modal" data-target="#moreModalRight"><img src="${user.profileImagePath}" class="profile" id="userImage"></a>
				<div class="text-center mt-2"><b>${user.name}</b></div>
			</div> --%>
		</div>
	
		<div class="day-box">
			<div class="d-flex">
				<div class="col-6">
					<div>100일</div>
					<div></div>
				</div>
				<div class="col-6 mt-3"><span class="text-danger ">127</span>일 남았습니다.</div>
			</div>
			<hr>
			
			<div class="d-flex">
				<div class="col-6">
					<div>200일</div>
					<div></div>
				</div>
				<div class="col-6 mt-3"><span class="text-danger ">127</span>일 남았습니다.</div>
			</div>
			<hr>
			
			<div class="d-flex">
				<div class="col-6">
					<div>300일</div>
					<div></div>
				</div>
				<div class="col-6 mt-3"><span class="text-danger ">127</span>일 남았습니다.</div>
			</div>
			<hr>
			
			<div class="d-flex">
				<div class="col-6">
					<div>300일</div>
					<div></div>
				</div>
				<div class="col-6 mt-3"><span class="text-danger ">127</span>일 남았습니다.</div>
			</div>
			<hr>
			
			<div class="d-flex">
				<div class="col-6">
					<div>${coupleList.name}의 생일</div>
					<div>
						<fmt:parseDate value="${coupleList.birth}" pattern="yyyy-mm-dd" var="date"/>
						<fmt:formatDate value="${date}" pattern=" m월 d일" />
					</div>
				</div>
				<div class="col-6 mt-3"><span class="text-danger ">127</span>일 남았습니다.</div>
			</div>
			<hr>
			
			<div class="d-flex">
				<div class="col-6">
					<div>${user.name}의 생일</div>
					<div>
						<fmt:parseDate value="${user.birth}" var="date" pattern="yyyy-mm-dd" />
						<fmt:formatDate value="${date}" pattern="m월 d일" />
					</div>
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
      		<c:if test="${empty user.profileImagePath}">
				<img src="/static/image/user.png" class="profile" id="userImage">
			</c:if>
			<c:if test="${!empty user.profileImagePath}">
		 		<img src="${user.profileImagePath}" class="profile" id="userImage">
			</c:if>
      	<%-- <img src="${user.profileImagePath}" class="profile" id="userImage"> --%>
     	 <div class="mt-3">
	        <div class="ml-1">${coupleList.name}</div>
	        <div class="ml-1">
	        	<fmt:parseDate value="${coupleList.birth}" var="date" pattern="yyyy-mm-dd" />
	        	<fmt:formatDate value="${date}" pattern="m월 d일" />
	        </div>
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
	today = new Date()      
	xday = new Date("March 22, 2022")
	xday.setYear = today.getYear;    
	daysAfter = (today.getTime() - xday.getTime()) / (1000*60*60*24);
	daysAfter = Math.round(daysAfter);
	document.write("<center>처음 만난 날로부터 <font color=red>"+daysAfter+" </font>일 되었습니다</center>");
	document.write("<center>처음 만난 날로부터 <font color=red>"+(daysAfter+100)+" </font>일 되었습니다</center>");
	document.write("<center>처음 만난 날로부터 <font color=red>"+(daysAfter+200)+" </font>일 되었습니다</center>");
	document.write("<center>처음 만난 날로부터 <font color=red>"+(daysAfter+300)+" </font>일 되었습니다</center>");
	document.write("<center>처음 만난 날로부터 <font color=red>"+(daysAfter+100)+" </font>일 되었습니다</center>");
</script>