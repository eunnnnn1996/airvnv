<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/statsstyles.css">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<script>
$(function(){
	//메뉴 추가
	$('#menu-insert-btn').click(function(){
		var countryRadio = $("input[type=radio][name=countryRadio]:checked").val();
		$.ajax({
			url:'menuInsert.do',
			type:'post',
			data:{countryRadio:countryRadio},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){ // data는 서버가 리턴해준 데이터
					if(data.result=='fail'){
		               alert('변경할 메뉴를 선택 하세요');
		            }else if(data.result=='success'){
		            	acyncMovePageReply();
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
	//메뉴 삭제
	$('#menu-delete-btn').click(function(){
		var countryRadio = $("input[type=radio][name=countryRadio]:checked").val();
		$.ajax({
			url:'menuDelete.do',
			type:'post',
			data:{countryRadio:countryRadio},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){ // data는 서버가 리턴해준 데이터
					if(data.result=='fail'){
		               alert('변경할 메뉴를 선택 하세요');
		            }else if(data.result=='success'){
		            	acyncMovePageReply();
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
	//카테고리 추가
	$('#category-insert-btn').click(function(){
		var categoryInsert = $("#category-insert-input").val();
		$.ajax({
			url:'categoryInsert.do',
			type:'post',
			data:{categoryInsert:categoryInsert},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){ // data는 서버가 리턴해준 데이터
					if(data.result=='fail'){
		               alert('추가할 카테고리를 입력하세요');
		            }else if(data.result=='success'){
		            	acyncMovePageReply();
		            	$('#category-insert-input').val('');
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
function acyncMovePageReply(){
	$('.reload1').load(location.href+' .reload1');
	$('.reload2').load(location.href+' .reload2');
}
</script>
<body class="sb-nav-fixed">
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="${pageContext.request.contextPath}/main/main.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                홈
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                회원관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/user/userBoard.do">회원정보</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                게시물관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        게시물 승인
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="${pageContext.request.contextPath}/user/standBoard.do">대기중</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="${pageContext.request.contextPath}/user/menuAdd.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                메뉴 관리
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content" style="padding-left:300px;">
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">메뉴 관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">메뉴</a></li>
                            <li class="breadcrumb-item active">추가 및 삭제</li>
                        </ol>       
                        
                        <!-- 나라이름 추가하기 시작 -->
                        	<span style="float:left; padding-left:0;width:555px;height:20px;font-size:22px">추가된 국가이름 메뉴</span>
	                        <div id="card-ma" class="card mb-4" style="width:450px;margin: auto; clear:both;float:left;margin-top:45px;">
	                            <div id="card-body" class="card-body" style="width:450px;height:350px;overflow: auto;">
	                            	<!-- 변경구간 -->
	                            	<div class="reload1">
	                            	<c:forEach var="category" items="${clist}">
	                            	<c:if test="${category.category_onoff == 1}">      	
	                                <input class="radio-btn" type="radio" id="radio${category.category_num}" name="countryRadio" value="${category.category_name}"> 
	                                <label for="radio${category.category_num}" style="font-size:22px;">${category.category_name}</label><br>
	                                </c:if>	                                
	                                </c:forEach>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- 나라이름 추가하기 끝 -->
	                        <div style="width:50px;height:400px;float:left;margin:auto;padding-left:28px;padding-top:130px;">
		                        <input id="menu-insert-btn" type="button" value="추가"/>
		                        <input id="menu-delete-btn" type="button" value="삭제"/>
	                        </div>
	                    <span style="width:70px;height:20px;font-size:22px">삭제된 국가이름 메뉴</span>
                        <div id="card-maa" class="card mb-4" style="width:450px;margin: auto;margin-top:30px;">
                            <div class="card-body cardre" style="width:450px;height:350px;overflow: auto;">
                            	<!-- 변경구간 -->
                            	<div class="reload2">
                            	<c:forEach var="category" items="${clist}">
								<c:if test="${category.category_onoff == 2}">
                                <input class="radio-btn" type="radio" id="radio${category.category_num}" name="countryRadio" value="${category.category_name}"> 
                                <label for="radio${category.category_num}"style="font-size:23px;">${category.category_name}</label><br>
                                </c:if>
                                </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div style="float:left;clear:both">
                        <input type="text" id="category-insert-input" class="category-insert-input">
                        <input type="button" id="category-insert-btn" class="category-insert-btn" value="생성">
                        </div>
                        </div>
                    </div>                   
            </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/datatables-simple-demo.js"></script>
</body>