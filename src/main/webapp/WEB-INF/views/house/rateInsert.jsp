<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
 <!-- 제이쿼리, css 임포트 -->   
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review.css">

<script>
$(function(){
	const urlParams = new URL(location.href).searchParams;	
	const market_num = urlParams.get('market_num');

	$("#market_num").val(market_num);
});
</script>

<div class='outer-div'>
  <div class='inner-div'>
	  <div class="rate-title"><h3>해당 숙소의 후기를 쓰세요. ${market_num}<br></h3></div>
	  <div class="rate-content">14일 동안 후기를 작성할 수  있습니다. 후기 작성기간 동안에는 호스트도<br>회원님에 대한 후기를 작성해야 회원님의
	  피드백을 읽을 수 있습니다.<br>후기 작성기간이 종료되면, 회원님의 피드백이 공개됩니다.<br>
	  호스트는 카테고리별 평점은 보지 못하고 전체 평균만 알 수 있습니다.<br><br>
	  </div>
	  <h3 class="rate-think">숙박이 어땠나요?<br><br></h3>
	  
	  <div>
	  	<form:form id="rateForm" modelAttribute="rateVO" action="rateInsert.do">
	  		<input type="hidden" id="market_num" name="market_num" value="">
	  		
	  		<h4 style="font-size:28px;padding-left:5px;">전체적 만족도</h4>
			<div class="star-rating space-x-2 mx-auto">
				<input type="radio" id="5-stars1" name="all_rate" value="5"/>
				<label for="5-stars1" class="star pr-4">★</label>
				<input type="radio" id="4-stars2" name="all_rate" value="4"/>
				<label for="4-stars2" class="star">★</label>
				<input type="radio" id="3-stars3" name="all_rate" value="3"/>
				<label for="3-stars3" class="star">★</label>
				<input type="radio" id="2-stars4" name="all_rate" value="2"/>
				<label for="2-stars4" class="star">★</label>
				<input type="radio" id="1-star5" name="all_rate" value="1"/>
				<label for="1-star5" class="star">★</label>
			</div>
			
			<h4 style="font-size:28px;padding-left:5px;padding-top:25px;">정확성<br></h4>
			<p style="font-size:18px;padding-left:5px;color:gray">숙소 사진과 설명이 실제 숙소와 얼마나 일치하나요?</p>
			<div class="star-rating space-x-2 mx-auto">
				<input type="radio" id="5-starsAA" name="accuracy_rate" value="5"/>
				<label for="5-starsAA" class="star pr-4">★</label>
				<input type="radio" id="4-starsBB" name="accuracy_rate" value="4"/>
				<label for="4-starsBB" class="star">★</label>
				<input type="radio" id="3-starsCC" name="accuracy_rate" value="3"/>
				<label for="3-starsCC" class="star">★</label>
				<input type="radio" id="2-starsDD" name="accuracy_rate" value="2"/>
				<label for="2-starsDD" class="star">★</label>
				<input type="radio" id="1-starEE" name="accuracy_rate" value="1"/>
				<label for="1-starEE" class="star">★</label>
			</div>
			
			<h4 style="font-size:28px;padding-left:5px;padding-top:25px;">청결도<br></h4>
			<p style="font-size:18px;padding-left:5px;color:gray">숙소 사진과 설명이 실제 숙소와 얼마나 일치하나요?</p>
			<div class="star-rating space-x-2 mx-auto">
				<input type="radio" id="5-starsFF" name="clean_rate" value="5"/>
				<label for="5-starsFF" class="star pr-4">★</label>
				<input type="radio" id="4-starsGG" name="clean_rate" value="4"/>
				<label for="4-starsGG" class="star">★</label>
				<input type="radio" id="3-starsHH" name="clean_rate" value="3"/>
				<label for="3-starsHH" class="star">★</label>
				<input type="radio" id="2-starsII" name="clean_rate" value="2"/>
				<label for="2-starsII" class="star">★</label>
				<input type="radio" id="1-starJJ" name="clean_rate" value="1"/>
				<label for="1-starJJ" class="star">★</label>
			</div>
			
			<h4 style="font-size:28px;padding-left:5px;padding-top:25px;">편의성<br></h4>
			<p style="font-size:18px;padding-left:5px;color:gray">호스트가 숙소 설명에 약속된 모든 것들을 제공하였나요?</p>
			<div class="star-rating space-x-2 mx-auto">
				<input type="radio" id="5-starsA" name="ease_rate" value="5"/>
				<label for="5-starsA" class="star pr-4">★</label>
				<input type="radio" id="4-starsB" name="ease_rate" value="4"/>
				<label for="4-starsB" class="star">★</label>
				<input type="radio" id="3-starsC" name="ease_rate" value="3"/>
				<label for="3-starsC" class="star">★</label>
				<input type="radio" id="2-starsD" name="ease_rate" value="2"/>
				<label for="2-starsD" class="star">★</label>
				<input type="radio" id="1-starE" name="ease_rate" value="1"/>
				<label for="1-starE" class="star">★</label>
			</div>
			
			<h4 style="font-size:28px;padding-left:5px;padding-top:25px;">위치<br></h4>
			<p style="font-size:18px;padding-left:5px;color:gray">숙소 지역은 만족하셨나요? 안전성과 편리성을 고려해 주세요.</p>
			<div class="star-rating space-x-2 mx-auto">
				<input type="radio" id="5-starsF" name="position_rate" value="5"/>
				<label for="5-starsF" class="star pr-4">★</label>
				<input type="radio" id="4-starsG" name="position_rate" value="4"/>
				<label for="4-starsG" class="star">★</label>
				<input type="radio" id="3-starsH" name="position_rate" value="3"/>
				<label for="3-starsH" class="star">★</label>
				<input type="radio" id="2-starsI" name="position_rate" value="2"/>
				<label for="2-starsI" class="star">★</label>
				<input type="radio" id="1-starJ" name="position_rate" value="1"/>
				<label for="1-starJ" class="star">★</label>
			</div>
			
			<h4 style="font-size:28px;padding-left:5px;padding-top:25px;">소통<br></h4>
			<p style="font-size:18px;padding-left:5px;color:gray">숙박기간 전, 혹은 도중에 호스트와 연락이 잘되고,<br>문의한 사항에 대하여 호스트가 빨리 응답해 왔습니까?</p>
			<div class="star-rating space-x-2 mx-auto">
				<input type="radio" id="5-starsK" name="communication_rate" value="5"/>
				<label for="5-starsK" class="star pr-4">★</label>
				<input type="radio" id="4-starsL" name="communication_rate" value="4"/>
				<label for="4-starsL" class="star">★</label>
				<input type="radio" id="3-starsM" name="communication_rate" value="3"/>
				<label for="3-starsM" class="star">★</label>
				<input type="radio" id="2-starsN" name="communication_rate" value="2"/>
				<label for="2-starsN" class="star">★</label>
				<input type="radio" id="1-starO" name="communication_rate" value="1"/>
				<label for="1-starO" class="star">★</label>
			</div>
			
			<h2 style="padding-left:10px;padding-top:40px;padding-bottom:30px;font-size:30px;">짧은 평가를 남겨주세요!</h2>
			<div><form:input class="title" path="title" placeholder="한줄평을 입력해주세요!"/></div>
			<div><form:textarea class="content" path="content" placeholder="100자 이내로 작성해주세요!!"/></div>
			<form:button class="rate-btn">등록</form:button>
	  	</form:form>	
	  </div>
  </div>
</div>