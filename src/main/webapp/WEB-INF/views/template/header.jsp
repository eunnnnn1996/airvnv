<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script>
	$(document).ready(function(){
		$(".login-btn").click(function(){
			$(".modal-bg").css({"display" : "block"})
		})
	});
</script>    
<!-- 상단 시작 -->
	<div class="main-title"><a href="${pageContext.request.contextPath}/main/main.do">제목</a></div>
	<div class="main-menu">
	    <c:if test="${!empty user_num && !empty user_photo}">
	    	<img src="${pageContext.request.contextPath}/user/photoView.do" 
	    	                        width="25" height="25" class="my-photo">
	    </c:if>
	    <c:if test="${!empty user_num && empty user_photo}">
	    	<img src="${pageContext.request.contextPath}/resources/images/face.png" 
	    	                        width="25" height="25" class="my-photo">
	    </c:if>
		<c:if test="${!empty user_num}">
			[<span>${user_id}</span>]
			<a href="${pageContext.request.contextPath}/user/logout.do">로그아웃</a>
		</c:if>
		<c:if test="${empty user_num}">
			<a href="${pageContext.request.contextPath}/user/signUp.do">회원가입</a>
			
			<a class="login-btn">로그인</a>
			
		</c:if>
		<c:if test="${!empty user_num && user_auth == 2}">
			<a href="${pageContext.request.contextPath}/user/myPage.do">MY페이지</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/main/main.do">집 내놓기</a>
	</div>
<!-- 상단 끝 -->