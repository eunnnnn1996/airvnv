<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
 <!-- 제이쿼리, css 임포트 -->   
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<script type="text/javascript">
	$(function(){
		
		//처음 화면에 보여지는 이미지 읽기
		let photo_path = $('.my-photo').attr('src');
		let my_photo;
		$('#upload').change(function(){
			my_photo = this.files[0];
			if(!my_photo){
				$('.my-photo').attr('src',photo_path);
				return;
			}
			
			if(my_photo.size > 1024 * 1024){
				alert(Math.round(my_photo.size/1024) 
						        + 'kbytes(1024kbytes까지만 업로드 가능)');
				$('.my-photo').attr('src',photo_path);
				$(this).val('');
				return;
			}
			
			//이미지 미리보기
			var reader = new FileReader();
			reader.readAsDataURL(my_photo);
			
			reader.onload=function(){
				$('.my-photo').attr('src',reader.result);
			};
		});//end of change
		
		//이미지를 서버에 전송
		$('#photo_submit').click(function(){
			if($('#upload').val()==''){
				alert('파일을 선택하세요!');
				$('#upload').focus();
				return;
			}
			
			//파일 전송
			var form_data = new FormData();
			form_data.append('upload',my_photo);
			
			$.ajax({
				url:'updateMyPhoto.do',
				type:'post',
				data:form_data,
				dataType:'json',
				contentType:false,
				enctype:'multipart/form-data',
				processData:false,
				success:function(param){
					if(param.result == 'logout'){
						alert('로그인 후 사용하세요!');
					}else if(param.result == 'success'){
						alert('프로필 사진이 수정되었습니다.');
						photo_path = $('.my-photo').attr('src');
						$('#upload').val('');
						$('#photo_btn').show();
					}else{
						alert('파일 전송 오류 발생');
					}
				},
				errror:function(){
					alert('네트워크 오류 발생');
				}
			});
		});//end of click
		
		$('#photo_reset').click(function(){
			$('.my-photo').attr('src',photo_path);
			$('#upload').val('');
			$('#photo_btn').show();
		});
		
	});
</script>

<div class="main-outer">
	<div class="main-inner">
		<div class="my-title"><b>MY 정보</b></div>
		<div class="my-menu">
			<ul style="display: inline-block;">
				<li><p><a href="${pageContext.request.contextPath}/user/myPage.do">내 정보</a></p></li>
				<li><p><a href="${pageContext.request.contextPath}/user/myPost.do">내가 올린 방</a></p></li>
				<li><p><a href="${pageContext.request.contextPath}/user/myReservation.do">내가 예약한 방</a></p></li>
				<li><p>내 후기</p></li>								
			</ul>
		</div>
		<div class="my-info">
			<ul style="display: inline-block;">
				<li>
					<c:if test="${empty user.photo_name}">
					<img src="${pageContext.request.contextPath}/resources/images/face.png"
					                     width="200" height="200" class="my-photo">
					
					</c:if>
					<c:if test="${!empty user.photo_name}">
					<img src="${pageContext.request.contextPath}/user/photoView.do"
					                     width="200" height="200" class="my-photo">
					</c:if>
				</li>
				<li>
					<div id="photo_choice">
						<input type="file" id="upload" accept="image/gif,image/png,image/jpeg" class="btn btn-outline-secondary" style="border:none;">
						<input type="button" value="전송" id="photo_submit" class="btn-black">
						<input type="button" value="취소" id="photo_reset" class="btn-black">
					</div>
				</li>
					<form:form modelAttribute="user" action="userUpdate.do" enctype="multipart/form-data">
				<li>
			        <p>아이디</p><br>
					<form:input class="my-con" path="user_id"/>
					<form:errors path="user_id" cssClass="error-color"/><br>
				</li>
				<li>
					<p>닉네임</p><br>
					<form:input class="my-con" path="user_name"/>
					<form:errors path="user_name" cssClass="error-color"/><br>
				</li>
				<li>
					<p style="padding-right:90px;">휴대폰번호</p><br>
					<form:input class="my-con" path="phone"/>
					<form:errors path="phone" cssClass="error-color"/><br>
				</li>
				<li>		
					<form:button>확인</form:button>
				</li>
					</form:form>	
				<li>
					<div class="modal-bg2">
					<div class="userDelete-modal">
						<img class="exit-img" src="${pageContext.request.contextPath}/resources/images/cross.png">
						<b class="del-title">정말 탈퇴하시겠습니까?</b> <br>
						<b class="del-title-sub">회원탈퇴를 신청하기전에 아래 안내 사항을 한번 더 확인해주세요.</b>
						<p>1. 회원 탈퇴 시, 현재 로그인된 아이디는 즉시 탈퇴 처리됩니다.</p>
						<p>2. 회원 탈퇴 시, 회원 전용 웹 서비스 이용이 불가합니다.</p>
						<p>3. 탈퇴 시 회원 정보 및 찜 서비스, 등록한 게시물 이용 기록이 모두 삭제됩니다.</p>
						<p>4. 회원 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
						<p>5. 광고를 위한 매물이 등록되어 있을 경우, 탈퇴 시 모든 정보는 삭제 처리됩니다.</p>
						<div class="delete-form">
							<form action="${pageContext.request.contextPath}/user/userDelete.do" method="post">
							  <input type="hidden" name="${user.user_num}">
							  <label style="font-size:16px">비밀번호</label>
							  <input class="delete-passwd" type="text" name="passwd">
							  <input type="submit" value="확인">
							</form>
						</div>
					</div>			
				</div>	
				<a class="userDelete-btn">회원탈퇴</a>
				</li>
			</ul>
		</div>
	</div>
</div>


<script>
	$(document).ready(function(){
		$(".userDelete-btn").click(function(){
			$(".modal-bg2").css({"display" : "block"});
			$(".userDelete-modal").css({"display" : "block"});
		})
		$(".exit-img").click(function(){
			$(".modal-bg2").css({"display" : "none"});
			$(".userDelete-modal").css({"display" : "none"});
		})
	});
</script>