<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
  <head>
    <title><tiles:insertAttribute name="title" /></title>
    <tiles:insertAttribute name="header"/>
  </head>
  <body>
    <div class="main-content-wrapper d-flex clearfix">
      <tiles:insertAttribute name="side"/>
      <tiles:insertAttribute name="body"/>
    </div>
    <tiles:insertAttribute name="footer"/>
    
    <!-- Modal area start -->
    
    <!-- cart add success-->
	<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">장바구니 담기</h5>
	        <button type="button" data-dismiss="modal" aria-label="Close">
	        	<img src="${contextPath}/resources/img/core-img/close.png" id="close" />
	        </button>
	      </div>
	      <div class="modal-body">
	      	<p class="text-center">선택한 상품이 장바구니에 상품이 담겼습니다.</p>
	      </div>
	      <div class="modal-footer">
	        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">쇼핑 계속하기</button> -->
	        <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/cart/cart.do'">장바구니 이동</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal">쇼핑 계속하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- cart add fail -->
	<div class="modal fade" id="failureModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">장바구니 담기</h5>
	        <button type="button" data-dismiss="modal" aria-label="Close">
	        	<img src="${contextPath}/resources/img/core-img/close.png" id="close" />
	        </button>
	      </div>
	      <div class="modal-body">
	      	<p class="text-center">이미 장바구니에 등록된 상품입니다.</p>
	      </div>
	      <div class="modal-footer">
	        <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">쇼핑 계속하기</button> -->
	        <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/cart/cart.do'">장바구니 이동</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal">쇼핑 계속하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal area end -->
    
  </body>
</html>