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
					<th>숙소명</th>
					<th>예약상태</th>
					<th>주소</th>
					<th>기간</th>
					<th>가격</th>
					<th>중단/재시작</th>
					<th>제거</th>
					<th>후기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reser" items="${list}">
				<tr>			
					<td>
						<div class="user-info">
							<div class="user-info__basic">
								<h5 class="mb-0 refont">${reser.market_title}</h5>
							</div>
						</div>
					</td>
					<td>	
						<c:choose>
						<c:when test="${reser.onoff == 1}">
							<span class="active-circle bg-success"></span><b style="font-size:17px">게시중</b>
						</c:when>
						<c:when test="${reser.onoff == 2}">
							<span class="active-circle bg-danger"></span><b style="font-size:17px">게시중단</b>
						</c:when>
						</c:choose>
					</td>
					<td class="refont">${reser.address1}${reser.address2}${reser.address3}</td>
					<td class="refont">${reser.startdate} ~ ${reser.enddate}</td>
					<td class="refont">${reser.price}</td>
					<td class="refont">
					<c:if test="${reser.onoff == 1}">
						<button class="btn btn-primary btn-sm refont-2"
							onclick="location.href='${pageContext.request.contextPath}/user/reservationCencel.do?date_num=${reser.date_num}&onoff=${reser.onoff}'">예약취소</button>
					</c:if>
					<c:if test="${reser.onoff == 2}">
						<button class="btn btn-primary btn-sm refont-2"
							onclick="location.href='${pageContext.request.contextPath}/user/reservationCencel.do?date_num=${reser.date_num}&onoff=${reser.onoff}'">다시시작</button>
					</c:if>							
					</td>
					<td>
						<button class="btn btn-danger btn-sm refont-2"
							onclick="location.href='${pageContext.request.contextPath}/user/reservationDelete.do?date_num=${reser.date_num}&onoff=${reser.onoff}'">목록 삭제</button>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/house/houseRating">후기 남기러 가기</a>
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