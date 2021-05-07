<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">

<head>
</head>

<body>

        <!-- Product Details Area Start -->
        <div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mt-50">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Board</a></li>
                                <li class="breadcrumb-item active" aria-current="page">BoardList</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
		            <div class="col-12">
		              
		              <table class="table text-center">
		                <colgroup>
		                  <col style="width:5%;" />
		                  <col style="width:auto;" />
		                  <col style="width:15%;" />
		                  <col style="width:10%;" />
		                  <col style="width:10%;" />
		                </colgroup>
		                <thead class="table-light">
		                  <tr>
		                    <th scope="col">NO</th>
		                    <th scope="col">글 제목</th>
		                    <th scope="col">작성자</th>
		                    <th scope="col">조회수</th>
		                    <th scope="col">작성일</th>
		                  </tr>
		                </thead>
		                <tbody>
		                	<c:choose>
		                		<c:when test="${boardList == null }">
		                			<!-- 게시글 없는 경우 -->
			                		<tr>
			                			<td colspan="4"><p align="center">등록된 글이 없습니다.</p></td>
			                		</tr>
			                	</c:when>
			                	<c:otherwise>
			                		<!-- 게시글 있는 경우 -->
			                		<c:forEach var="boardList" items="${boardList }">
			                			<tr>
			                				<td>${boardList.boardSeq }</td>
			                				<td><a href="${contextPath}/board/articleRead.do?boardSeq=${boardList.boardSeq }">${boardList.boardTitle }(${boardList.replyCnt })</a></td>
			                				<td>${boardList.id }</td>
			                				<td>${boardList.viewCnt }</td>
			                				<td>${boardList.regDate }</td>
			                			</tr>
			                		</c:forEach>
			                	</c:otherwise>
		                	</c:choose>
		                </tbody>
		              </table>
		                
		            </div>                    
		        </div>
		        
		        <!-- 글 쓰기 페이지 이동 -->
		        <div>
		        	<a class="cls1" href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do', 
                                                    '${contextPath}/member/login.do')"><p class="cls2">글쓰기</p></a>
		        </div>
		        
                <!-- start 페이지 번호 선택 -->
                <div class="row">
                    <div class="col-12">
                        <nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                                <c:if test="${pagination.prev}">
								<li class="page-item"><a class="page-link" href="#"
									onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">이전</a></li>
								</c:if>
								
								<!-- 페이지 번호 forEach -->
								<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}"
									var="idx">
									<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
										<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
									</li>
								</c:forEach>
						
								<c:if test="${pagination.next}">
									<li class="page-item">
									<a class="page-link" href="#" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">다음</a></li>
								</c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- end 페이지 번호 선택 -->
		        
            </div>
        </div>
        <!-- Product Details Area End -->
    </div>
    <!-- ##### Main Content Wrapper End ##### -->
    
    <script>
		//이전 버튼 이벤트
		function fn_prev(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;		
	
			var url = "${contextPath}/board/boardList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
	
			location.href = url;
		}
	
	  	//페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {
			var url = "${contextPath}/board/boardList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
	
			location.href = url;	
		}
	
		//다음 버튼 이벤트
		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
	
			var url = "${contextPath}/board/boardList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;		
	
			location.href = url;
		}
		
		//글 쓰기 페이지 이동
		//글작성시 session에 isLogOn 으로 로그인 여부 확인.
		//비로그인시 로그인창으로 보내고 로그인완료시 글작성창으로 보냄(action값을 같이 넘긴다)
		function fn_articleForm(isLogOn, articleForm, loginForm) {
			if (isLogOn != '' && isLogOn != 'false') {
				location.href = articleForm;
			} else {
				alert("로그인 후 글쓰기가 가능합니다.")
				location.href = loginForm + '?action=/board/articleForm.do';
			}
		}
    	
    </script>

    <!-- ##### Newsletter Area Start ##### -->
    <section class="newsletter-area section-padding-100-0">
        <div class="container">
            <div class="row align-items-center">
                <!-- Newsletter Text -->
                <div class="col-12 col-lg-6 col-xl-7">
                    <div class="newsletter-text mb-100">
                        <h2>Subscribe for a <span>25% Discount</span></h2>
                        <p>Nulla ac convallis lorem, eget euismod nisl. Donec in libero sit amet mi vulputate consectetur. Donec auctor interdum purus, ac finibus massa bibendum nec.</p>
                    </div>
                </div>
                <!-- Newsletter Form -->
                <div class="col-12 col-lg-6 col-xl-5">
                    <div class="newsletter-form mb-100">
                        <form action="#" method="post">
                            <input type="email" name="email" class="nl-email" placeholder="Your E-mail">
                            <input type="submit" value="Subscribe">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Newsletter Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row align-items-center">
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-4">
                    <div class="single_widget_area">
                        <!-- Logo -->
                        <div class="footer-logo mr-50">
                            <a href="index.html"><img src="${contextPath}/resources/img/core-img/logo2.png" alt=""></a>
                        </div>
                        <!-- Copywrite Text -->
                        <p class="copywrite"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> & Re-distributed by <a href="https://themewagon.com/" target="_blank">Themewagon</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-8">
                    <div class="single_widget_area">
                        <!-- Footer Menu -->
                        <div class="footer_menu">
                            <nav class="navbar navbar-expand-lg justify-content-end">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#footerNavContent" aria-controls="footerNavContent" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                                <div class="collapse navbar-collapse" id="footerNavContent">
                                    <ul class="navbar-nav ml-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="index.html">Home</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="shop.html">Shop</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="product-details.html">Product</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="cart.html">Cart</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="checkout.html">Checkout</a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->
    
    <script>
		//이전 버튼 이벤트
		function fn_prev(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;		
	
			var url = "${contextPath}/board/boardList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
	
			location.href = url;
		}
	
	  	//페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, searchType, keyword) {
			var url = "${contextPath}/board/boardList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
	
			location.href = url;	
		}
	
		//다음 버튼 이벤트
		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
	
			var url = "${contextPath}/board/boardList.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;		
	
			location.href = url;
		}
		
		//글 쓰기 페이지 이동
		//글작성시 session에 isLogOn 으로 로그인 여부 확인.
		//비로그인시 로그인창으로 보내고 로그인완료시 글작성창으로 보냄(action값을 같이 넘긴다)
		function fn_articleForm(isLogOn, articleForm, loginForm) {
			if (isLogOn != '' && isLogOn != 'false') {
				location.href = articleForm;
			} else {
				alert("로그인 후 글쓰기가 가능합니다.")
				location.href = loginForm + '?action=/board/articleForm.do';
			}
		}
    	
    </script>

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="${contextPath}/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${contextPath}/resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="${contextPath}/resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="${contextPath}/resources/js/active.js"></script>

</body>

</html>