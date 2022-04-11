<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<div class="d-flex justify-content-center">
		<div class="home-box">
		<c:if test="${couple.state eq '성공'}">
			<div class=" d-flex justify-content-between">
					<div>
						<c:if test="${empty couple.u1.profileImagePath}">
							<a href="#" data-toggle="modal" data-target="#moreModalLeft"><img src="/static/image/user.png" class="profile" id="userImage"></a>
						</c:if>
						<c:if test="${!empty couple.u1.profileImagePath}">
				 			<a href="#" data-toggle="modal" data-target="#moreModalLeft" ><img src="${couple.u1.profileImagePath}" class="profile" id="userImage"></a>
						</c:if>
						<div class="text-center mt-2"><b>${couple.u1.name}</b></div>
					</div>
					
					<div class="d-flex align-items-center">
						
							<div>
								<div><b>우리 만난 지</b></div>
								<div class="text-center"><div id="dday" data-date-id="${couple.u1.date}" ></div></div>
							</div>
					</div>
				<div>
					<c:if test="${empty couple.u2.profileImagePath}">
						<a href="#" data-toggle="modal" data-target="#moreModalRight"><img src="/static/image/user.png" class="profile" id="userImage"></a>
					</c:if>
					
					<c:if test="${!empty couple.u2.profileImagePath}">
				 		<a href="#" data-toggle="modal" data-target="#moreModalRight" ><img src="${couple.u2.profileImagePath}" class="profile" id="userImage"></a>
					</c:if>
					<div class="text-center mt-2"><b>${couple.u2.name}</b></div>
				</div>
			</div>
		
			<div class="day-box">
				<div class="d-flex">
					<div class="col-3 ml-5">
						<div class="mt-2"><h5><span class="text-danger">100</span>일</h5></div>
					</div>
					
					<div class="col-9">
						<div id="ddate100" class="text-center"></div>
						<div id="dday100"  class="text-center"></div>
					</div>
				</div>
				<hr>
				
				<div class="d-flex">
					<div class="col-3 ml-5">
						<div class="mt-2"><h5><span class="text-danger">200</span>일</h5></div>
					</div>
					
					<div class="col-9">
						<div id="ddate200" class="text-center"></div>
						<div id="dday200" class="text-center"></div>
					</div>
				</div>
				<hr>
				
				<div class="d-flex">
					<div class="col-3 ml-5">
						<div class="mt-2"><h5><span class="text-danger">300</span>일</h5></div>
					</div>
					
					<div class="col-9">
						<div id="ddate300" class="text-center"></div>
						<div id="dday300" class="text-center"></div>
					</div>
				</div>
				<hr>
				
				<div class="d-flex">
					<div class="col-3 ml-5 d-flex">
						<div class="mt-2"><h5><span class="text-danger">1</span>주년</h5></div>	
					</div>
					
					<div class="col-9">
						<div id="ddate365" class="text-center"></div>
						<div id="dday365" class="text-center"></div>
					</div>
				</div>
				<hr>
				
				 <div class="d-flex">
					<div class="col-3 ml-5 d-flex">
						<div class="mt-2" class="text-center"><h5><span class="text-danger">2</span>주년</h5></div>	
					</div>
					
					<div class="col-9">
						<div id="ddate730" class="text-center"></div>
						<div id="dday730" class="text-center"></div>
					</div>
				</div>
				<hr>
				 
				 <div class="d-flex">
					<div class="col-3 ml-5 d-flex">
						<div class="mt-2"><h5><span class="text-danger">3</span>주년</h5></div>	
					</div>
					
					<div class="col-9">
						<div id="ddate1095" class="text-center"></div>
						<div id="dday1095" class="text-center"></div>
					</div>
				</div> 
			</div>
			<div class="d-flex justify-content-center mt-3">
				<a href="${pageContext.request.contextPath}/timeline/timeline_list_view"><img src="/static/image/pictures.png" class="mr-4" width="50"></a>
				<a href="${pageContext.request.contextPath}/chat/chat_view"><img src="/static/image/chat.png" class="mr-4" width="50"></a>
				<a href="${pageContext.request.contextPath}/calendar/calendar_view"><img src="/static/image/calendar.png" height="50"></a>
			</div>
		</c:if>
			
		<c:if test="${couple.state ne '성공'}">
			<div class="un-couple">
				<div class="text-center">
	     			신청일자 : <fmt:formatDate value="${couple.createdAt}" pattern="yyyy년 MM월 dd일" /> 
				</div>
				<div class="text-center">상대방의 수락을 기다리고 있어요ෆ</div>
			</div>
		</c:if>
		
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
		      		<c:if test="${empty couple.u1.profileImagePath}"> 
						<img src="/static/image/user.png" class="profile" id="userImage">
					</c:if>
					<c:if test="${!empty couple.u1.profileImagePath}">
				 		<img src="${couple.u1.profileImagePath}" class="profile" id="userImage">
					</c:if> 
		     	 <div class="mt-3">
			        <div class="ml-1">${couple.u1.name}</div>
			        <div class="ml-1">
			        	<fmt:parseDate value="${couple.u1.birth}" var="date" pattern="yyyy-mm-dd" />
			        	<fmt:formatDate value="${date}" pattern="yyyy년 mm월 dd일" />
			        </div>
		        </div>
		      </div>  
		      <c:if test="${couple.u1.id == userId}">
		      	<div class="modal-footer">
		      		 <a type="button" href="${pageContext.request.contextPath}/user/profile_view" class="btn btn-outline-primary">프로필 편집</a>
		      	</div>
		      </c:if>
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
			            <c:if test="${empty couple.u2.profileImagePath}">
							<img src="/static/image/user.png" class="profile" id="userImage">
						</c:if>
						<c:if test="${!empty couple.u2.profileImagePath}">
					 		<img src="${couple.u2.profileImagePath}" class="profile" id="userImage">
						</c:if>
			     	 <div class="mt-3">
				        <div class="ml-1">${couple.u2.name}</div>
				        <div class="ml-1">
				        	<fmt:parseDate value="${couple.u2.birth}" var="date" pattern="yyyy-mm-dd" />
				        	<fmt:formatDate value="${date}" pattern="yyyy년 mm월 dd일" />
				        </div>
			        </div>
			      </div>
			          <c:if test="${couple.u2.id == userId}">
					      <div class="modal-footer">
					       <a type="button" href="${pageContext.request.contextPath}/user/profile_view" class="btn btn-outline-primary">프로필 편집</a>
					      </div>
			          </c:if>
			    </div>
			  </div>
			</div>
		</div>
	</div>

	<script>
	var dday = new Date('${couple.u1.date}'); //디데이	
	
		diffDay(100);
		diffDay(200);
		diffDay(300);
		diffDay(365);
		diffDay(730);
		diffDay(1095);

		function diffDay(day) {
			var dday = new Date('${couple.u1.date}');
			var now = new Date(); //현재 날짜 가져오기
			var distance =  dday - now;
			var d = Math.floor(distance / (1000 * 60 * 60 * 24));
		
			document.querySelector('#dday').innerText = 'ෆ' + -d +'일째ෆ';
			document.querySelector('#dday' + day).innerText = 'D-day까지 '  + (d + day) +'일 남음';
		
			if ((d + day)  == 0)
				document.querySelector('#dday' + day).innerText = '오늘은 디데이ෆ';
				else if ((d + day)  > 0)
					document.querySelector('#dday' + day).innerText = 'D-day까지 '  + (d + day) +'일 남음';
				else if ((d + day)  < 0)
					document.querySelector('#dday' + day).innerText =   (-(d + day)) +'일 지남';
			}
	
		calcDate(100);
		calcDate(200);
		calcDate(300);
		calcDate(365);
		calcDate(730);
		calcDate(1095);
		
		function calcDate(days) {
	    	var future = new Date(dday)
	    	future.setDate(future.getDate() +  days);
	    	var someday = new Date(future);
	    	var year = someday.getFullYear();
	    	var month = someday.getMonth()+1; // 0~11 이라 +1
	    	var date = someday.getDate();
	    	document.querySelector('#ddate' + days).innerText = year + '년' + month + '월' + date + '일';
	    	}
  </script>