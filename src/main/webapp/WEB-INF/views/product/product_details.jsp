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
                                <li class="breadcrumb-item"><a href="#">Shop</a></li>
                                <li class="breadcrumb-item"><a href="#">상품보기</a></li>
                                <li class="breadcrumb-item active" aria-current="page">${productVO.product_name }</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-7">
                    	<div class="single_product">
                    		<img src="${contextPath }/download.do?product_code=${productVO.product_code}&imageFileName=${productVO.image_file_name}">
                    	</div>
                    </div>
                    <div class="col-12 col-lg-5">
                        <div class="single_product_desc">
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <p class="product-price">$${productVO.product_price }</p>
                                <a href="product-details.html">
                                    <h6>${product_code }</h6>
                                </a>
                                <!-- Ratings & Review -->
                                <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                    <div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    </div>
                                    <div class="review">
                                        <a href="#">Write A Review</a>
                                    </div>
                                </div>
                                <!-- Avaiable -->
                                <p class="avaibility"><i class="fa fa-circle"></i> In Stock</p>
                            </div>

                            <div class="short_overview my-5">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid quae eveniet culpa officia quidem mollitia impedit iste asperiores nisi reprehenderit consequatur, autem, nostrum pariatur enim?</p>
                            </div>

                            <!-- Add to Cart Form -->
                            <div class="cart clearfix">
                                <div class="cart-btn d-flex mb-50">
                                    <p>Qty</p>
                                    <div class="quantity">
                                        <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-caret-down" aria-hidden="true"></i></span>
                                        <input type="number" class="qty-text" id="qty" step="1" min="1" max="300" name="quantity" value="1">
                                        <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                                    </div>
                                </div>
                                <button type="button" name="addtocart" class="btn amado-btn" onclick="add_cart('${productVO.product_code}');">Add to cart</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Details Area End -->
    
    <script>
	 // ajax 이용하여 카트에 담기
		function add_cart(product_code) {
		 console.log('상품코드: ',product_code)
		 	var qty = document.getElementById('qty').value;
			if(${isLogOn == true && member != null }){
				$.ajax({
	    			type: "post",
	    			async: true, //false인 경우 동기식으로 처리한다.
	    			url: "${contextPath}/cart/addProductInCart.do",
	    			data: {
	    				product_code: product_code,
	    				cart_product_qty : qty
	    				},
	    			success: function(data, textStatus) {
	    				if(data.trim() == 'add_success') {
	    					// modal 사용
	    					$('#successModal').modal('show');
	    				} else if(data.trim() == 'already_existed') {
	    					// modal 사용
	    					$('#failureModal').modal('show');
	    				}
	    			},
	    			error: function(data, textStatus) {
	    				alert("에러가 발생했습니다."+data);
	    			},
	    			complete: function(data, textStatus) {
	    				//alert("작업을 완료했습니다.");
	    			}
	    		})
			} else {
				alert("로그인후 장바구니에 담을 수 있습니다.");
			}
		} //end ajax
    	
    </script>

</body>

</html>