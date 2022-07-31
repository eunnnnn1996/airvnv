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

