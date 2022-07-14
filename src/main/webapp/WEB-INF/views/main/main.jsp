<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 부트스트랩 아이콘 임포트 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 슬라이더 임포트 -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
 <!-- 제이쿼리, css 임포트 -->   
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<!-- 한 페이지 스크롤 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fullpage.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.fullpage.js"></script>

<script>
$(document).ready(function() {
	$('#fullpage').fullpage({
		sectionsColor: ['#fff', '#fff', '#fff', 'whitesmoke', '#ccddff']
	});
});


</script>

<div id="fullpage" style="width:1850px;left:-5px;">

	<!-- 첫번째 섹션 -->
	<div class="section active" id="section0">
		<!-- <img class="boat-img" src="../resources/images/slide/boat.gif" width="300px" height="300px"> -->
		<img src="../resources/images/slide/firstmain.png" width="100%" height="100%">
	</div>
	
	<!-- 두번째 섹션 -->
	<div class="section" id="section2">
	<c:if test="${count == 0}">
	<div class="result-display">표시할 상품이 없습니다.</div>
	</c:if>
	<div class="list-wrap">
	<c:if test="${count > 0}">	
		<ul>
		<c:forEach var="house" items="${list}">
			<li class="item">
				
				<div class="image">
				<a class="title-image" href="${pageContext.request.contextPath}/house/houseDetail.do?market_num=${house.market_num}">
						<c:if test="${empty house.photo_name}">							
							<img src="../resources/images/noimage.png" style="width:100%; height:230px;">		
						</c:if>
						<c:if test="${!empty house.photo_name}">
							<img src="imageView.do?market_num=${house.market_num}" style="width:100%; height:230px;">
						</c:if>
				</a>														
				</div>						
				<div class="cont">
					<strong>qwe</strong>
					<p>내용이 들어갑니다</p>
					<a class="direct-detail" href="#">바로가기</a>
				</div>	
			</li>
		</c:forEach>
		</ul>
	</c:if>
	<div id="pagenum">${pagingHtml}</div>
	</div>	
	</div>
	
	
	<!-- 세번째 섹션 -->
	<div class="section" id="section1">
	    <div class="slide "><img src="../resources/images/slide/newuser.png" width="100%" height="100%"></div>
	    <div class="slide active"><img src="../resources/images/slide/sale.png" width="100%" height="100%"></div>
	    <div class="slide"><img src="../resources/images/slide/jeju.png" width="100%" height="100%"></div>
	    <div class="slide"><img src="../resources/images/slide/coupon.png" width="100%" height="100%"></div>
	</div>	
	
	<!-- 네번째 섹션  -->
	<div class="section" id="section3">
		<div class="swiper">
	  <!-- Additional required wrapper -->
	  <div class="swiper-wrapper">
	    <!-- Slides -->
	    <div class="swiper-slide"><img src="../resources/images/slide/newuser.png" width="100%" height="100%"></div>
	    <div class="swiper-slide"><img src="../resources/images/slide/sale.png" width="100%" height="100%"></div>
	    <div class="swiper-slide"><img src="../resources/images/slide/jeju.png" width="100%" height="100%"></div>
	    <div class="swiper-slide"><img src="../resources/images/slide/coupon.png" width="100%" height="100%"></div>
	    ...
	  </div>
	  <!-- If we need pagination -->
	  <div class="swiper-pagination"></div>
	
	  <!-- If we need navigation buttons -->
	  <div class="swiper-button-prev" style="width:85px"></div>
	  <div class="swiper-button-next" style="width:85px"></div>
	
	  <!-- If we need scrollbar -->
	  <div class="swiper-scrollbar"></div>
	</div>
	</div>
</div>

<!-- 메인 시작 -->
	<!-- <div class="search">
  	<input class="search-input" type="text" placeholder="검색어 입력">
	  <img class="search-img" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
	</div> -->
<%-- <div class="main-outer">
	<div class="main-inner">
</div>
	</div>	

	 --%>
<div class="modal-bg">
	<!-- 모달창 -->
	<div class="login-modal">
		<div class="modal-header">
			<img class="exit-img" src="${pageContext.request.contextPath}/resources/images/close.png">
		</div>
		<!-- 로그인 폼 -->
		<div class="login-form">
			<div class="login-title"><img src="../resources/images/logo.png" style="width:260px;height:80px"></div>
			<b class="login-content">로그인</b>
			<form action="${pageContext.request.contextPath}/user/login.do" method="post">
				<input name="user_id" id="user_id" placeholder="아이디"><br>
				<input name="passwd" id="passwd" placeholder="비밀번호"><br>
				<input class="login-btn-main" type="submit" value="로그인" style="background-color:#0092db">
			</form>
			
			<div style="padding-left:40px;">
			<p style="font-size:18px;color:#0092db;padding-bottom:5px;">비밀번호를 잊어버리셨나요?</p>
			<p style="font-size:18px;color:#0092db;padding-bottom:15px;">계정이 없으신가요?<b>회원가입</b></p>
			</div>
			
			<!--  -->
			<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=d879879e0e9c44ce1893dc77fa44d21c&redirect_uri=REDIRECT_URI&response_type=code">
			<!-- REST_API키 및 REDIRECT_URI는 본인걸로 수정하세요 -->
			<!-- 본인걸로 수정 시 띄어쓰기 절대 하지 마세요. 오류납니다. -->
				<img src="../resources/images/kakaobanner.png" style="width:300px;height:45px">
			</a>
			<!--  -->
		</div>
	</div>
</div>
<!-- 모달백그라운드 끝  -->
<!-- 메인 끝 -->
<script>
	$(document).ready(function(){
		$(".exit-img").click(function(){
			$(".modal-bg").css({"display" : "none"})
		})
	});
</script>    
<script>
const swiper = new Swiper('.swiper', {
	  loop: true,

	  // If we need pagination
	  pagination: {
	    el: '.swiper-pagination',
	  },

	  // Navigation arrows
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },
	  autoplay: { 
		  delay: 9000, 
		},
	});
</script>
