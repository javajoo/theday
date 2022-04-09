<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="d-flex justify-content-center pt-3 ">
	<div class="logo display-4 font-weight-bold text-white text-center p-2">THE DAY</div>
</div>

<div class="d-flex justify-content-end">
	<c:if test="${not empty user}">
		<div class="text-center mr-3"><b>${user.name}님 </b></div>
		<div><a href="${pageContext.request.contextPath}/user/sign_out" class="font-weight-bold text-primary">로그아웃</a></div>
	</c:if>
</div>