<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- chart.js 차트 그리기 임포트 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<!-- 슬라이더 임포트 -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- ajax 페이지 이동 -->
<script>
function acyncMovePage(url){
	        // ajax option
	        var ajaxOption = {
	                url : url,
	                async : true,
	                type : "GET",
	                dataType : "html",
	                cache : false
	        };
	        
	        $.ajax(ajaxOption).done(function(data){
	            // Contents 영역 삭제
	            $('.rate-list').children().remove();
	            // Contents 영역 교체
	            $('.rate-list').html(data);
	        });
	    }
function acyncMovePageReply(url){
	        // ajax option
	        var ajaxOption = {
	                url : url,
	                async : true,
	                type : "GET",
	                dataType : "html",
	                cache : false
	        };
	        
	        $.ajax(ajaxOption).done(function(data){
	            // Contents 영역 삭제
	            $('.rate-list').children().remove();
				$('.replyinsert_btn').children().remove();
	            // Contents 영역 교체
	            $('.rate-list').html(data);
	        });
	    }	
</script>
<!-- 헤더 이미지 시작  -->
<div class="main-image-outer">    
    <div class="main-image-inner">
		<div class="left-image">
			<div class="img-one image-one-so">
				<a class="top-image" href="#">${list0}</a>
				<c:if test="${empty list0}">
					<img src="../resources/images/noimage.png">
				</c:if>
			</div>	
		</div>
		
		<div class="center-image">
			<div class="img-two image-two-so">
				<a class="top-image" href="#">${list1}</a>
				<c:if test="${empty list1}">
					<img src="../resources/images/noimage.png">
				</c:if>
			</div>
			<div class="img-three image-two-so">
				<a class="top-image" href="#">${list2}</a>
				<c:if test="${empty list2}">
					<img src="../resources/images/noimage.png">
				</c:if>
			</div>
		</div>
		
		<div class="right-image">
			<div class="img-two image-three-so">
				<a class="top-image" href="#">${list3}</a>
				<c:if test="${empty list3}">
					<img src="../resources/images/noimage.png">
				</c:if>
			</div>
			<div class="img-three image-three-so" style="position:relative;">
				<a class="top-image" href="#">${list4}</a>
				<c:if test="${empty list4}">
					<img src="../resources/images/noimage.png">
				</c:if>
				
				<div class="allimage">
					<button id="btn2" class="inva-btn-2">전체보기</button>
				</div>
			</div>
		</div>				
	</div>
</div>
<!-- 헤더 이미지 끝  -->

<div class="main-content-outer">
	<div class="main-content-inner">
		<div class="detail-content2">
		<span style="font-size:30px;"><b><a onclick="acyncMovePage('${pageContext.request.contextPath}/house/houseDetail.do')">호스텔 정보</a></b></span>
  	<div class="rate-area">
  		<ul>
  			<li>
				<div class="rate-avg"><b id="allrate">
				<c:if test="${empty allrate}">0.0</c:if>
				<fmt:formatNumber value="${allrate}" pattern=".0"/></b>
				</div>
				<div class="rate-word"><b>우수</b></div>
				<div class="rate-people">이용후기 38 건의 이용후기</div>
			</li>
			<li>
				<ul class="rate-sort-ul">
					<li class="rate-sort-li">
						<div class="rate-full"><b id="accuracy_rate">
						<c:if test="${empty accuracy_rate}">0.0</c:if>
						<fmt:formatNumber value="${accuracy_rate}" pattern=".0"/></b>
						</div>
						<div class="rate-word2" style="padding-left:10px;"><b>정확성</b></div>
					</li>
					<li class="rate-sort-li">
						<div class="rate-full"><b id="clean_rate">
						<c:if test="${empty clean_rate}">0.0</c:if>
						<fmt:formatNumber value="${clean_rate}" pattern=".0"/></b>
						</div>
						<div class="rate-word2" style="padding-left:20px;"><b>청결</b></div>
					</li>
					<li class="rate-sort-li">
						<div class="rate-full"><b id="ease_rate">
						<c:if test="${empty ease_rate}">0.0</c:if>
						<fmt:formatNumber value="${ease_rate}" pattern=".0"/></b>
						</div>
						<div class="rate-word2" style="padding-left:10px;"><b>편의성</b></div>
					</li>
					<li class="rate-sort-li">
						<div class="rate-full"><b id="position_rate">
						<c:if test="${empty position_rate}">0.0</c:if>
						<fmt:formatNumber value="${position_rate}" pattern=".0"/></b>
						</div>
						<div class="rate-word2" style="padding-left:20px;"><b>위치</b></div>
					</li>
					<li class="rate-sort-li">
						<div class="rate-full"><b id="communication_rate">
						<c:if test="${empty communication_rate}">0.0</c:if>
						<fmt:formatNumber value="${communication_rate}" pattern=".0"/></b>
						</div>
						<div class="rate-word2" style="padding-left:20px;"><b>소통</b></div>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	
	<%-- <canvas id="myChart" width="400" height="400"></canvas> --%>
	
	<!-- <hr style="clear:both;margin-top:130px;width:630px;color:#f7f7f7;float:left;"> -->
	<div class="replyinsert_btn" style="padding-top:100px;width:300px;">
		<%-- <button class="insert-btn" onclick="location.href='${pageContext.request.contextPath}/house/rateInsert.do'">후기작성</button> --%>
		<button class="insert-btn" onclick="acyncMovePage('${pageContext.request.contextPath}/house/rateInsert.do')">후기작성</button>
	</div>
	<!-- 후기출력 -->
	<c:if test="${count == 0}">
		<div class="result-display">표시할 상품이 없습니다.</div>
	</c:if>
	<div class="rate-list">
		<c:if test="${count > 0}">	
		<c:forEach var="rate" items="${list}">
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
							<!-- <img src="../resources/images/slide/firstmain.png" width="45px" height="45px" style="border-radius:50%;"> -->
							<img src="${pageContext.request.contextPath}/user/ratePhotoView.do?user_num=${rate.user_num}" width="45px" height="45px" class="my-photo">
	    	                 <%-- ${rate.photo_name} --%>
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
						<li style="padding-top:20px;padding-right:10px;">
							<button class="reply-list-btn"
									onclick="acyncMovePageReply('${pageContext.request.contextPath}/house/rateReplyList.do?rate_num='+${rate.rate_num})">답글보기</button>
							<!-- <button style="float:right;">답글보기</button> -->
						</li>
					</ul>
				</div>		
			</div>
		</c:forEach>
		</c:if>
		<div id="pagenum">${pagingHtml}</div>
	</div>
</div>
		<!-- 우측 그래프 차트 -->
		<div class="sub-menu">
			<canvas id="myChart" width="200" height="200"></canvas>
		</div>
		<!-- 우측 그래프 차트 -->
		<!-- 사진 전체보기 모달 시작 -->
		<div id="modal2" class="modal_Wrap2">
			<div class="modal_Content2">
				<span class="close2">&times;</span>
				<div class="swiper">
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper" style="text-align: center;">
						<!-- Slides -->
						<c:forEach var="imglist" items="${imglist}" varStatus="status">
							<div class="swiper-slide">${imglist}</div>
						</c:forEach>
					</div>
					<!-- If we need pagination -->
					<div class="swiper-pagination"></div>
					<!-- If we need navigation buttons -->
					<div class="swiper-button-prev" style="width: 85px"></div>
					<div class="swiper-button-next" style="width: 85px"></div>
					<!-- If we need scrollbar -->
					<div class="swiper-scrollbar"></div>
				</div>
			</div>
		</div>
		<!-- 사진 전체보기 모달 끝 -->
	</div>
</div>

<script>
	/* 사진 전체보기 모달 */
	const modal2 = document.getElementById('modal2');
	const button2 = document.getElementById('btn2');
	const span2 = document.querySelector('.close2');

	button2.onclick = function() {
	    modal2.style.display = 'block';
	}
	span2.onclick = function() {
	    modal2.style.display = 'none';
	}
	window.onclick = function(event) {
	    if(event.target == modal2) {
	        modal2.style.display = 'none';
	    }
	}  
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
	});
</script>
<script>
const accuracy_rate = document.getElementById('accuracy_rate').innerText;
const clean_rate = document.getElementById('clean_rate').innerText;
const ease_rate = document.getElementById('ease_rate').innerText;
const position_rate = document.getElementById('position_rate').innerText;
const communication_rate = document.getElementById('communication_rate').innerText;

//차트를 그럴 영역을 dom요소로 가져온다.
var chartArea = document.getElementById('myChart').getContext('2d');
// 차트를 생성한다. 
var myChart = new Chart(chartArea, {
    // ①차트의 종류(String)
    type: 'line',
    // ②차트의 데이터(Object)
    data: {
        // ③x축에 들어갈 이름들(Array)
        labels: ['정확성', '청결', '편의성', '위치', '소통'],
        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
        datasets: [{
            // ⑤dataset의 이름(String)
            label: '방 점수',
            // ⑥dataset값(Array)
            data: [accuracy_rate, clean_rate, ease_rate, position_rate, communication_rate],
            // ⑦dataset의 배경색(rgba값을 String으로 표현)
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            // ⑧dataset의 선 색(rgba값을 String으로 표현)
            borderColor: 'rgba(255, 99, 132, 1)',
            // ⑨dataset의 선 두께(Number)
            borderWidth: 2
        }]
    },
    // ⑩차트의 설정(Object)
    options: {
        // ⑪축에 관한 설정(Object)
        scales: {
            // ⑫y축에 대한 설정(Object)
            y: {
                // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
                suggestedMax: 7,
                beginAtZero: true
            }
        } 
    }
});
</script>