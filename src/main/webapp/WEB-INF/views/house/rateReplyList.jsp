<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/reply.js"></script>
<!-- chart.js 차트 그리기 임포트 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>

<div class="main-content-outer2">
	<div class="main-content-inner">
		<div class="detail-content2">
			<div class="rate-list">
				<div class="user-rate-main">
				<div class="user-rate-info">
					<ul>
						<li>
						<c:if test="${rate.all_rate == 5}"><b>⭐⭐⭐⭐⭐</b></c:if>
						<c:if test="${rate.all_rate == 4}"><b>⭐⭐⭐⭐</b></c:if>
						<c:if test="${rate.all_rate == 3}"><b>⭐⭐⭐</b></c:if>
						<c:if test="${rate.all_rate == 2}"><b>⭐⭐</b></c:if>
						<c:if test="${rate.all_rate == 1}"><b>⭐</b></c:if>
						</li>
						<li>
						<li>
						<c:if test="${rate.all_rate == 5}"><b>최고에요!</b></c:if>
						<c:if test="${rate.all_rate == 4}"><b>좋아요!</b></c:if>
						<c:if test="${rate.all_rate == 3}"><b>보통이에요!</b></c:if>
						<c:if test="${rate.all_rate == 2}"><b>별로에요!</b></c:if>
						<c:if test="${rate.all_rate == 1}"><b>최악이에요!</b></c:if>
						</li>
						<li style="float:left; padding-left:30px;">
							<img src="${pageContext.request.contextPath}/user/ratePhotoView.do?user_num=${rate.user_num}" width="45px" height="45px" class="my-photo">
						</li>
						<li style="padding-right:20px;">
							<span style="font-size:19px;">${rate.user_name}</span>
						</li>
						<li>
							<span style="font-size:15px;">${rate.reg_date}</span>
						</li>
					</ul>
				</div>
				<div class="user-rate-content">
					<ul>
						<li class="rate-content-title"><b>"${rate.title}"</b></li>
						<li class="rate-content-content">${rate.content}</li>
					</ul>
				</div>		
			</div>
			</div>
		</div>
		<div style="width:300px;"><b style="font-size:20px;">0개의 댓글이 있습니다.</b></div>
			<!-- 댓글작성 시작 -->
			<div id="reply_div2">
				<form id="re_form">
					<input type="hidden" id="rate_num" name="rate_num" value="${param.rate_num}">
					<textarea rows="5" cols="80" name="content" id="content" class="rep-content"></textarea>
						<div id="re_first">
							<span class="letter-count">300/300</span>
						</div>
						<div id="re_second" class="align-right">
							<input type="submit" value="등록" class="gradation2" >
						</div>
				</form><br>
			</div>
			<!-- 댓글작성 끝 -->
			<!-- 댓글 목록 출력 -->
			<div id="output"></div>
			<div class="paging-button" style="display:none;">
				<input type="button" value="다음글 보기">
			</div>
			<div id="loading" style="display:none;">
				<img src="${pageContext.request.contextPath }/resources/images/ajax-loader.gif">
			</div>
			
	</div>
</div>