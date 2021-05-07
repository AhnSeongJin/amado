<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page session="true" %> --%>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="안성진">
	<title>Insert title here</title>
	
    <!-- Favicon  -->
    <link rel="icon" href="${contextPath}/resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="${contextPath}/resources/css/core-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/style.css">
	
</head>
<body>