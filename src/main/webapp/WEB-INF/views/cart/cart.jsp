<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="cart" value="${cartMap.myCartList }" />
<c:set var="img" value="${cartMap.myProductList }" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Amado - Furniture Ecommerce Template | Cart</title>

    <!-- Favicon  -->
    <link rel="icon" href="${contextPath}/resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="${contextPath}/resources/css/core-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/style.css">

</head>

<body>
    <!-- Search Wrapper Area Start -->
    <div class="search-wrapper section-padding-100">
        <div class="search-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-content">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="Type your keyword...">
                            <button type="submit"><img src="${contextPath}/resources/img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

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
                    <li><a href="${contextPath}/shop.do">Shop</a></li>
                    <li><a href="${contextPath}/product-details.do">Product</a></li>
                    <li><a href="${contextPath}/cart.do">Cart</a></li>
                    <li><a href="${contextPath}/checkout.do">Checkout</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="#" class="btn amado-btn mb-15">%Discount%</a>
                <a href="#" class="btn amado-btn active">New this week</a>
            </div>
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-100">
                <a href="cart.html" class="cart-nav"><img src="${contextPath}/resources/img/core-img/cart.png" alt=""> Cart <span>(0)</span></a>
                <a href="#" class="fav-nav"><img src="${contextPath}/resources/img/core-img/favorites.png" alt=""> Favourite</a>
                <a href="#" class="search-nav"><img src="${contextPath}/resources/img/core-img/search.png" alt=""> Search</a>
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

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="cart-title mt-50">
                            <h2>Shopping Cart</h2>
                        </div>

                        <div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="cart" items="${cartMap.myCartList }" varStatus="cnt">
                                		<c:set var="product" value="${cartMap.myProductList[cnt.index] }" />
                                		<tr>
	                                        <td class="cart_product_img">
	                                            <a href="#"><img src="${contextPath}/download.do?product_code=${product.product_code }&imageFileName=${product.image_file_name}" alt="Product"></a>
	                                        </td>
	                                        <td class="cart_product_desc">
	                                            <h5>${product.product_name }</h5>
	                                        </td>
	                                        <td class="price">
	                                            <span>$<span id="price${cnt.count }">${product.product_price*cart.cart_product_qty }</span></span>
	                                        </td>
	                                        <td class="qty">
	                                            <div class="qty-btn d-flex">
	                                                <p>Qty</p>
	                                                <div class="quantity">
	                                                    <span class="qty-minus" onclick="qty_minus(${cart.cart_id }, ${cnt.count }, ${product.product_price*cart.cart_product_qty })"><i class="fa fa-minus" aria-hidden="true"></i></span>
	                                                    <input type="number" class="qty-text" id="qty${cnt.count }" step="1" min="1" max="300" name="quantity" value="${cart.cart_product_qty }" onchange="change(${cart.cart_id }, this.value, ${product.product_price*cart.cart_product_qty })">
	                                                    <span class="qty-plus" onclick="qty_plus(${cart.cart_id }, ${cnt.count }, ${product.product_price*cart.cart_product_qty })"><i class="fa fa-plus" aria-hidden="true"></i></span>
	                                                </div>
	                                            </div>
	                                        </td>
	                                    </tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>Cart Total</h5>
                            <ul class="summary-table">
                                <li><span>subtotal:</span> <span id="subtotal">12</span></li>
                                <li><span>delivery:</span> <span>Free</span></li>
                                <li><span>total:</span> <span id="total"></span></li>
                            </ul>
                            <div class="cart-btn mt-100">
                                <a href="cart.html" class="btn amado-btn w-100">Checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

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
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->& Re-distributed by <a href="https://themewagon.com/" target="_blank">Themewagon</a>
</p>
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
    
    <script type="text/javascript">
    	var arr_total = new Array(); //각 상품 합계 담을 배열
    	var mod_price = "";
    	<c:forEach var="cart" items="${cartMap.myCartList }" varStatus="cnt">
    		<c:set var="product" value="${cartMap.myProductList[cnt.index] }" />
    			//각 상품 가격과 수량 곱해서 배열에 담기
    			arr_total.push(${product.product_price*cart.cart_product_qty});
    	</c:forEach>
    	var total_price = 0; // 총 금액 담을 변수
    	while(arr_total.length){
    		total_price += arr_total.pop(); //값 더하면서 배열 요소 삭제
    	}
    	console.log("total_price:", total_price, "arr_total:", arr_total);
    	$('#total, #subtotal').text('$'+total_price);; //최초 DB값을 계산한 총 금액
    	
    	function change(cart_id, qty, price){
    		//cart_id, qty : DB변경할 쿼리문에 들어갈 값
    		//price : DB수정후 view에서 가격 수정할 상품 1개 가격(금액 = 가격 * 수량)
    		
    		//ajax로 수량 변경
    		$.ajax({
	    		type : "post",
	    		async : true, //false인 경우 동기식으로 처리한다.
	    		url : "${contextPath}/cart/modifyCartQty.do",
	    		data : {
	    			cart_id:cart_id,
	    			cart_product_qty:qty
	    		},
	    		
	    		success : function(data, textStatus) {
	    			//alert(data);
	    			if(data.trim()=='modify_success'){
	    				//alert("수량을 변경했습니다!!");
	    			}else{
	    				alert("다시 시도해 주세요!!");
	    			}
	    			
	    		},
	    		error : function(data, textStatus) {
	    			alert("에러가 발생했습니다."+data);
	    		},
	    		complete : function(data, textStatus) {
	    			//alert("작업을완료 했습니다");
	    		}
	    	}); //end ajax	
	    	
    		<c:forEach var="cart" items="${cartMap.myCartList }" varStatus="cnt">
	    		<c:set var="product" value="${cartMap.myProductList[cnt.index] }" />
	    			//ajax로 수정후 다시 가격설정
	    			//각 상품별 금액합 구해서 값 넣어준다.
	    			var single_qty = document.getElementById('qty'+${cnt.count}).value;
	    			single_total = ${product.product_price}*single_qty;
	    			$('#price${cnt.count}').text(single_total);
	    			//각 상품별 합계 배열에 넣기
	    			arr_total.push(single_total);
	    	</c:forEach>
	    	console.log("")
	    	total_price = 0; //초기화
	    	while(arr_total.length){
	    		total_price += arr_total.pop(); //값 더하면서 배열 요소 삭제
	    	}
	    	$('#total, #subtotal').text('$'+total_price);
    	}
    	
		// 버튼 수량 변경
		function qty_minus(cart_id, count, price) {
			//cart_id, price : change 메소드에 넣어줄 매개변수
			//count: 클릭한 상품값 알기위한 값
			
			var effect = document.getElementById('qty'+count); //상품구분하기위해 count 사용
			var qty = effect.value; 
			//console.log('버튼 수량변경:', cart_id, qty, price);
			//1보다 큰 수에서만 실행
			if( !isNaN( qty ) && qty > 1 ) {
				effect.value--;
			}else{
				alert("최소수량입니다.");
				return false;
			}
			//DB 변경 메소드 실행
			change(cart_id, effect.value, price); //effect.value: 변경된 수량을 매개변수로 사용
		}
		
		function qty_plus(cart_id, count, price) {
			var effect = document.getElementById('qty'+count);
			var qty = effect.value;
			if( !isNaN( qty )) {
				effect.value++;
			} else {
				return false;
			}
			change(cart_id, effect.value, price); //effect.value: 변경된 수량을 매개변수로 사용
		}
		// end 버튼 수량 변경
		
    </script>

</body>

</html>