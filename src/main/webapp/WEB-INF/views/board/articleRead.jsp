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
                                <li class="breadcrumb-item active" aria-current="page">게시글 보기</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
		            <div class="col-12">
		              
		              <form action="">
		              	<table class="table text-center">
			              	<tr>
								<td class="list">글번호</td>
								<td><input type="text" value="${boardVO.boardSeq }" disabled /> <input type="hidden" name="articleNO" value="${boardVO.boardSeq}" /></td>
							</tr>
							<tr>
								<td class="list">작성자 아이디</td>
								<td><input type=text value="${boardVO.id }" name="writer" disabled /></td>
							</tr>
							<tr>
								<td class="list">제목</td>
								<td><input type=text value="${boardVO.boardTitle }" name="title" id="i_title" disabled /></td>
							</tr>
							<tr>
								<td class="list">내용</td>
								<td><textarea rows="20" cols="60" name="content" id="i_content" disabled />${boardVO.boardContent }</textarea></td>
							</tr>
			              </table>
		              </form>
		                
		            </div>                    
		        </div>
		        
            </div>
        </div>
        <!-- Product Details Area End -->

</body>

</html>