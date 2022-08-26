<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!-- 제이쿼리, css 임포트 -->   
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<!-- 부트스트랩 -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="main-outer">
	<div class="main-inner">
		<div class="my-title"><b>MY 정보</b></div>
		<div class="my-menu">
			<ul style="display: inline-block;">
				<li style="border-radius:12px 0px 0px 12px;"><p><a href="${pageContext.request.contextPath}/user/myPage.do">내 정보</a></p></li>
				<li><p><a href="${pageContext.request.contextPath}/user/myPost.do">내가 올린 방</a></p></li>
				<li><p><a href="${pageContext.request.contextPath}/user/myReservation.do">내가 예약한 방</a></p></li>
				<li><p><a href="${pageContext.request.contextPath}/user/ReservationOn.do">승인 대기중인 방</a></p></li>
				<li style="border-radius:0px 12px 12px 0px;"><p><a href="${pageContext.request.contextPath}/user/money.do">내 수익</a></p></li>								
			</ul>
		</div>
<!-- 시작 -->
<div class="my-reser">
	<section class="main-content">
		<div class="container">
			<hr size="1" style="width:900px;padding-left:30px">
			<c:if test="${count > 0}">	
			<table class="table">
				<thead>
					<tr>
						<th style="width:100px">예약자 회원번호</th>
						<th>숙소명</th>
						<th style="width:100px">예약상태</th>
						<th style="width:100px">예약자 이름</th>
						<th style="width:150px">기간</th>
						<th>가격</th>
						<th>승인/승인취소</th>
						<th style="width:100px">예약취소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="re" items="${list}">
					<tr>			
						<td>
							${re.user_num}
						</td>
						<td>
							<div class="user-info">
								<div class="user-info__basic">
									<h5 class="mb-0 refont">${re.market_title}</h5>
								</div>
							</div>
						</td>
						<td>	
							<span class="active-circle bg-danger"></span><b style="font-size:17px">예약<br>승인대기중</b>
						</td>
						<td class="refont">${re.user_name}</td>
						<td class="refont">${re.startdate} ~ <br>${re.enddate}</td>
						<td class="refont"><fmt:formatNumber value="${re.price}" pattern="#,###"/>₩</td>
						<td class="refont">

						<button class="btn btn-primary btn-sm refont-2"
								onclick="location.href='${pageContext.request.contextPath}/user/ReservationOnUpdate.do?date_num=${re.date_num}'">승인</button>						
						</td>
						<td>
							<button class="btn btn-danger btn-sm refont-2"
								onclick="location.href='${pageContext.request.contextPath}/user/ReservationOnCencel.do?date_num=${re.date_num}'">예약취소</button>
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
<!-- 끝 -->		
		
	</div>
</div>		