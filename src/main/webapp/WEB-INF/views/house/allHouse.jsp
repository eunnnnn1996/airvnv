<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 제이쿼리, css 임포트 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/allhouse.css">
<script>
	/* 셀렉트 박스 js */
	$(document).ready(function() {
		var selectTarget = $('.selectbox select');

		selectTarget.on('blur', function() {
			$(this).parent().removeClass('focus');
		});
		selectTarget.change(function() {
			var select_name = $(this).children('option:selected').text();

			$(this).siblings('label').text(select_name);
		});
		//드롭 다운 카테고리 눌렀을때 값 전송
		$("#market_type").change(function() { /* change는 마우스를 up했을때 바로 실행 */
			$("#house-sort-form-btn").click();
		});
		$("#price").change(function() {
			$("#house-price-form-btn").click();
		});
	});
</script>
<script>
$(function(){
	const url = $(location).attr('href');
	const search = new URL(url).searchParams;
	const type = search.get('market_type');
	
	$('#house-sort-form-btn').click(function(){ //좋아요를 클릭했을때 실행되는 ajax
		$.ajax({
			url:'allHouse.do',
			type:'post',
			data:{type:type},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
					if(data.result=='logout'){
		               alert('로그인 후 누르세요');
		            }else if(data.result=='success'){ //추천하트 표시
		            	displayFav(data);
		            }
		            else{
		               alert('등록시 오류 발생!');
		            }
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
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
							<label for="ex_select">방 유형 선택</label>
							<select name="market_type" id="market_type">
								<option selected>방 유형 선택</option>
								<option value="1">호텔</option>
								<option value="2">펜션</option>
								<option value="3">게스트하우스</option>
								<option value="4">아파트</option>
								<option value="5">기타</option>
							</select> <input type="submit" id="house-sort-form-btn"
								style="display: none">
						</form>
					</div>
				</li>
				<li>
					<div class="selectbox">
						<form action="allHouse.do" id="house-price-form" method="get">
							<label for="ex_select">가격 선택 / 1박</label> <select name="price"
								id="price">
								<option selected>가격 선택 / 1박</option>
								<option>3만원이하</option>
								<option>5만원이하</option>
								<option>10만원이하</option>
								<option>20만원이하</option>
								<option>30만원이하</option>
								<option>30만원이상</option>
							</select> <input type="submit" id="house-price-form-btn"
								style="display: none">
						</form>
					</div>
				</li>
				<li>
					<div class="selectbox">
						<label for="ex_select">게시글 유형</label> <select id="ex_select">
							<option selected>게시글 유형</option>
							<option>조회수 순</option>
							<option>찜 순</option>
							<option>후기 많은 순</option>
						</select>
					</div>
				</li>
				<li>
					<div class="selectbox">
						<label for="ex_select">장기예약</label> <select id="ex_select">
							<option selected>장기예약</option>
							<option>장기예약 가능</option>
						</select>
					</div>
				</li>
			</ul>
		</div>
		<!-- 검색창 끝 -->
		<!-- 지역 카테고리 시작 -->
		<div class="city-category">
			<ul>
				<li style="clear: left;"><a href="${pageContext.request.contextPath}/house/allHouse.do">
						<div style="padding-left: 4px;">
							<img src="../resources/images/city/all.png" width="50px" height="50px">
						</div> <b class="fourword"> 전체보기 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?city=1">
						<div>
							<img src="../resources/images/city/seoul.png" width="50px" height="50px">
						</div> <b class="twoword"> 서울 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?city=2">
						<div>
							<img src="../resources/images/city/incheon.png" width="50px" height="50px">
						</div> <b class="twoword"> 인천 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?city=3">
						<div>
							<img src="../resources/images/city/daejeon.png" width="50px" height="50px">
						</div> <b class="twoword"> 대전 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?city=4">
						<div>
							<img src="../resources/images/city/gwangju.png" width="50px" height="50px">
						</div> <b class="twoword"> 광주 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?city=5">
						<div>
							<img src="../resources/images/city/ulsan.png" width="50px" height="50px">
						</div> <b class="twoword"> 울산 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?city=6">
						<div>
							<img src="../resources/images/city/daegu.png" width="50px" height="50px">
						</div> <b class="twoword"> 대구 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?city=7">
						<div>
							<img src="../resources/images/city/busan.png" width="50px" height="50px">
						</div> <b class="twoword"> 부산 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?city=8">
						<div>
							<img src="../resources/images/city/gyunggi.png" width="50px" height="50px">
						</div> <b class="threeword"> 경기도 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?city=9">
						<div>
							<img src="../resources/images/city/gangwon.png" width="50px" height="50px">
						</div> <b class="threeword"> 강원도 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?city=10">
						<div>
							<img src="../resources/images/city/choongchung.png" width="50px" height="50px">
						</div> <b class="threeword"> 충청도 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?city=11">
						<div>
							<img src="../resources/images/city/jeonra.png" width="50px" height="50px">
						</div> <b class="threeword"> 전라도 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?city=12">
						<div>
							<img src="../resources/images/city/gyeongsang.png" width="50px" height="50px">
						</div> <b class="threeword"> 경상도 </b>
				</a></li>
				<li><a href="${pageContext.request.contextPath}/house/allHouse.do?city=13">
						<div>
							<img src="../resources/images/city/jeju.png" width="50px"
								height="50px">
						</div> <b class="threeword"> 제주도 </b>
				</a></li>
			</ul>
		</div>
		<!-- 지역 카테고리 끝 -->
		<div class="list-wrap">
			<ul>
				<c:forEach var="house" items="${list}">
					<c:if test="${house.show == 1}">
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
			<div class="align-center">${pagingHtml }</div>
		</div>
	</div>
</div>