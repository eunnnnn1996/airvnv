<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- chart.js 차트 그리기 임포트 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/rateChart.js"></script> --%>

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
	            $('.outer-div').children().remove();
	            // Contents 영역 교체
	            $('.outer-div').html(data);
	        });
	    }
</script>

<div class='outer-div'>
  <div class='inner-div'>
  	<%-- <span style="font-size:30px;"><b><a onclick="acyncMovePage('${pageContext.request.contextPath}/house/houseDetail.do')">호스텔 정보</a></b></span> --%>
  	<div class="rate-area">
  		<ul>
  			<li>
				<div class="rate-avg"><h3><fmt:formatNumber value="${allrate}" pattern=".0"/></h3></div>
				<div class="rate-word"><b>우수</b></div>
				<div class="rate-people">이용후기 38 건의 이용후기</div>
			</li>
			<li>
				<ul class="rate-sort-ul">
					<li class="rate-sort-li">
						<div class="rate-full"><h3><fmt:formatNumber value="${accuracy_rate}" pattern=".0"/></h3></div>
						<div class="rate-word2" style="padding-left:10px;"><b>정확성</b></div>
					</li>
					<li class="rate-sort-li">
						<div class="rate-full"><h3><fmt:formatNumber value="${clean_rate}" pattern=".0"/></h3></div>
						<div class="rate-word2" style="padding-left:20px;"><b>청결</b></div>
					</li>
					<li class="rate-sort-li">
						<div class="rate-full"><h3><fmt:formatNumber value="${ease_rate}" pattern=".0"/></h3></div>
						<div class="rate-word2" style="padding-left:10px;"><b>편의성</b></div>
					</li>
					<li class="rate-sort-li">
						<div class="rate-full"><h3><fmt:formatNumber value="${position_rate}" pattern=".0"/></h3></div>
						<div class="rate-word2" style="padding-left:20px;"><b>위치</b></div>
					</li>
					<li class="rate-sort-li">
						<div class="rate-full"><h3><fmt:formatNumber value="${communication_rate}" pattern=".0"/></h3></div>
						<div class="rate-word2" style="padding-left:20px;"><b>소통</b></div>
					</li>
				</ul>
			</li>
		</ul>
	</div>
	
	<canvas id="myChart" width="400" height="400"></canvas>
	
	<hr style="clear:both;margin-top:130px;width:630px;color:#f7f7f7">
	<div style="padding-top:10px;">
		<%-- <button class="insert-btn" onclick="location.href='${pageContext.request.contextPath}/house/rateInsert.do'">후기작성</button> --%>
		<button class="insert-btn" onclick="acyncMovePage('${pageContext.request.contextPath}/house/rateInsert.do')">후기작성</button>
	</div>
	<!-- 후기출력 -->
	<c:if test="${count == 0}">
		<div class="result-display">표시할 상품이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">	
	<c:forEach var="rate" items="${list}">
		<div class="user-rate-main">
			<div class="user-rate-info">
				
					<ul>
						<li><b>${rate.all_rate}</b></li>
						<li><b>"최고"</b></li>
						<li><img src="../resources/images/slide/firstmain.png" width="20px" height="20px">닉네임</li>
					</ul>
				
			</div>
			<div class="user-rate-content">
				<ul>
					<li class="rate-content-title"><b>"title"</b></li>
					<li class="rate-content-content">"content"</li>
				</ul>
			</div>		
		</div>
	</c:forEach>
	</c:if>
	<div id="pagenum">${pagingHtml}</div>
  </div>
</div>

<script>
//차트를 그럴 영역을 dom요소로 가져온다.
var chartArea = document.getElementById('myChart').getContext('2d');
// 차트를 생성한다. 
var myChart = new Chart(chartArea, {
    // ①차트의 종류(String)
    type: 'bar',
    // ②차트의 데이터(Object)
    data: {
        // ③x축에 들어갈 이름들(Array)
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
        datasets: [{
            // ⑤dataset의 이름(String)
            label: '# of Votes',
            // ⑥dataset값(Array)
            data: [12, 19, 3, 5, 2, 3],
            // ⑦dataset의 배경색(rgba값을 String으로 표현)
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            // ⑧dataset의 선 색(rgba값을 String으로 표현)
            borderColor: 'rgba(255, 99, 132, 1)',
            // ⑨dataset의 선 두께(Number)
            borderWidth: 1
        }]
    },
    // ⑩차트의 설정(Object)
    options: {
        // ⑪축에 관한 설정(Object)
        scales: {
            // ⑫y축에 대한 설정(Object)
            y: {
                // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
                beginAtZero: true
            }
        }
    }
});
</script>