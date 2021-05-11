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
<html lang="ko">
<head>

</head>
<body>

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="index.html"><img src="${contextPath}/resources/img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

        <!-- Header Area Start -->
        <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="${contextPath}/index.do"><img src="${contextPath}/resources/img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li class="active"><a href="${contextPath}/index.do">Home</a></li>
                    <li><a href="${contextPath}/product/shop.do">Shop</a></li>
                    <li><a href="${contextPath}/board/boardList.do">Board</a></li>
                    <li><a href="${contextPath}/cart/cart.do">Cart</a></li>
                    <li><a href="${contextPath}/checkout.do">Checkout</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <c:if test="${isLogOn == true && member != null && member.id == 'admin' }">
                	 <a href="${contextPath}/product/product_add.do" class="btn amado-btn mb-15">상품추가</a>
                </c:if>
                <a href="#" class="btn amado-btn active">New this week</a>
            </div>
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-100">
            	<c:choose>
            		<c:when test="${isLogOn == true && member != null }">
            			<h4 class="text-center">환영합니다. </br>${member.id}님</h4>
            			<a href="${contextPath }/member/logout.do"><img src="${contextPath}/resources/img/core-img/logout.png" alt=""> 로그아웃 </a>
            		</c:when>
            		<c:otherwise>
            			<a href="${contextPath }/member/login.do"><img src="${contextPath}/resources/img/core-img/login.png" alt=""> 로그인 </a>
            		</c:otherwise>
            	</c:choose>
                <a href="cart.html" class="cart-nav"><img src="${contextPath}/resources/img/core-img/cart.png" alt=""> Cart </a>
                <a href="${contextPath}/cart/cart.do" class="fav-nav"><img src="${contextPath}/resources/img/core-img/favorites.png" alt=""> Favourite</a>
                <%-- <a href="#" class="search-nav"><img src="${contextPath}/resources/img/core-img/search.png" alt=""> Search</a> --%>
            </div>
            <!-- Social Button -->
            <div class="social-info d-flex justify-content-between">
                <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
        </header>
        <!-- Header Area End -->
