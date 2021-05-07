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
    <script type="text/javascript">
		function backToList(obj) {
			obj.action = "${contextPath}/board/listArticles.do";
			obj.submit();
		}
	
		//preview onchange
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
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
                                <li class="breadcrumb-item"><a href="#">Shop</a></li>
                                <li class="breadcrumb-item active" aria-current="page">상품 등록</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-4">
						<img id="preview" src="http://placehold.it/500x325" />
                    </div>
                    <div class="col-12 col-lg-8">
                        <div class="single_product_desc">
                        	<form name="frmReply" method="post" action="${contextPath}/product/addNewProduct.do" enctype="multipart/form-data">
							  <div class="form-group row">
							    <label for="product_code" class="col-sm-3 col-form-label text-center">상품코드</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="product_code" name="product_code" placeholder="상품코드" required>
							    </div>
							  </div>
							  <div class="form-group row">
							    <label for="product_name" class="col-sm-3 col-form-label text-center">상품명</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="product_name" name="product_name" placeholder="상품명" required>
							    </div>
							  </div>
							  <div class="form-group row">
							    <label for="product_price" class="col-sm-3 col-form-label text-center">제품가격</label>
							    <div class="col-sm-9">
							      <input type="text" class="form-control" id="product_price" name="product_price" placeholder="제품가격" required>
							    </div>
							  </div>
							  <div class="form-group row">
							    <label for="image_file_name" class="col-sm-3 col-form-label text-center">이미지파일 첨부</label>
							    <div class="col-sm-9">
							      <input type="file" class="form-control" id="image_file_name" name="image_file_name" onchange="readURL(this);" required>
							    </div>
							  </div>
							  <div class="form-group row">
							    <div class="col-sm-10 offset-sm-2">
							      <button type="submit" class="btn btn-primary">상품 등록</button>
							    </div>
							  </div>
							</form>                            

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Details Area End -->

</body>

</html>