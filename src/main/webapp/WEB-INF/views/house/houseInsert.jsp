<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/house.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3dccf85e0bda66300f299b635dec74c&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/house/houseInsert.js"></script>
<!-- lottie 애니메이션 임포트 -->
<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<!-- ckedior 라이브러리 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ckeditor_style.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/uploadAdapter.js"></script>


<script>
CKEDITOR.editorConfig = function(config) {
	  config.disallowedContent = 'img';
	};
</script>

<div class="market-main">
	<div class="market-title"><b>방 내놓기</b></div>
	<div class="market-content-first">
		<p><b>1.</b> 숙소를 등록할 수 있습니다.</p>
		<p><b>2.</b> 글 등록 후 관리자의 승인 후 보여집니다.</p>
		<p><b>3.</b> 3~5일 후 승인</p>
		<p><b>4.</b> 1개의 매물만 등록 가능합니다</p>
	</div>
	<div class="market-content-second">
		<div class="market-title2"><b>매물 종류</b></div>
	</div>
	
	<form:form id="write_form" modelAttribute="houseVO" action="houseInsert.do" enctype="multipart/form-data">
	
	<div class="market-content-third">
		<div class="third-title"><span class="sort-choice"><div class="sort-content">종류 선택</div></span></div>
		<div class="third-radio">
			<label class="radio-label1"><span>호텔</span>
			<form:radiobutton onclick="test()" class="type-btn" path="market_type" value="1"/>
			</label>
			<label class="radio-label2"><span>펜션</span>
			<form:radiobutton onclick="test()" class="type-btn" path="market_type" value="2"/>
			</label>
			<label class="radio-label3" style="width:160px;"><span style="padding-left:18px;">게스트하우스</span>
			<form:radiobutton onclick="test()" class="type-btn" path="market_type" value="3"/>
			</label>
			<label class="radio-label4"><span style="padding-left:20px">아파트</span>
			<form:radiobutton onclick="test()" class="type-btn" path="market_type" value="4"/>
			</label>
			<label class="radio-label5"><span>기타</span>
			<form:radiobutton onclick="test()" class="type-btn" path="market_type" value="5"/>
			</label>
		</div>
	</div>
	<hr class="title-hr">
		<div class="market-gps-second">
			<div class="market-gps"><b>위치 정보</b>
				<span><b>*등기부등본 상의 주소를 입력해 주세요.</b></span>
			</div>
		</div>
		<div class="market-content-four">
		<div class="four-title"><span class="sort-choice"><div class="sort-four-content">주소</div></span></div>
		
		<ul>
		<li>
		<div class="four-gpscon">		
			<p style="font-size:16px;margin-bottom:20px; width:380px">도로명,건물명,지번에 대해 통합검색이 가능합니다.</p>
		</div>
		</li>
		<li>
			<form:input class="address-input" id="sample5_address" onclick="sample5_execDaumPostcode()" path="address1" placeholder="주소" readonly="true"/><br>
			<form:errors path="address1" cssClass="error-color"/>
		</li>
		<li id="country-input">
			<input class="address-btn" id="add-btn" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
		</li>
		<li>
			<form:input class="address-input-first" id="address1-1" path="address2" placeholder="동"/><br>
			<form:errors path="address2" cssClass="error-color"/>
		</li>
		<li>
			<form:input class="address-input" id="address1-2" path="address3" placeholder="호수"/><br>
			<form:errors path="address3" cssClass="error-color"/>
		</li>
		</ul>
		<div id="map" class="kakaomap"></div> <!-- 카카오 지도 위치  -->
		<div class="country-btn"><p class="country-btn-p">해외 주소라면 여기를 클릭!</p></div>
		</div>		
			
		<div class="market-content-second">
			<div class="market-title2"><b>거래 정보</b></div>
		</div>
		<div class="market-content-third">
			<div class="third-title"><span class="sort-choice"><div class="sort-content">거래 종류</div></span></div>
		
		<div class="third-radio">
			<label class="radio-trade1" style="width:130px;"><span>현장결제</span>
			<form:radiobutton onclick="test2()" class="type-btn" path="trade_type" value="1"/>
			</label>
			<label class="radio-trade2" style="width:160px;"><span>온라인결제</span>
			<form:radiobutton onclick="test2()" class="type-btn" path="trade_type" value="2"/>
			</label>
			<div class="long-check">
			<form:checkbox class="s-checkbox" path="trade_short" value="1"/>
			</div>
			<b style="padding-top:3px;font-size:15px">장기가능</b>
			<form:hidden path="trade_short" value="2"/>
			
			<div>
				<span style="font-size:20px;margin-left:80px">하루가격</span>
				<form:input style="margin-left:15px;width:150px;padding-left:10px;" class="otherpay-sty" path="otherpay" type="number" min="0" placeholder="하루 가격"/><br>
				<form:errors path="otherpay" cssClass="error-color"/>
			</div>
			
		</div>	
		</div>
		
		<div class="market-content-second">
			<div class="market-title2"><b>옵션</b></div>
		</div>
		<div class="market-content-third">
			<div class="third-title"><span class="sort-choice"><div class="sort-content">옵 션</div></span></div>
			
			<div style="padding-left:20px;">
			<div style="padding-top:25px;">
			
			<div style="height:30px;">
				<form:checkbox class="s-checkbox" path="elevator" value="1"/>
				<b style="padding-top:3px;font-size:18px">베란다</b>
			</div>
			<div style="height:30px;">
			<form:hidden path="elevator" value="2"/>
			<form:checkbox class="s-checkbox" path="parking" value="1"/> 
			<b style="padding-top:3px;font-size:18px">주차</b>
			</div>
			<form:hidden path="parking" value="2"/>
			<form:checkbox class="s-checkbox" path="veranda" value="1"/> <b style="padding-top:3px;font-size:18px">엘리베이터</b>
			<form:hidden path="veranda" value="2"/><br>
			</div>
			</div>
			
			
			<div style="width:300px; padding-left:250px;padding-top:15px">
			<b style="font-size:20px;">옵션 기타설명</b> 
			<form:textarea class="option-otherarea" path="optionitem" cols="50" rows="30"
			placeholder="ex)방은 4개 있고요. 청소비는 따로입니다"/>
			</div>
		</div>
		
		
		<div class="image-content">
		<input type="file" name="upload" id="upload" onchange="readURL(this);" style="display:none;">
		<form:errors path="upload" cssClass="error-color"/>
		<img class="imageview" id="preview" 
						onclick="handleButtonOnclick()" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTymfFz-TzyZCEwZG8OCDnvA_WBaMEQf2CkhA&usqp=CAU" />
		
		<div class="task-tooltip">
    		처음으로 보여질 대표이미지를 선택해주세요!
  		</div>			
		
		<form:input id="market_title" class="cktitle" path="market_title" placeholder="제목을 입력하세요"/>
		<form:errors path="market_title" cssClass="error-color"/>
		<form:textarea path="market_content"/>
		<form:errors path="market_content" cssClass="error-color"/>
		</div>
		<div style="text-align:center;">
			<form:button id="signbtncheck" class="sign-btn">등록</form:button>
		</div>
	</form:form>
</div>

<script>
function handleButtonOnclick() {
	document.getElementById('upload').click();
}
</script>

<script>
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
</script>

<script>
  	 function test() {
		$("[class*='radio-label']").css('background-color','white');
		$("[class*='radio-label']").css('color','black');
		
        var obj_value = $("input:radio[name='market_type']:checked").val();     
        $('.radio-label'+obj_value).css('background-color','#0092db');
        $('.radio-label'+obj_value).css('color','#fff');
    }  	 
    function test2() {
    	
    	$("[class*='radio-trade']").css('background-color','white');
    	$("[class*='radio-trade']").css('color','black');
    	var obj_value = $("input:radio[name='trade_type']:checked").val();
    	
    	$('.radio-trade'+obj_value).css('background-color','#0092db');
    	$('.radio-trade'+obj_value).css('color','#fff');
    }
 
    
    /* const address1 = document.getElementById('address1').value; */
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }

</script>

<!-- 우편번호 스크립트 시작 -->
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	document.getElementById('address1').readOnly = true;
	document.getElement
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    //(주의)address1에 참고항목이 보여지도록 수정
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //(수정) document.getElementById("address2").value = extraAddr;
                
                } 
                //(수정) else {
                //(수정)    document.getElementById("address2").value = '';
                //(수정) }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
				document.getElementById('zipcode').readOnly=true;
                //(수정) + extraAddr를 추가해서 address1에 참고항목이 보여지도록 수정
                document.getElementById("address1").value = addr + extraAddr;
				document.getElementById('address1').readOnly=true;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }	
</script>
<!-- 우편번호 스크립트 끝 -->