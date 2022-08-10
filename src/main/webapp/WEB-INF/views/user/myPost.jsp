<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">   
    
    
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
		<div class="my-reser">
<section class="main-content">
	<div class="container">
		<hr size="1" style="width:900px;padding-left:130px">
			<c:if test="${count == 0}">
				<div class="result-display">표시할 상품이 없습니다.</div>
			</c:if>
		<c:if test="${count > 0}">	
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>게시상태</th>
					<th>숙소명</th>
					<th>주소</th>
					<th>게시날짜</th>
					<th>가격</th>					
					<th>중단/재시작</th>
					<th>제거</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="post" items="${list}">
				<tr>				
					<td>
						<div class="user-info">
							<div class="user-info__basic">
								<h5 class="mb-0 refont">${post.market_num}</h5>
							</div>
						</div>
					</td>					
					<td>	
						<c:choose>
						<c:when test="${post.onoff == 1}">
							<span class="active-circle bg-success"></span><b style="font-size:17px">예약중</b>
						</c:when>
						<c:when test="${post.onoff == 2}">
							<span class="active-circle bg-danger"></span><b style="font-size:17px">예약중단</b>
						</c:when>
						</c:choose>
					</td>
					<td>${post.market_title}</td>
					<td class="refont">${post.address1}${post.address2}${post.address3}</td>
					<td class="refont">${post.startdate} ~ ${post.enddate}</td>
					<td class="refont">${post.price}</td>
					<td class="refont">
					<c:if test="${post.onoff == 1}">
						<button class="btn btn-primary btn-sm refont-2"
							onclick="location.href='${pageContext.request.contextPath}/user/postCencel.do?market_num=${post.market_num}&onoff=${post.onoff}'">게시중단</button>
					</c:if>
					<c:if test="${post.onoff == 2}">
						<button class="btn btn-primary btn-sm refont-2"
							onclick="location.href='${pageContext.request.contextPath}/user/postCencel.do?market_num=${post.market_num}&onoff=${post.onoff}'">다시시작</button>
					</c:if>							
					</td>
					<td>
						<button class="btn btn-danger btn-sm refont-2"
							onclick="location.href='${pageContext.request.contextPath}/user/postDelete.do?market_num=${post.market_num}&onoff=${post.onoff}'">목록 삭제</button>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="align-center">${pagingHtml }</div>
		</c:if>
	</div>
</section>
		</div>
	</div>
</div>