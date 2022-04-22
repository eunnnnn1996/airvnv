<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!-- 부트스트랩 아이콘 임포트 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script>
	$(document).ready(function(){
		$(".exit-img").click(function(){
			$(".modal-bg").css({"display" : "none"})
		})
	});
</script>    
<!-- 메인 시작 -->
<div class="page-main">
	<div class="modal-bg">
	<!-- 모달창 -->
	<div class="login-modal">
		<div class="modal-header">
			<img class="exit-img" src="${pageContext.request.contextPath}/resources/images/cross.png">
		</div>
		<!-- 로그인 폼 -->
		
		<div class="login-form">
			<h3 class="login-title">로그인</h3>
			<b class="login-content">살아방 서비스 이용을 위해 로그인해주세요.</b>
			<form action="${pageContext.request.contextPath}/user/login.do" method="post">
				<input name="user_id" id="user_id" placeholder="아이디"><br>
				<input name="passwd" id="passwd" placeholder="비밀번호"><br>
				<input type="submit" value="확인">
			</form>
		</div>
	</div>
</div>
<!-- 모달백그라운드 끝  -->
</div>
<!-- 메인 끝 -->