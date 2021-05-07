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
                                <li class="breadcrumb-item active" aria-current="page">새 글 쓰기</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
		            <div class="col-12">
		            
		            	<h2>게시판 글쓰기</h2>
		              
						<form action="${contextPath }/board/addNewArticle.do" method="post">
							<input type="hidden" name="id" value="${member.id }">
							<input type="text" name="boardTitle" class="form-control mt-4 mb-2"
								placeholder="제목을 입력해주세요." required
							>
							<div class="form-group">
								<textarea class="form-control" rows="10" name="boardContent"
									placeholder="내용을 입력해주세요" required
								></textarea>
							</div>
							<button type="submit" class="btn btn-secondary mb-3">등록</button>
						</form>
		                
		            </div>                    
		        </div>
		        
            </div>
        </div>
        <!-- Product Details Area End -->
    </div>
    <!-- ##### Main Content Wrapper End ##### -->
