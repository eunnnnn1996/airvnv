<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 개인스타일 임포트 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<script>
	$(document).ready(function(){
		$(".login-btn").click(function(){
			$(".modal-bg").css({"display" : "block"})
		})
		/* 내정보 드롭다운 */
		$(".sub").hide();
		$(".nickname").click(function(){
			$('.sub').toggle();
		});
	});
</script>    
<!-- 상단 시작 -->
<div class="main-main">
	<div class="main-title">
		<a href="${pageContext.request.contextPath}/main/main.do">
			<img src="${pageContext.request.contextPath}/resources/images/logo.png" height="50px">
		</a>
	</div>
	<div class="main-menu">
		<c:if test="${!empty user_num}">
		</c:if>
		<c:if test="${!empty user_num && user_auth == 2}">
			<a href="${pageContext.request.contextPath}/house/allHouse.do">전체보기</a>
		</c:if>
		<c:if test="${!empty user_num && user_auth == 3}">
			<a href="${pageContext.request.contextPath}/house/allHouse.do">전체보기</a>
			<a href="${pageContext.request.contextPath}/user/stats.do">통계/회원관리</a>
		</c:if>
		<c:if test="${empty user_num}">
			<a href="${pageContext.request.contextPath}/house/allHouse.do">전체보기</a>
			<a href="${pageContext.request.contextPath}/user/signUp.do">회원가입</a>
			<a class="login-btn">로그인</a>
			
		</c:if>
		<c:if test="${!empty user_num && !empty user_photo}">
			<span style="width:20px;height:60px;">
	    	<img src="${pageContext.request.contextPath}/user/photoView.do" 
	    	                        width="30" height="30" class="my-photo" style="display:inline-block; vertical-align:middle;">
	    	</span>
	    </c:if>
	    <c:if test="${!empty user_num && empty user_photo}">
	    	<span style="width:20px;height:60px;">
	    	<img src="${pageContext.request.contextPath}/resources/images/face.png" 
	    	                        width="30" height="30" class="my-photo"  style="display:inline-block; vertical-align:middle;">
			</span>	    	                        
	    </c:if>
		<c:if test="${!empty user_num && user_auth == 2}">
			<!-- 드롭다운 시작 -->
			<span class="nickname">${user_name}</span>님
				<div style="float:right;padding-right:50%">
					<ul class="sub" style="width:180px;">
						<li><a href="${pageContext.request.contextPath}/house/houseInsert.do">방 내놓기</a></li>
						<li><a href="${pageContext.request.contextPath}/user/myPost.do">내 글 보기</a></li>
						<li><a href="${pageContext.request.contextPath}/user/likeBoard.do">좋아요 누른 방</a></li>
						<li><a href="${pageContext.request.contextPath}/user/myPage.do">설정</a></li>
					</ul>
				</div>
			<a href="${pageContext.request.contextPath}/user/logout.do">로그아웃</a>
			<!-- 드롭다운 끝 -->			
		</c:if>
		<c:if test="${!empty user_num && user_auth == 3}">
			<!-- 드롭다운 시작 -->
			<span class="nickname">${user_name}</span>님
				<div style="float:right;padding-right:50%;">
					<ul class="sub" style="width:180px;">
						<li><a href="${pageContext.request.contextPath}/house/houseInsert.do">방 내놓기</a></li>
						<li><a href="${pageContext.request.contextPath}/user/myPost.do">내 글 보기</a></li>
						<li><a href="${pageContext.request.contextPath}/user/likeBoard.do">좋아요 누른 방</a></li>
						<li><a href="${pageContext.request.contextPath}/user/myPage.do">설정</a></li>
					</ul>
				</div>
			<a href="${pageContext.request.contextPath}/user/logout.do">로그아웃</a>
			<!-- 드롭다운 끝 -->			
		</c:if>
	</div>
</div>	
<!-- 상단 끝 -->