<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/statsstyles.css">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<body class="sb-nav-fixed">
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.html">
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
                                    <a class="nav-link" href="layout-static.html">회원정보</a>
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
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
             <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">회원관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">회원관리</a></li>
                            <li class="breadcrumb-item active">정지 및 탈퇴</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                회원의 정보를 확인할 수 있습니다. 회원정지 및 탈퇴처리가 가능하며 탈퇴처리가 되어도 회원정보는 보관이 가능합니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                회원 목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                        	<th>회원번호</th>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                            <th>주소</th>
                                            <th>나이</th>
                                            <th>가입일</th>
                                            <th>유저상태</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th>회원번호</th>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                            <th>주소</th>
                                            <th>나이</th>
                                            <th>가입일</th>
                                            <th>유저상태</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach var="user" items="${list}" varStatus="status">
                                        <tr>
                                        	<td>${user.user_num}</td>
                                            <td>${user.user_name}</td>
                                            <td>${user.phone}</td>
                                            <td>${user.address1} ${user.address2}</td>
                                            <td>18살</td>
                                            <td>${user.reg_date}</td>
                                            <td>
                                            	<form action="authChange.do" id="authChangeForm" method="get">
	                                            	<input type="hidden" id="user_num" name="user_num" value="${user.user_num}">
		                                            <select name="user_auth" id="user_auth" class="user_auth${status.index}">
												       <option value="0" <c:if test="${user.user_auth == 0}">selected</c:if>>탈퇴</option>
			                                           <option value="1" <c:if test="${user.user_auth == 1}">selected</c:if>>정지</option>
			                                           <option value="2" <c:if test="${user.user_auth == 2}">selected</c:if>>활동중</option>
			                                           <option value="3" <c:if test="${user.user_auth == 3}">selected</c:if>>운영진</option>
													</select>
													<input type="submit" id="changeForm-btn${status.index}" class="changeForm-btn" value="전송">
	                                            </form>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/datatables-simple-demo.js"></script>
        <script>
       $(function(){
    	   
    	const nowauth = $("[class^='user_auth'] option:selected").val();
        const indexnum = $("[id^='indexnum']").val();
        
	       	   $("[class^='user_auth']").change(function() {
	        		if (confirm("정말 바꾸시겠습니까?") == true){    //확인
	        			$("[id^='changeForm-btn']").click();
	        		     document.removefrm.submit();
	        			
	        		 }else{   									//취소
	        			 $("[class^='user_auth']").val(nowauth);
	        		     return false;
	        		 }
	        	});	
        });
        </script>
    </body>