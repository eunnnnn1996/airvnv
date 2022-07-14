<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">
<!-- 아임포트 임포트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 카카오맵 임포트 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3dccf85e0bda66300f299b635dec74c&libraries=services"></script>
<!-- ckeditor 임포트 -->
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
<script>
$(function(){
	var cal = {
			closeText : "닫기",
			prevText : "이전달",
			nextText : "다음달",
			currentText : "오늘",
			changeMonth: true, // 월을 바꿀 수 있는 셀렉트 박스
			changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스
			monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월",	"9월", "10월", "11월", "12월" ],
			dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
			dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			weekHeader : "주",
			dateFormat : "yy-mm-dd",
			firstDay : 0,
			minDate: 0,
			isRTL : false,
			showMonthAfterYear : true, // 연,월,일 순으로
			yearSuffix : '',
			showOn: 'both', // 텍스트와 버튼을 함께 보여준다
			buttonImage:'https://www.shareicon.net/data/16x16/2016/08/13/808501_calendar_512x512.png', //날짜 버튼 이미지
			buttonImageOnly: true,
			
			showButtonPanel: true,
			
			dateFormat:"yy-mm-dd",
	};

     $("#startdate").datepicker(cal);
     $("#enddate").datepicker(cal);
     

     $('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin-left':'5px'});  //아이콘(icon) 위치	
     $('img.ui-datepicker-trigger').attr('align', 'absmiddle');


	var status; //noFav or yesFav
	function selectData(market_num){ //77라인 초기값 세팅
	   $.ajax({
	      type:'post',
	      data:{market_num:market_num}, //초기값 세팅에서 매개변수로 받아서 el 안씀
	      url:'getFav.do', //LikecountAction
	      dataType:'json',
	      cache:false,
	      timeout:30000,
	      success:function(data){
	         if(data.result=='success'){
	            displayFav(data);
	         }else{
	            alert('좋아요 읽기 오류');
	         }
	      },
	      error:function(){
	         alert('네트워크 오류');
	      }
	   });
	}
	$('#output_fav').click(function(){ //좋아요를 클릭했을때 실행되는 ajax
		$.ajax({
			url:'like.do',
			type:'post',
			data:{market_num:${house.market_num}},
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
	//좋아요 표시
	   function displayFav(data){
	      status = data.status;
	      var count = data.count;
	      var output;
	      if(status=='noFav'){
	         output = '../resources/images/emptyheart.png';
	      }else{
	         output = '../resources/images/heart.png';
	      }         
	      //문서 객체에 추가
	      $('#output_fav').attr('src',output); //id가 output_fav인 태그 src에 output 저장
	      $('#output_fcount').text(count); //id가 output_fcount인 태그 text에 count(좋아요 총 개수)저장
	   }
	
	   selectData(${house.market_num}); //초기값 세팅
	   
 //캘린더 구현
//캘린더 한글화
  $.datepicker.setDefaults({
         dateFormat: 'yymmdd',
         prevText: '이전 달',
         nextText: '다음 달',
         monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
         monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
         dayNames: ['일', '월', '화', '수', '목', '금', '토'],
         dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
         showMonthAfterYear: true,
         yearSuffix: '년'
     });  
  $("#checkIn").datepicker({
  	 minDate: 0,
  	 onSelect: function(selected) {
  		 $("#checkOut").datepicker("option","minDate", selected)
  	 	}
  	 });
  $("#checkOut").datepicker({
  	 onSelect: function(selected) {
  		$("#checkIn").datepicker("option","maxDate", selected)
  	 }
  });   
 });
 
//결제 코드
function iamport(){
	
	const email = "1";
	const on_price = "1";
	const id = "1";
	const phone = "1";
	const address1 = "1";
	const address2 = "1";
	const on_name = "1";
	
	const user_num = "1";
	
	console.log(user_num);
	
	if(user_num == ""){
		alert('로그인 후 구매 가능합니다.')
	}else if(user_num != null){
		//가맹점 식별코드
		IMP.init('imp62760166');
		IMP.request_pay({
		    pg : 'kcp',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : on_name , //결제창에서 보여질 이름
		    amount : on_price, //실제 결제되는 가격, 최소금액 500원 이상 , 500이하시 결제 오류
		    buyer_email : email,
		    buyer_name : id,
		    buyer_tel : phone,
		    buyer_addr : address1+address2
		    /* buyer_postcode : '123-456' */
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        document.getElementById('paymentData_btn').submit();
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	
}
}
</script>
<script>
function call()
{
	var price = "${house.otherpay}"
	var sdd = document.getElementById("startdate").value;
	var edd = document.getElementById("enddate").value;
	var ar1 = sdd.split('-');
    var ar2 = edd.split('-');
    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
    var dif = da2 - da1;
    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
    var cMonth = cDay * 30;// 월 만듬
    var cYear = cMonth * 12; // 년 만듬
 if(sdd && edd){
	/* document.getElementById('days').value = parseInt(dif/cDay) */
	document.getElementById("data").innerHTML=parseInt((dif/cDay)*price)
	if((dif/cDay)*price >= 0){
	document.paymentData_btn.sum_price.value = (dif/cDay)*price; /* 총액 controll로 넘기는 코드 */
	}else if((dif/cDay)*price < 0){
		alert('날짜를 다시 선택하세요!');
		document.getElementById("enddate").value ='';
	}
 }
}
</script>
<!-- ajax 페이지 이동
<script>
 
    function acyncMovePage(url){
        // ajax option
        var ajaxOption = {
                url : url,
                async : true,
                type : "POST",
                dataType : "html",
                cache : false
        };
        
        $.ajax(ajaxOption).done(function(data){
            // Contents 영역 삭제
            $('.detail-content').children().remove();
            $('.detail-content').remove();
            // Contents 영역 교체
            $('.detail-content2').html(data);
        });
    }
</script> -->
<!-- 실험 -->

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
					<button>전체보기</button>
				</div>
			</div>
		</div>				
	</div>
</div>

<div class="main-content-outer">
	<div class="main-content-inner">
		<div class="detail-content2">
		<span style="font-size:30px;"><b>호스텔 정보</b></span>
		<span style="font-size:30px;">
		<b> | 
			<%-- <a onclick="acyncMovePage('${pageContext.request.contextPath}/house/rateMain.do?market_num=${house.market_num}')">후기</a> --%>
			<a href="${pageContext.request.contextPath}/house/rateMain.do?market_num=${house.market_num}">후기</a>
		</b>
		</span>
			<div class="detail-item">
				<ul>
					<li>
						<div class="item_type">
						<span>가격</span>
						</div>
						<div class="item-content"><span>${house.otherpay}원 <b style="font-size:18px">/ 박</b></span></div>
					</li>
					<li>
						<div class="item_type">방종류</div>
						<div class="item-content">
						<span>
						<c:if test="${house.trade_type == 1}">호텔</c:if>
						<c:if test="${house.trade_type == 2}">펜션</c:if>
						<c:if test="${house.trade_type == 3}">게스트하우스</c:if>
						<c:if test="${house.trade_type == 4}">아파트</c:if>
						<c:if test="${house.trade_type == 5}">방 종류 없음</c:if>
						</span>	
						</div>
					</li>
					<li>
						<div class="item_type">장기예약</div>				
						<div class="item-content">
						<span>
						<c:if test="${house.trade_short == 1}">가능</c:if>
						<c:if test="${house.trade_short == 2}">불가능</c:if>
						</span>
						</div>
					</li>
					<li>
						<div class="item_type">호스팅 날짜</div>
						<div class="item-content"><span>${house.reg_date}</span></div>
					</li>
					
				</ul>
			</div>
		</div>	
		
		<div class="sub-menu">
			<div>
				<ul>
					<li>
						<div class="side-info-num"><b>매물번호 ${house.market_num}</b></div>
						<div class="like">
							<!-- 찜 누르기 -->
							<img id="output_fav" src="../resources/images/emptyheart.png" width="25px">
							<!-- <span id="output_fcount" class="margin_right_10"></span> -->
							<!-- 찜 누르기 -->
						</div>
					</li>
					<li>
						<div class="side-price">
						<b class="sd-font">
						<c:if test="${house.trade_type == 1}">호텔</c:if>
						<c:if test="${house.trade_type == 2}">펜션</c:if>
						<c:if test="${house.trade_type == 3}">게스트하우스</c:if>
						<c:if test="${house.trade_type == 4}">아파트</c:if>
						<c:if test="${house.trade_type == 5}">방 종류 없음</c:if>						 
						${house.otherpay}원</b>
						<span style="padding-left:10px;color:#b1b1b1;">*하루기준</span>
						</div>
					</li>					
					<li>
						<div style="color:gray;padding-left:20px;">이 방을 살펴본 이용자 :
						<span id="output_fcount" class="margin_right_10"></span>명
						</div>
					</li>
					<li>
						<div class="host-address"><strong>호스팅 위치</strong><br><span>${house.address1}<br> ${house.address2} ${house.address3}</span></div>
					</li>
					<li>
						<div class="host-address"><strong>호스트 연락처</strong><br><span>${user.phone}</span></div>
					</li>
				</ul>
			</div>
				<div class="inva-btn">
					<button id="btn" class="inva-btn-1"><b>예약하기</b></button>
				</div>
				
				<c:if test="${user_num == user.user_num}">
					<div class="update-menu">
						<input type="button" value="수정"
									onclick="location.href='houseModify.do?market_num=${house.market_num}'">
						<input type="button" value="삭제"
									onclick="location.href='houseDelete.do?market_num=${house.market_num}'">
					</div>	
				</c:if>
			</div>			
	</div>
	<div class="main-content-inner2">
		<div class="detail-content">
		<span style="font-size:30px;"><b>상세 정보</b></span>
			<div class="detail-item">
				<ul>
					<li>
						<div class="item_type"><b style="font-size:19px;">옵션</b></div>
					</li>
					<li>
						<div class="item-content-2">
							<c:if test="${house.elevator == 1}">
								<div style="float:left;text-align:center;">
								<img src="../resources/images/elevator.png" width="50px" height="50px">
								<p>엘레베이터</p>
								</div>
							</c:if>
							<c:if test="${house.veranda == 1}">
								<div style="float:left; padding-left:10px;text-align:center;">
								<img src="../resources/images/veranda.png" width="50px" height="50px">
								<p>베란다</p>
								</div>
							</c:if>
							<c:if test="${house.parking == 1}">
								<div style="float:left; padding-left:10px;text-align:center;">
								<img src="../resources/images/parking.png" width="50px" height="50px">
								<p>주차장</p>
								</div>
							</c:if>
						</div>
					</li>
					<li>
						<div class="item_type">기타옵션</div>
						<div>${house.optionitem}</div>
					</li>				
				</ul>
			</div>
		</div>
	</div>
	<div class="main-content-inner2">
		<div class="detail-content">
			<span style="font-size:30px;"><b>위치</b></span>
			<div class="detail-content-address"><b>${house.address1}${house.address2}${house.address3}</b></div>
			<div id="map" style="width: 100%; height: 350px;"></div>
		</div>
	</div>
	<div class="main-content-inner2">
		<div class="detail-content">
			<span style="font-size:30px;"><b>상세 설명</b></span>
			<div class="detail-title">
				<div class="market_title"><b>${house.market_title}</b></div>
				<%-- <div class="market_content">${house.market_content}</div> --%>
				<div class="market_content">${noneTag}</div>
			</div>
		</div>
		<!-- 실험 -->
		<div id="writeEditor" style="display: none;"></div> 
		<!-- ///////////// -->
 
    <div id="modal" class="modal_Wrap">
        <div class="modal_Content">
        <span class="close">&times;</span>
        <div style="padding-top:30px; p">
        
        <form action="payment.do" id="paymentData_btn" name="paymentData_btn" method="post">
        	<input type="hidden" name="sum_price" value=""> 
        	<input type="hidden" name="market_num" value="${house.market_num}">
        	<ul>
        		<li style="text-align:center;padding-bottom:40px;"><strong>간편예약</strong></li>
        		<li style="padding-bottom:10px">
        		<b style="font-size:20px;">호스팅 위치</b><br>
        		<div style="font-size:16px;padding-top:10px;">
        		<span id="address1">${house.address1}<img src="../resources/images/check.png" width="20px" height="20px" style="padding-left:5px;"><br></span>
        		${house.address2}동${house.address3}호
        		</div>
        		</li>
        		<li style="padding-top:20px;"><label>호스텔 이름</label><b>${house.market_title}</b></li>
        		
        		<li style="padding-top:30px;">
        			<b style="font-size:20px">체크인 : </b><input class="hostcheck" type="text" name="startdate" id="startdate" onchange="call()">부터<br>   
					<b style="font-size:20px">종료일 : </b><input class="hostcheck" type="text" name="enddate" id="enddate" onchange="call()">까지
				</li>
        		<li style="padding-top:60px;">
        			<ul>
	        			<li style="float:left;">
	        			<b style="font-size:24px;">총 합계</b> <div id="data"></div>
	        			</li>
	        			<li style="text-align:right;">
	        			<b style="font-size:24px;">₩54000000</b>
	        			</li>
        			</ul>		
        		</li>
			<!-- <li>
        		일차이 계산 : <input type="text" id="days" size="6" style="text-align:center;">
        		</li> -->
        		<li style="padding-top:40px;">
        		<input style="font-size:24px;
							width:300px;
							height:45px;
							background-color:#0092db;
							border:0.1px solid #0092db;
							color:#fff;
							font-weight: bold;
							border-radius: 12px;" 
							class="quickbtn" onclick="iamport()" type="button" value="바로 예약">
        		</li>
        		<li><input type="submit" value="임시구매"></li>
        	</ul>
        </form>
        </div>
        </div>
        
    </div>
		<!-- ///////////// -->
		
		
	</div>
</div>
<script>
	//모달창
	const modal = document.getElementById('modal');
	const button = document.getElementById('btn');
	const span = document.querySelector('.close');
	
	button.onclick = function() {
	    modal.style.display = 'block';
	}
	span.onclick = function() {
	    modal.style.display = 'none';
	}
	window.onclick = function(event) {
	    if(event.target == modal) {
	        modal.style.display = 'none';
	    }
	}     
</script>
<script>
//카카오 지도
let address1 = document.getElementById('address1').innerText;
let address2 = "${house.address2}";

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch(address1, function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">${house.address2}동${house.address3}호</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});      
</script>
