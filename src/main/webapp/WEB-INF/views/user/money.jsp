<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- lottie 애니메이션 임포트 -->
<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">

<div class="main-outer">
	<div class="main-inner">
		<div class="my-title"><b>MY 정보</b></div>
		<div class="my-menu">
			<ul style="display: inline-block;">
				<li><p><a href="${pageContext.request.contextPath}/user/myPage.do">내 정보</a></p></li>
				<li><p><a href="${pageContext.request.contextPath}/user/myPost.do">내가 올린 방</a></p></li>
				<li><p><a href="${pageContext.request.contextPath}/user/myReservation.do">내가 예약한 방</a></p></li>
				<li><p><a href="${pageContext.request.contextPath}/user/ReservationOn.do">승인 대기중인 방</a></p></li>
				<li><p><a href="${pageContext.request.contextPath}/user/money.do">내 수익</a></p></li>								
			</ul>
		</div>
		<div class="coin-img">
		<lottie-player src="${pageContext.request.contextPath}/resources/json/coin.json" 
				background="transparent" style="width: 300px; height: 225px;" speed="1" loop autoplay/>				
    	</div>
    	<div class="price-con">
    	<p>
    	<c:if test="${!empty price}">
    	<fmt:formatNumber value="${price}" pattern="#,###"/>₩
    	</c:if>
    	<c:if test="${empty price}">
    	<fmt:formatNumber value="${price}" pattern="#,###"/>수익 없음
    	</c:if>
    	</p>
    	</div>
	</div>
</div>