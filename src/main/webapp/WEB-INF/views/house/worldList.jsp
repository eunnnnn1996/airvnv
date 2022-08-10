<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 제이쿼리, css 임포트 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/allhouse.css">

<script>
$(function(){
	//드롭 다운 카테고리 눌렀을때 값 전송
	/* change는 마우스를 up했을때 바로 실행 */
	$("#country").change(function() { 
		$("#country-btn").click();
	});
});
</script>

<div class="main-content-outer">
	<div class="main-content-inner">
		<!-- 검색창 시작 -->
		<div class="selectbox-main">
			<ul>
				<li>
					<div class="selectbox">
						<form action="allHouse.do" id="house-sort-form" method="get">
							<!-- <label for="ex_select">방 유형 선택</label> -->
							<select name="market_type" id="market_type">
								<option value='' selected>방 유형 선택</option>
								<option value="0" <c:if test="${param.market_type == 0}">selected</c:if> >모든 방</option>
								<option value="1" <c:if test="${param.market_type == 1}">selected</c:if> >호텔</option>
								<option value="2" <c:if test="${param.market_type == 2}">selected</c:if>>펜션</option>
								<option value="3" <c:if test="${param.market_type == 3}">selected</c:if>>게스트하우스</option>
								<option value="4" <c:if test="${param.market_type == 4}">selected</c:if>>아파트</option>
								<option value="5" <c:if test="${param.market_type == 5}">selected</c:if>>기타</option>
							</select> 
							<select name="price" id="price">
								<option value='' selected>가격 선택 / 1박</option>
								<option value="0" <c:if test="${param.price == 0}">selected</c:if> >모든 가격</option>
								<option value="1"<c:if test="${param.price == 1}">selected</c:if>>3만원이하</option>
								<option value="2"<c:if test="${param.price == 2}">selected</c:if>>5만원이하</option>
								<option value="3"<c:if test="${param.price == 3}">selected</c:if>>10만원이하</option>
								<option value="4"<c:if test="${param.price == 4}">selected</c:if>>20만원이하</option>
								<option value="5"<c:if test="${param.price == 5}">selected</c:if>>30만원이하</option>
								<option value="6"<c:if test="${param.price == 6}">selected</c:if>>30만원이상</option>
								
							</select> 
							<select name="board_type" id="board_type">
								<option value='' selected>게시글 유형</option>
								<option value="1" <c:if test="${param.board_type == 1}">selected</c:if> >업로드 순</option>
								<option value="2" <c:if test="${param.board_type == 2}">selected</c:if> >조회수 순</option>
								<option value="3" <c:if test="${param.board_type == 3}">selected</c:if> >찜 순</option>
								<option value="4" <c:if test="${param.board_type == 4}">selected</c:if> >후기 많은 순</option>
							</select>
							<select name="day_type" id="day_type">
								<option value='' selected>장기예약</option>
								<option value="0" <c:if test="${param.day_type == 0}">selected</c:if> >모든 예약</option>
								<option value="1" <c:if test="${param.day_type == 1}">selected</c:if> >장기예약 가능</option>
							</select>
							<input type="hidden" value="${param.city}">
							<input type="submit" id="house-sort-form-btn" value="검색">
						</form>
					</div>
				</li>
			</ul>
		</div>
		<!-- 검색창 끝 -->
		<!-- 지역 카테고리 시작 -->
		<div class="city-category">
			<ul style="padding-left:30px; width:1200px;">
				<li style="clear: left;"><a href="${pageContext.request.contextPath}/house/allHouse.do">
						<div style="padding-left: 4px;">
							<img src="../resources/images/city/all.png" width="50px" height="50px">
						</div> <b class="fourword"> 전체보기 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?market_type=${param.market_type}&board_type=${param.board_type}&day_type=${param.day_type}&price=${param.price}&city=1">
						<div>
							<img src="../resources/images/city/seoul.png" width="50px" height="50px">
						</div> <b class="twoword"> 서울 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?market_type=${param.market_type}&board_type=${param.board_type}&day_type=${param.day_type}&price=${param.price}&city=2">
						<div>
							<img src="../resources/images/city/incheon.png" width="50px" height="50px">
						</div> <b class="twoword"> 인천 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?market_type=${param.market_type}&board_type=${param.board_type}&day_type=${param.day_type}&price=${param.price}&city=3">
						<div>
							<img src="../resources/images/city/daejeon.png" width="50px" height="50px">
						</div> <b class="twoword"> 대전 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?market_type=${param.market_type}&board_type=${param.board_type}&day_type=${param.day_type}&price=${param.price}&city=4">
						<div>
							<img src="../resources/images/city/gwangju.png" width="50px" height="50px">
						</div> <b class="twoword"> 광주 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?market_type=${param.market_type}&board_type=${param.board_type}&day_type=${param.day_type}&price=${param.price}&city=5">
						<div>
							<img src="../resources/images/city/ulsan.png" width="50px" height="50px">
						</div> <b class="twoword"> 울산 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?market_type=${param.market_type}&board_type=${param.board_type}&day_type=${param.day_type}&price=${param.price}&city=6">
						<div>
							<img src="../resources/images/city/daegu.png" width="50px" height="50px">
						</div> <b class="twoword"> 대구 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?market_type=${param.market_type}&board_type=${param.board_type}&day_type=${param.day_type}&price=${param.price}&city=7">
						<div>
							<img src="../resources/images/city/busan.png" width="50px" height="50px">
						</div> <b class="twoword"> 부산 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?market_type=${param.market_type}&board_type=${param.board_type}&day_type=${param.day_type}&price=${param.price}&city=8">
						<div>
							<img src="../resources/images/city/gyunggi.png" width="50px" height="50px">
						</div> <b class="threeword"> 경기도 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?market_type=${param.market_type}&board_type=${param.board_type}&day_type=${param.day_type}&price=${param.price}&city=9">
						<div>
							<img src="../resources/images/city/gangwon.png" width="50px" height="50px">
						</div> <b class="threeword"> 강원도 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?market_type=${param.market_type}&board_type=${param.board_type}&day_type=${param.day_type}&price=${param.price}&city=10">
						<div>
							<img src="../resources/images/city/choongchung.png" width="50px" height="50px">
						</div> <b class="threeword"> 충청도 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?market_type=${param.market_type}&board_type=${param.board_type}&day_type=${param.day_type}&price=${param.price}&city=11">
						<div>
							<img src="../resources/images/city/jeonra.png" width="50px" height="50px">
						</div> <b class="threeword"> 전라도 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?market_type=${param.market_type}&board_type=${param.board_type}&day_type=${param.day_type}&price=${param.price}&city=12">
						<div>
							<img src="../resources/images/city/gyeongsang.png" width="50px" height="50px">
						</div> <b class="threeword"> 경상도 </b>
				</a></li>
				<li>
				<a href="${pageContext.request.contextPath}/house/allHouse.do?market_type=${param.market_type}&board_type=${param.board_type}&day_type=${param.day_type}&price=${param.price}&city=13">
					<div>
						<img src="../resources/images/city/jeju.png" width="50px"
								height="50px">
					</div> <b class="threeword"> 제주도 </b>
				</a>
				</li>
				<li>
				<a href="${pageContext.request.contextPath}/house/worldList.do">
					<div>
						<img src="../resources/images/city/world.png" width="50px" height="50px">
					</div> <b class="twoword"> 해외 </b>
				</a>
				</li>
			</ul>
			<!-- 나라 카테고리 시작-->
			<form action="worldList.do" class="country-form" id="countryName" method="get">
				<select name="country" id="country">
					<option value='' selected>국가 선택</option>
					<option value="all" <c:if test="${param.country == 'all'}">selected</c:if>>모든 국가</option>
					<c:forEach var="category" items="${clist}">
					<option value='${category.category_name}' <c:if test="${param.country == category.category_name}">selected</c:if>>${category.category_name}</option>
					</c:forEach>
				</select>
					<input type="hidden" name="market_type" value="${param.market_type}">
					<input type="hidden" name="board_type" value="${param.board_type}">
					<input type="hidden" name="day_type" value="${param.day_type}">
					<input type="hidden" name="price" value="${param.price}"> 
				<input type="submit" id="country-btn" value="전송" style="display:none">
			</form>
			<!-- 나라 카테고리 끝 -->
		</div>
		<!-- 지역 카테고리 끝 -->
		<div class="list-wrap">
			<ul>
				<c:forEach var="house" items="${list}">
					<c:if test="${house.show == 1 && house.onoff == 1}">
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
										<%-- <c:forEach varStatus="status" var="i" begin="0" end="${fn:length(list)-1}">
					${likecount + status.index}
					</c:forEach> --%>
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
					</c:if>
					<c:if test="${house.show == 0}">게시물 없음</c:if>
				</c:forEach>
			</ul>
			<c:if test="${count > 0}">
			<div class="align-center">${pagingHtml }</div>
			</c:if>
		</div>
	</div>
</div>