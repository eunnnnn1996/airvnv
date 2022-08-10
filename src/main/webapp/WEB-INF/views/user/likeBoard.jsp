<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
 <!-- 제이쿼리, css 임포트 -->   
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">

<div class="main-outer">
	<div class="main-inner">
		<div class="my-title"><b>좋아요 누른 방</b></div>
		<!-- 리스트 시작 -->
		<div class="list-wrap" style="padding-top:180px;">
			<ul>
				<c:forEach var="house" items="${list}">
						<li class="item">
							<div class="image">
								<a class="title-image"
									href="${pageContext.request.contextPath}/house/houseDetail.do?market_num=${house.market_num}">
									<c:if test="${empty house.photo_name}">
										<img src="../resources/images/noimage.png"
											style="width: 100%; height: 230px;">
									</c:if> <c:if test="${!empty house.photo_name}">
										<img
											src="${pageContext.request.contextPath}/main/imageView.do?market_num=${house.market_num}"
											style="width: 100%; height: 230px;">
									</c:if>
								</a>
							</div>
							<div class="cont">
								<strong><fmt:formatNumber value="${house.otherpay}"
										pattern="#,###" />₩</strong>
								<p>${house.market_title}</p>
								<a class="direct-detail"
									href="${pageContext.request.contextPath}/house/houseDetail.do?market_num=${house.market_num}">바로가기</a>
								<div class="hit-detail">
									<p style="font-size: 16px; padding-top: 5px;">
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
											fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
										  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
										</svg>
										${house.hit}
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
											fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
										  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
										</svg>

										${house.likecount}
										<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
											fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
										  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
										</svg>
										${house.ratecount}
									</p>
								</div>
							</div>
						</li>
				</c:forEach>
			</ul>
			<c:if test="${count > 0}">
			<div class="align-center">${pagingHtml }</div>
			</c:if>
		</div>
	</div>
</div>			