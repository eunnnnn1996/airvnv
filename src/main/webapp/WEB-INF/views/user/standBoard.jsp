<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
                                            <a class="nav-link" href="login.html">대기중</a>
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
                        <h1 class="mt-4">게시물관리</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">게시물관리</a></li>
                            <li class="breadcrumb-item active">승인 및 대기</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                게시물 상태를 확인할 수 있습니다. 대기중인 게시물은 승인을 통해 게시가 가능합니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                게시글 목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                           <th>게시회원번호</th>
                                            <th>게시자</th>
                                            <th>게시물번호</th>
                                            <th>제목</th>
                                            <th>주소</th>
                                            <th>가격</th>                                            
                                            <th>게시일자</th>
                                            <th>게시상태</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>게시회원번호</th>
                                            <th>게시자</th>
                                            <th>게시물번호</th>
                                            <th>제목</th>
                                            <th>주소</th>
                                            <th>가격</th>                                            
                                            <th>게시일자</th>
                                            <th>게시상태</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    	<c:forEach var="list" items="${list}">
	                                        <tr>
	                                            <td>${list.user_num}</td>
	                                            <td>${list.user_id}</td>
	                                            <td>${list.market_num}</td>
	                                            <td>${list.address1}</td>
	                                            <td>${list.price}</td>
	                                            <td>${list.market_title}</td>
	                                            <td>${list.reg_date}</td>
	                                            <td>
		                                            <form action="approve.do" id="authChangeForm" method="get">
	                                            	<input type="hidden" id="market_num" name="market_num" value="${list.market_num}">
		                                            <select name="show" id="show">
												       <option value="0" <c:if test="${list.show == 0}">selected</c:if>>대기중</option>
			                                           <option value="1" <c:if test="${list.show == 1}">selected</c:if>>승인</option>
													</select>
													<input type="submit" id="changeForm-btn" value="전송">
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
      /*   $(function(){
        	const nowauth = $("#show option:selected").val();
        	$("#show").change(function() {
        		if (confirm("정말 바꾸시겠습니까?") == true){    //확인
        			$("#changeForm-btn").click();
        		     document.removefrm.submit();
        			
        		 }else{   									//취소
        			 $("#show").val(nowauth);
        		     return false;
        		 }
        	});
        }); */
        </script>
    </body>